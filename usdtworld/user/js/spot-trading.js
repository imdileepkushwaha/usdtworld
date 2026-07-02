(function () {
    var START_PRICE = 0.000139;
    var CURRENT_PRICE = 0.00040;
    var BASE_CANDLE_COUNT = 240;
    var TICK_MS = 60000;

    var state = {
        side: 'buy',
        price: CURRENT_PRICE,
        openPrice: CURRENT_PRICE,
        high24: CURRENT_PRICE * 1.05,
        low24: START_PRICE * 0.97,
        interval: 1,
        baseCandles: [],
        candles: [],
        chart: null,
        candleSeries: null,
        volumeSeries: null,
        tickTimer: null,
        trades: [],
        submitting: false
    };

    function byId(id) { return document.getElementById(id); }

    function getJq() { return window.jQuery || window.$; }

    function postWebMethod(method, data, onSuccess, onError) {
        var $jq = getJq();
        if (!$jq || !$jq.ajax) {
            var msg = 'Page is still loading. Please wait and try again.';
            if (onError) onError(msg);
            else alert(msg);
            return;
        }

        $jq.ajax({
            type: 'POST',
            url: 'SpotTrading.aspx/' + method,
            data: JSON.stringify(data || {}),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (res) {
                var payload = res && res.d ? res.d : res;
                if (onSuccess) onSuccess(payload || {});
            },
            error: function () {
                var msg = 'Request failed. Please try again.';
                if (onError) onError(msg);
                else alert(msg);
            }
        });
    }

    function formatPrice(value) {
        var n = Number(value) || 0;
        if (n >= 1) return '$' + n.toFixed(4);
        if (n >= 0.001) return '$' + n.toFixed(6);
        return '$' + n.toFixed(8);
    }

    function formatQty(value) {
        var n = Number(value) || 0;
        if (n >= 1000) return n.toFixed(2);
        if (n >= 1) return n.toFixed(4);
        return n.toFixed(6);
    }

    function formatPriceShort(value) {
        var n = Number(value) || 0;
        if (n >= 1) return n.toFixed(4);
        if (n >= 0.001) return n.toFixed(6);
        return n.toFixed(8);
    }

    function getUsdtBalance() {
        var hdn = byId('hdnUsdtBalance');
        var val = hdn ? parseFloat(hdn.value) : 0;
        return isNaN(val) ? 0 : val;
    }

    function getUwcBalance() {
        var el = byId('svSpotUwcBal');
        var val = el ? parseFloat(el.textContent.replace(/,/g, '')) : 0;
        return isNaN(val) ? 0 : val;
    }

    function formatTime(ts) {
        var d = new Date(ts * 1000);
        return d.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit' });
    }

    function randBetween(min, max) {
        return min + Math.random() * (max - min);
    }

    function aggregateCandles(baseList, intervalMin) {
        if (!baseList || !baseList.length) return [];
        if (intervalMin <= 1) {
            return baseList.map(function (c) {
                return { time: c.time, open: c.open, high: c.high, low: c.low, close: c.close, volume: c.volume };
            });
        }

        var bucketSec = intervalMin * 60;
        var buckets = {};
        var order = [];

        for (var i = 0; i < baseList.length; i++) {
            var c = baseList[i];
            var bucketTime = Math.floor(c.time / bucketSec) * bucketSec;
            var b = buckets[bucketTime];
            if (!b) {
                b = { time: bucketTime, open: c.open, high: c.high, low: c.low, close: c.close, volume: c.volume };
                buckets[bucketTime] = b;
                order.push(bucketTime);
            } else {
                b.high = Math.max(b.high, c.high);
                b.low = Math.min(b.low, c.low);
                b.close = c.close;
                b.volume += c.volume;
            }
        }

        order.sort(function (a, b) { return a - b; });
        return order.map(function (t) { return buckets[t]; });
    }

    function applyChartInterval() {
        state.candles = aggregateCandles(state.baseCandles, state.interval);
    }

    function candleToSeries(c) {
        return { time: c.time, open: c.open, high: c.high, low: c.low, close: c.close };
    }

    function candleToVolume(c) {
        return {
            time: c.time,
            value: c.volume,
            color: c.close >= c.open ? 'rgba(34, 197, 94, 0.45)' : 'rgba(239, 68, 68, 0.45)'
        };
    }

    function refreshChartData() {
        if (!state.candleSeries || !state.volumeSeries) return;
        state.candleSeries.setData(state.candles.map(candleToSeries));
        state.volumeSeries.setData(state.candles.map(candleToVolume));
        if (state.chart) state.chart.timeScale().fitContent();
    }

    function updateIntervalLabel() {
        var label = byId('svSpotIntervalLabel');
        var info = byId('svSpotInfoInterval');
        var infoText = state.interval === 1 ? '1 minute' : state.interval + ' minutes';
        if (label) {
            label.innerHTML = '<i class="fa-solid fa-chart-line"></i> Utility coin · ' + state.interval + 'm candles';
        }
        if (info) info.textContent = infoText;
    }

    function setChartInterval(minutes) {
        var min = parseInt(minutes, 10);
        if (min !== 1 && min !== 5 && min !== 15) min = 1;
        if (state.interval === min) return;

        state.interval = min;

        document.querySelectorAll('.sv-spot-interval').forEach(function (btn) {
            var btnMin = parseInt(btn.getAttribute('data-interval'), 10);
            btn.classList.toggle('is-active', btnMin === min);
        });

        applyChartInterval();
        refreshChartData();
        updateIntervalLabel();
        updateOhlc();
    }

    function buildSeedCandles() {
        var now = Math.floor(Date.now() / 1000);
        var interval = 60;
        var start = now - (BASE_CANDLE_COUNT * interval);
        var price = START_PRICE;
        var list = [];

        for (var i = 0; i < BASE_CANDLE_COUNT; i++) {
            var time = start + (i * interval);
            var progress = i / (BASE_CANDLE_COUNT - 1);
            var target = START_PRICE + ((CURRENT_PRICE - START_PRICE) * progress);
            var volatility = target * randBetween(0.008, 0.028);
            var open = price;
            var close = target + randBetween(-volatility, volatility);
            if (i === BASE_CANDLE_COUNT - 1) close = CURRENT_PRICE;
            var high = Math.max(open, close) + randBetween(0, volatility * 0.6);
            var low = Math.min(open, close) - randBetween(0, volatility * 0.6);
            low = Math.max(low, START_PRICE * 0.92);
            var volume = randBetween(12000, 85000);

            list.push({ time: time, open: open, high: high, low: low, close: close, volume: volume });
            price = close;
        }

        state.baseCandles = list;
        applyChartInterval();
        state.price = list[list.length - 1].close;
        state.openPrice = list[list.length - 1].open;
        state.high24 = Math.max.apply(null, list.map(function (c) { return c.high; }));
        state.low24 = Math.min.apply(null, list.map(function (c) { return c.low; }));
    }

    function pushLiveCandle() {
        var base = state.baseCandles;
        var last = base[base.length - 1];
        var time = last.time + 60;
        var open = last.close;
        var drift = open * randBetween(-0.018, 0.022);
        var close = Math.max(START_PRICE * 0.9, open + drift);
        var high = Math.max(open, close) + (open * randBetween(0, 0.012));
        var low = Math.min(open, close) - (open * randBetween(0, 0.012));
        low = Math.max(low, START_PRICE * 0.9);
        var volume = randBetween(10000, 90000);
        var candle = { time: time, open: open, high: high, low: low, close: close, volume: volume };

        base.push(candle);
        if (base.length > 360) base.shift();

        state.price = close;
        state.openPrice = open;
        state.high24 = Math.max.apply(null, base.slice(-1440).map(function (c) { return c.high; }));
        state.low24 = Math.min.apply(null, base.slice(-1440).map(function (c) { return c.low; }));

        applyChartInterval();
        var displayLast = state.candles[state.candles.length - 1];
        if (state.candleSeries && displayLast) {
            state.candleSeries.update(candleToSeries(displayLast));
        }
        if (state.volumeSeries && displayLast) {
            state.volumeSeries.update(candleToVolume(displayLast));
        }

        updateTicker();
        updateOrderPreview();
    }

    function updateOhlc() {
        var last = state.candles[state.candles.length - 1];
        if (!last) return;
        var o = byId('svSpotO');
        var h = byId('svSpotH');
        var l = byId('svSpotL');
        var c = byId('svSpotC');
        if (o) o.textContent = formatPriceShort(last.open);
        if (h) h.textContent = formatPriceShort(last.high);
        if (l) l.textContent = formatPriceShort(last.low);
        if (c) c.textContent = formatPriceShort(last.close);
    }

    function getChartSize(container) {
        var width = container.clientWidth || container.offsetWidth || 600;
        var height = container.clientHeight || container.offsetHeight || 480;
        if (height < 200) height = 480;
        return { width: width, height: height };
    }

    function resizeChart() {
        var container = byId('svSpotChart');
        if (!state.chart || !container) return;
        var size = getChartSize(container);
        state.chart.applyOptions({ width: size.width, height: size.height });
    }

    function initChart() {
        var container = byId('svSpotChart');
        if (!container) return;

        if (typeof LightweightCharts === 'undefined') {
            container.innerHTML = '<div class="sv-spot-chart-fallback">Loading chart library...</div>';
            window.setTimeout(initChart, 400);
            return;
        }

        container.innerHTML = '';
        var size = getChartSize(container);

        state.chart = LightweightCharts.createChart(container, {
            width: size.width,
            height: size.height,
            layout: {
                background: { color: '#070b14' },
                textColor: '#8896b0'
            },
            grid: {
                vertLines: { color: 'rgba(108, 99, 255, 0.08)' },
                horzLines: { color: 'rgba(108, 99, 255, 0.08)' }
            },
            rightPriceScale: {
                borderColor: 'rgba(108, 99, 255, 0.15)',
                scaleMargins: { top: 0.12, bottom: 0.22 }
            },
            timeScale: {
                borderColor: 'rgba(108, 99, 255, 0.15)',
                timeVisible: true,
                secondsVisible: false
            },
            crosshair: {
                mode: LightweightCharts.CrosshairMode.Normal
            }
        });

        state.candleSeries = state.chart.addCandlestickSeries({
            upColor: '#22c55e',
            downColor: '#ef4444',
            borderUpColor: '#22c55e',
            borderDownColor: '#ef4444',
            wickUpColor: '#22c55e',
            wickDownColor: '#ef4444',
            priceFormat: {
                type: 'price',
                precision: 8,
                minMove: 0.00000001
            }
        });

        state.volumeSeries = state.chart.addHistogramSeries({
            priceFormat: { type: 'volume' },
            priceScaleId: '',
            scaleMargins: { top: 0.82, bottom: 0 }
        });

        state.candleSeries.setData(state.candles.map(candleToSeries));
        state.volumeSeries.setData(state.candles.map(candleToVolume));

        state.chart.timeScale().fitContent();

        window.addEventListener('resize', resizeChart);
        window.setTimeout(resizeChart, 100);
        window.setTimeout(resizeChart, 500);
    }

    function updateTicker() {
        var priceEl = byId('svSpotPrice');
        var changeEl = byId('svSpotChange');
        var highEl = byId('svSpotHigh');
        var lowEl = byId('svSpotLow');
        var updatedEl = byId('svSpotUpdated');
        var infoPrice = byId('svSpotInfoPrice');
        var launchGain = byId('svSpotLaunchGain');

        if (priceEl) priceEl.textContent = formatPrice(state.price);

        var changePct = state.openPrice ? ((state.price - state.openPrice) / state.openPrice) * 100 : 0;
        if (changeEl) {
            var up = changePct >= 0;
            var iconEl = changeEl.querySelector('.sv-spot-hero__change-icon');
            var textEl = changeEl.querySelector('.sv-spot-hero__change-text');
            var changeText = (up ? '+' : '') + changePct.toFixed(2) + '%';
            if (textEl) textEl.textContent = changeText;
            else changeEl.textContent = changeText;
            if (iconEl) {
                iconEl.className = 'fa-solid sv-spot-hero__change-icon ' + (up ? 'fa-caret-up' : 'fa-caret-down');
            }
            changeEl.className = 'sv-spot-hero__change ' + (up ? 'sv-spot-hero__change--up' : 'sv-spot-hero__change--down');
        }

        var launchPct = START_PRICE ? ((state.price - START_PRICE) / START_PRICE) * 100 : 0;
        if (launchGain) {
            var launchUp = launchPct >= 0;
            launchGain.textContent = (launchUp ? '+' : '') + launchPct.toFixed(2) + '%';
            launchGain.className = 'sv-spot-hero__footer-value ' + (launchUp ? 'sv-spot-hero__footer-value--up' : 'sv-spot-hero__footer-value--down');
        }

        if (highEl) highEl.textContent = formatPrice(state.high24);
        if (lowEl) lowEl.textContent = formatPrice(state.low24);
        if (updatedEl) updatedEl.textContent = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        if (infoPrice) infoPrice.textContent = formatPrice(state.price);
        updateOhlc();
    }

    function setBalances(usdt, uwc) {
        var usdtEl = byId('svSpotUsdtBal');
        var uwcEl = byId('svSpotUwcBal');
        if (usdtEl) usdtEl.textContent = formatQty(usdt);
        if (uwcEl) uwcEl.textContent = formatQty(uwc);

        var hdn = byId('hdnUsdtBalance');
        if (hdn) hdn.value = String(usdt);
    }

    function setOrderMsg(text, isError) {
        var el = byId('svSpotOrderMsg');
        if (!el) return;
        el.textContent = text || '';
        el.className = 'sv-spot-order-msg' + (text ? (isError ? ' sv-spot-order-msg--error' : ' sv-spot-order-msg--ok') : '');
    }

    function updateOrderPreview() {
        var amountInput = byId('txtSpotAmount');
        var amount = amountInput ? parseFloat(amountInput.value) : 0;
        var estPrice = byId('svSpotEstPrice');
        var receive = byId('svSpotReceive');
        var receiveLabel = byId('svSpotReceiveLabel');
        var amountLabel = byId('svSpotAmountLabel');
        var amountUnit = byId('svSpotAmountUnit');

        if (estPrice) estPrice.textContent = formatPrice(state.price);

        if (state.side === 'buy') {
            if (amountLabel) amountLabel.textContent = 'Amount';
            if (amountUnit) amountUnit.textContent = 'USDT';
            if (receiveLabel) receiveLabel.textContent = 'You receive';
            if (receive) {
                var coins = amount > 0 ? amount / state.price : 0;
                receive.textContent = formatQty(coins) + ' UWC+';
            }
        } else {
            if (amountLabel) amountLabel.textContent = 'Amount';
            if (amountUnit) amountUnit.textContent = 'UWC+';
            if (receiveLabel) receiveLabel.textContent = 'You receive';
            if (receive) {
                var usdt = amount > 0 ? amount * state.price : 0;
                receive.textContent = formatQty(usdt) + ' USDT';
            }
        }
    }

    function applyQuickAmount(pct) {
        var amountInput = byId('txtSpotAmount');
        if (!amountInput) return;

        var percent = Math.max(0, Math.min(100, pct)) / 100;
        var value = 0;

        if (state.side === 'buy') {
            value = getUsdtBalance() * percent;
        } else {
            value = getUwcBalance() * percent;
        }

        amountInput.value = value > 0 ? formatQty(value) : '';
        updateOrderPreview();
    }

    function setSide(side) {
        state.side = side === 'sell' ? 'sell' : 'buy';
        document.querySelectorAll('.sv-spot-order-tabs__btn').forEach(function (btn) {
            btn.classList.toggle('is-active', btn.getAttribute('data-side') === state.side);
        });

        var submit = byId('btnSpotSubmit');
        if (submit) {
            submit.className = 'sv-spot-submit ' + (state.side === 'buy' ? 'sv-spot-submit--buy' : 'sv-spot-submit--sell');
            submit.innerHTML = state.side === 'buy'
                ? '<i class="fa-solid fa-arrow-trend-up"></i> Buy UWC+'
                : '<i class="fa-solid fa-arrow-trend-down"></i> Sell UWC+';
        }

        updateOrderPreview();
        setOrderMsg('');
    }

    function seedRandomTrades(count) {
        var now = Math.floor(Date.now() / 1000);
        var list = [];
        var i;

        for (i = 0; i < count; i++) {
            var minutesAgo = randBetween(3, 175);
            var time = now - Math.floor(minutesAgo * 60);
            var side = Math.random() > 0.5 ? 'buy' : 'sell';
            var price = CURRENT_PRICE * randBetween(0.93, 1.07);
            price = Math.max(START_PRICE * 0.95, price);
            var totalUsdt = randBetween(12, 420);
            var coinAmount = totalUsdt / price;

            list.push({
                time: time,
                side: side,
                price: price,
                coinAmount: coinAmount,
                totalUsdt: totalUsdt
            });
        }

        list.sort(function (a, b) { return a.time - b.time; });
        state.trades = list;
    }

    function renderTrades() {
        var list = byId('svSpotTradeList');
        if (!list) return;

        if (!state.trades.length) {
            list.innerHTML =
                '<div class="sv-spot-trades-empty">' +
                    '<i class="fa-solid fa-arrows-rotate"></i>' +
                    '<p>No trades yet</p>' +
                    '<span>Your buy and sell orders will appear here</span>' +
                '</div>';
            return;
        }

        var html = '';
        for (var i = state.trades.length - 1; i >= 0; i--) {
            var t = state.trades[i];
            html +=
                '<div class="sv-spot-trade-row">' +
                    '<span>' + formatTime(t.time) + '</span>' +
                    '<span class="sv-spot-trade-row__side--' + t.side + '">' + t.side.toUpperCase() + '</span>' +
                    '<span>' + formatPrice(t.price) + '</span>' +
                    '<span>' + formatQty(t.coinAmount) + '</span>' +
                    '<span>' + formatQty(t.totalUsdt) + '</span>' +
                '</div>';
        }
        list.innerHTML = html;
    }

    function addTrade(res) {
        state.trades.push({
            time: Math.floor(Date.now() / 1000),
            side: res.side || state.side,
            price: parseFloat(res.price) || state.price,
            coinAmount: parseFloat(res.coinAmount) || 0,
            totalUsdt: parseFloat(res.totalUsdt) || 0
        });
        renderTrades();
    }

    function loadBalances() {
        postWebMethod('GetSpotState', {}, function (res) {
            if (!res.success) return;
            setBalances(res.usdtBalance || 0, res.uwcBalance || 0);
        });
    }

    function submitOrder() {
        if (state.submitting) return;

        var amountInput = byId('txtSpotAmount');
        var amount = amountInput ? parseFloat(amountInput.value) : 0;
        setOrderMsg('');

        if (!amount || amount <= 0) {
            setOrderMsg('Enter a valid amount.', true);
            return;
        }

        state.submitting = true;
        var btn = byId('btnSpotSubmit');
        if (btn) btn.disabled = true;

        postWebMethod('ExecuteSpotTrade', {
            side: state.side,
            amount: amount,
            price: state.price
        }, function (res) {
            state.submitting = false;
            if (btn) btn.disabled = false;

            if (!res.success) {
                setOrderMsg(res.message || 'Order failed.', true);
                return;
            }

            setBalances(res.usdtBalance || 0, res.uwcBalance || 0);
            setOrderMsg(res.message || 'Order filled.', false);
            if (amountInput) amountInput.value = '';
            addTrade(res);
            updateOrderPreview();
        }, function (err) {
            state.submitting = false;
            if (btn) btn.disabled = false;
            setOrderMsg(err, true);
        });
    }

    function bindEvents() {
        document.querySelectorAll('.sv-spot-order-tabs__btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                setSide(btn.getAttribute('data-side'));
            });
        });

        var amountInput = byId('txtSpotAmount');
        if (amountInput) {
            amountInput.addEventListener('input', updateOrderPreview);
        }

        var submit = byId('btnSpotSubmit');
        if (submit) submit.addEventListener('click', submitOrder);

        document.querySelectorAll('.sv-spot-quick-amt__btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                var pct = parseInt(btn.getAttribute('data-pct'), 10);
                if (!isNaN(pct)) applyQuickAmount(pct);
            });
        });

        document.querySelectorAll('.sv-spot-interval').forEach(function (btn) {
            btn.addEventListener('click', function () {
                setChartInterval(btn.getAttribute('data-interval'));
            });
        });
    }

    function startLiveTicks() {
        if (state.tickTimer) window.clearInterval(state.tickTimer);
        state.tickTimer = window.setInterval(pushLiveCandle, TICK_MS);
    }

    function init() {
        buildSeedCandles();
        initChart();
        updateTicker();
        updateIntervalLabel();
        setSide('buy');
        updateOrderPreview();
        bindEvents();
        seedRandomTrades(10);
        renderTrades();
        loadBalances();
        startLiveTicks();
        window.setTimeout(resizeChart, 800);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
