(function () {
    var MAX_BASE_CANDLES = 2400;
    var TICK_MS = 60000;
    var CONFIG_REFRESH_MS = 60000;
    var VISIBLE_RANGE_SEC = 86400;

    var marketConfig = {
        startPrice: 0.000139,
        targetPrice: 0.00040,
        durationMonths: 6,
        dailyIncreasePercent: 1.0,
        startDateMs: new Date(new Date().getFullYear(), 5, 15).getTime(),
        endDateMs: new Date(new Date().getFullYear(), 11, 15).getTime(),
        floorPrice: 0.000136,
        ceilingPrice: 0.000408,
        currentPrice: 0.00040
    };

    var state = {
        side: 'buy',
        price: marketConfig.currentPrice,
        openPrice: marketConfig.currentPrice,
        high24: marketConfig.currentPrice * 1.05,
        low24: marketConfig.startPrice * 0.97,
        interval: 15,
        baseCandles: [],
        candles: [],
        chart: null,
        candleSeries: null,
        volumeSeries: null,
        tickTimer: null,
        cryptoTimer: null,
        configTimer: null,
        candleStepMin: 1,
        trades: [],
        submitting: false,
        marketReady: false
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

    function parseConfigNumber(value, fallback) {
        var n = parseFloat(value);
        return isNaN(n) ? fallback : n;
    }

    function applyMarketConfig(payload) {
        if (!payload || !payload.success) return false;

        var startPrice = parseConfigNumber(payload.startPrice, marketConfig.startPrice);
        var targetPrice = parseConfigNumber(payload.targetPrice, marketConfig.targetPrice);
        var durationMonths = parseInt(payload.durationMonths, 10);
        if (isNaN(durationMonths) || durationMonths <= 0) durationMonths = marketConfig.durationMonths;

        var startDateMs = payload.startDate ? Date.parse(payload.startDate) : marketConfig.startDateMs;
        if (isNaN(startDateMs)) startDateMs = marketConfig.startDateMs;

        var endDateMs = payload.endDate ? Date.parse(payload.endDate) : (startDateMs + (durationMonths * 30 * 24 * 60 * 60 * 1000));
        if (isNaN(endDateMs)) endDateMs = startDateMs + (durationMonths * 30 * 24 * 60 * 60 * 1000);

        marketConfig.startPrice = startPrice;
        marketConfig.targetPrice = targetPrice;
        marketConfig.durationMonths = durationMonths;
        marketConfig.dailyIncreasePercent = parseConfigNumber(payload.dailyIncreasePercent, marketConfig.dailyIncreasePercent);
        marketConfig.startDateMs = startDateMs;
        marketConfig.endDateMs = endDateMs;
        marketConfig.floorPrice = parseConfigNumber(payload.floorPrice, Math.min(startPrice, targetPrice) * 0.98);
        marketConfig.ceilingPrice = parseConfigNumber(payload.ceilingPrice, Math.max(startPrice, targetPrice) * 1.02);
        marketConfig.currentPrice = parseConfigNumber(payload.currentPrice, fairPriceAtTime(Math.floor(Date.now() / 1000)));

        state.price = marketConfig.currentPrice;
        return true;
    }

    function fairPriceAtTime(tsSec) {
        var tMs = tsSec * 1000;
        if (tMs <= marketConfig.startDateMs) return marketConfig.startPrice;
        if (tMs >= marketConfig.endDateMs) return marketConfig.targetPrice;

        var daysElapsed = (tMs - marketConfig.startDateMs) / (24 * 60 * 60 * 1000);
        if (daysElapsed < 0) daysElapsed = 0;

        var dailyPct = Number(marketConfig.dailyIncreasePercent) || 0;
        var price;

        if (dailyPct > 0) {
            var rate = dailyPct / 100;
            var rising = marketConfig.targetPrice >= marketConfig.startPrice;
            var factor = rising ? (1 + rate) : (1 - rate);
            if (factor < 0.0001) factor = 0.0001;

            price = marketConfig.startPrice * Math.pow(factor, daysElapsed);

            if (rising) {
                price = Math.min(price, marketConfig.targetPrice);
            } else {
                price = Math.max(price, marketConfig.targetPrice);
            }
        } else {
            var progress = (tMs - marketConfig.startDateMs) / (marketConfig.endDateMs - marketConfig.startDateMs);
            progress = Math.max(0, Math.min(1, progress));
            price = marketConfig.startPrice + ((marketConfig.targetPrice - marketConfig.startPrice) * progress);
        }

        return price;
    }

    function clampPrice(value) {
        var n = Number(value) || marketConfig.floorPrice;
        return Math.max(marketConfig.floorPrice, Math.min(marketConfig.ceilingPrice, n));
    }

    function loadMarketConfig(onDone) {
        postWebMethod('GetSpotMarketConfig', {}, function (payload) {
            applyMarketConfig(payload);
            state.marketReady = true;
            if (onDone) onDone(!!(payload && payload.success));
        }, function () {
            state.marketReady = true;
            if (onDone) onDone(false);
        });
    }

    function refreshMarketRuntime() {
        loadMarketConfig(function () {
            marketConfig.currentPrice = fairPriceAtTime(Math.floor(Date.now() / 1000));
            buildSeedCandles();
            refreshChartData();
            state.price = clampPrice(marketConfig.currentPrice);
            updateTicker();
            updateOrderPreview();
        });
    }

    function getChartStartSec() {
        var sec = Math.floor(marketConfig.startDateMs / 1000);
        return sec - (sec % 60);
    }

    function getCandleStepMinutes(totalMinutes) {
        if (totalMinutes <= MAX_BASE_CANDLES) return 1;
        return Math.ceil(totalMinutes / MAX_BASE_CANDLES);
    }

    function bucketTimeForInterval(ts, intervalMin) {
        if (intervalMin >= 1440) {
            var d = new Date(ts * 1000);
            d.setHours(0, 0, 0, 0);
            return Math.floor(d.getTime() / 1000);
        }
        var bucketSec = intervalMin * 60;
        return Math.floor(ts / bucketSec) * bucketSec;
    }

    function aggregateCandles(baseList, intervalMin) {
        if (!baseList || !baseList.length) return [];
        if (intervalMin <= 1) {
            return baseList.map(function (c) {
                return { time: c.time, open: c.open, high: c.high, low: c.low, close: c.close, volume: c.volume };
            });
        }

        var buckets = {};
        var order = [];

        for (var i = 0; i < baseList.length; i++) {
            var c = baseList[i];
            var bucketTime = bucketTimeForInterval(c.time, intervalMin);
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

    function refreshChartData(resetViewport) {
        if (!state.candleSeries || !state.volumeSeries) return;
        state.candleSeries.setData(state.candles.map(candleToSeries));
        state.volumeSeries.setData(state.candles.map(candleToVolume));
        if (state.chart && resetViewport) applyDefaultVisibleRange();
    }

    function applyDefaultVisibleRange() {
        if (!state.chart || !state.candles.length) return;

        var to = state.candles[state.candles.length - 1].time;
        var from = Math.max(state.candles[0].time, to - VISIBLE_RANGE_SEC);
        var pad = Math.max(30, Math.floor(VISIBLE_RANGE_SEC * 0.02));

        try {
            state.chart.timeScale().setVisibleRange({ from: from, to: to + pad });
        } catch (e) {
            state.chart.timeScale().fitContent();
        }
    }

    function intervalInfoText(minutes) {
        if (minutes >= 1440) return '1 day';
        if (minutes === 1) return '1 minute';
        return minutes + ' minutes';
    }

    function intervalShortText(minutes) {
        if (minutes >= 1440) return '1d';
        return minutes + 'm';
    }

    function updateIntervalLabel() {
        var label = byId('svSpotIntervalLabel');
        var info = byId('svSpotInfoInterval');
        var shortText = intervalShortText(state.interval);
        if (label) {
            label.innerHTML = '<i class="fa-solid fa-chart-line"></i> ' + shortText + ' candles';
        }
        if (info) info.textContent = intervalInfoText(state.interval);
    }

    function setChartInterval(minutes) {
        var min = parseInt(minutes, 10);
        if (min !== 1 && min !== 5 && min !== 15 && min !== 1440) min = 15;
        if (state.interval === min) return;

        state.interval = min;

        document.querySelectorAll('.sv-spot-interval').forEach(function (btn) {
            var btnMin = parseInt(btn.getAttribute('data-interval'), 10);
            btn.classList.toggle('is-active', btnMin === min);
        });

        applyChartInterval();
        refreshChartData(true);
        updateIntervalLabel();
        updateOhlc();
    }

    function buildSeedCandles() {
        var chartStart = getChartStartSec();
        var now = Math.floor(Date.now() / 1000);
        now = now - (now % 60);
        if (now < chartStart) now = chartStart;

        var totalMinutes = Math.max(1, Math.floor((now - chartStart) / 60));
        var stepMin = getCandleStepMinutes(totalMinutes);
        state.candleStepMin = stepMin;

        var interval = stepMin * 60;
        var count = Math.max(1, Math.floor(totalMinutes / stepMin));
        var price = fairPriceAtTime(chartStart);
        var list = [];

        for (var i = 0; i <= count; i++) {
            var time = chartStart + (i * interval);
            if (time > now) break;

            var fair = fairPriceAtTime(time);
            var band = Math.max(fair * randBetween(0.006, 0.02), marketConfig.floorPrice * 0.0005);
            var open = clampPrice(i === 0 ? marketConfig.startPrice : price);
            var close = clampPrice(fair + randBetween(-band, band));
            var high = clampPrice(Math.max(open, close) + randBetween(0, band * 0.55));
            var low = clampPrice(Math.min(open, close) - randBetween(0, band * 0.55));
            var volume = randBetween(12000, 85000) * Math.max(1, stepMin);

            list.push({ time: time, open: open, high: high, low: low, close: close, volume: volume });
            price = close;
        }

        if (list.length) {
            var lastFair = fairPriceAtTime(now);
            list[list.length - 1].close = clampPrice(lastFair);
            list[list.length - 1].high = clampPrice(Math.max(list[list.length - 1].high, list[list.length - 1].close));
            list[list.length - 1].low = clampPrice(Math.min(list[list.length - 1].low, list[list.length - 1].close));
        }

        state.baseCandles = list;
        applyChartInterval();

        if (state.candleStepMin > 1 && state.interval < state.candleStepMin) {
            setChartInterval(state.candleStepMin);
        }

        var cutoff24 = now - 86400;
        var recent = list.filter(function (c) { return c.time >= cutoff24; });

        state.price = list.length ? list[list.length - 1].close : marketConfig.currentPrice;
        state.openPrice = list.length ? list[list.length - 1].open : state.price;
        state.high24 = recent.length ? Math.max.apply(null, recent.map(function (c) { return c.high; })) : state.price;
        state.low24 = recent.length ? Math.min.apply(null, recent.map(function (c) { return c.low; })) : state.price;
        marketConfig.currentPrice = state.price;
    }

    function pushLiveCandle() {
        var base = state.baseCandles;
        if (!base.length) return;

        var stepSec = (state.candleStepMin || 1) * 60;
        var nowSec = Math.floor(Date.now() / 1000);
        var bucketTime = Math.floor(nowSec / stepSec) * stepSec;
        var last = base[base.length - 1];

        if (bucketTime <= last.time) return;

        var fair = fairPriceAtTime(bucketTime);
        var open = clampPrice(last.close);
        var band = Math.max(fair * randBetween(0.004, 0.015), marketConfig.floorPrice * 0.0005);
        var pull = (fair - open) * randBetween(0.35, 0.75);
        var close = clampPrice(open + pull + randBetween(-band, band));
        var high = clampPrice(Math.max(open, close) + randBetween(0, band * 0.5));
        var low = clampPrice(Math.min(open, close) - randBetween(0, band * 0.5));
        var volume = randBetween(10000, 90000) * Math.max(1, state.candleStepMin || 1);
        var candle = { time: bucketTime, open: open, high: high, low: low, close: close, volume: volume };

        base.push(candle);

        state.price = close;
        state.openPrice = open;
        marketConfig.currentPrice = close;

        var cutoff24 = nowSec - 86400;
        var recent = base.filter(function (c) { return c.time >= cutoff24; });
        state.high24 = recent.length ? Math.max.apply(null, recent.map(function (c) { return c.high; })) : state.price;
        state.low24 = recent.length ? Math.min.apply(null, recent.map(function (c) { return c.low; })) : state.price;

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
            handleScroll: {
                mouseWheel: true,
                pressedMouseMove: true,
                horzTouchDrag: true,
                vertTouchDrag: false
            },
            handleScale: {
                axisPressedMouseMove: true,
                mouseWheel: true,
                pinch: true
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

        applyDefaultVisibleRange();

        window.addEventListener('resize', resizeChart);
        window.setTimeout(resizeChart, 100);
        window.setTimeout(resizeChart, 500);
    }

    function getVolume24h() {
        var base = state.baseCandles || [];
        if (!base.length) return 0;

        var now = Math.floor(Date.now() / 1000);
        var cutoff = now - 86400;
        var sum = 0;
        var oldest = now;
        var i;

        for (i = 0; i < base.length; i++) {
            var c = base[i];
            if (c.time >= cutoff) {
                sum += c.volume || 0;
                if (c.time < oldest) oldest = c.time;
            }
        }

        if (sum <= 0) {
            for (i = 0; i < base.length; i++) {
                sum += base[i].volume || 0;
            }
            var spanSec = base.length * 60;
            if (spanSec > 0) sum = sum * (86400 / spanSec);
        } else {
            var coveredSec = now - oldest;
            if (coveredSec > 0 && coveredSec < 86400) {
                sum = sum * (86400 / coveredSec);
            }
        }

        return sum * state.price;
    }

    function formatCompactUsd(value) {
        var n = Number(value);
        if (isNaN(n) || n <= 0) return '$0';
        if (n >= 1e12) return '$' + (n / 1e12).toFixed(2) + 'T';
        if (n >= 1e9) return '$' + (n / 1e9).toFixed(2) + 'B';
        if (n >= 1e6) return '$' + (n / 1e6).toFixed(2) + 'M';
        if (n >= 1e3) return '$' + (n / 1e3).toFixed(2) + 'K';
        return '$' + n.toLocaleString(undefined, { maximumFractionDigits: 2 });
    }

    function updateTicker() {
        var priceEl = byId('svSpotPrice');
        var changeEl = byId('svSpotChange');
        var highEl = byId('svSpotHigh');
        var lowEl = byId('svSpotLow');
        var updatedEl = byId('svSpotUpdated');
        var infoPrice = byId('svSpotInfoPrice');
        var infoVolume = byId('svSpotInfoVolume');
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

        var launchPct = marketConfig.startPrice ? ((state.price - marketConfig.startPrice) / marketConfig.startPrice) * 100 : 0;
        if (launchGain) {
            var launchUp = launchPct >= 0;
            launchGain.textContent = (launchUp ? '+' : '') + launchPct.toFixed(2) + '%';
            launchGain.className = 'sv-spot-hero__stat-value ' + (launchUp ? 'sv-spot-hero__stat-value--up' : 'sv-spot-hero__stat-value--down');
        }

        if (highEl) highEl.textContent = formatPrice(state.high24);
        if (lowEl) lowEl.textContent = formatPrice(state.low24);
        if (updatedEl) updatedEl.textContent = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        if (infoPrice) infoPrice.textContent = formatPrice(state.price);
        if (infoVolume) infoVolume.textContent = formatCompactUsd(getVolume24h());
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

    function setOrderMsg(text, isError, side) {
        var id = side === 'sell' ? 'svSpotSellMsg' : 'svSpotBuyMsg';
        var el = byId(id);
        if (!el) return;
        el.textContent = text || '';
        el.className = 'sv-spot-order-msg' + (text ? (isError ? ' sv-spot-order-msg--error' : ' sv-spot-order-msg--ok') : '');
    }

    function updateBuyPreview() {
        var amountInput = byId('txtSpotBuyAmount');
        var amount = amountInput ? parseFloat(amountInput.value) : 0;
        var receive = byId('svSpotBuyReceive');
        if (receive) {
            var coins = amount > 0 ? amount / state.price : 0;
            receive.textContent = formatQty(coins) + ' UWC+';
        }
    }

    function updateSellPreview() {
        var amountInput = byId('txtSpotSellAmount');
        var amount = amountInput ? parseFloat(amountInput.value) : 0;
        var receive = byId('svSpotSellReceive');
        if (receive) {
            var usdt = amount > 0 ? amount * state.price : 0;
            receive.textContent = formatQty(usdt) + ' USDT';
        }
    }

    function updateOrderPreview() {
        var estPrice = byId('svSpotEstPrice');
        if (estPrice) estPrice.textContent = formatPrice(state.price);
        updateBuyPreview();
        updateSellPreview();
    }

    function applyQuickAmount(pct, side) {
        var inputId = side === 'sell' ? 'txtSpotSellAmount' : 'txtSpotBuyAmount';
        var amountInput = byId(inputId);
        if (!amountInput) return;

        var percent = Math.max(0, Math.min(100, pct)) / 100;
        var value = 0;

        if (side === 'sell') {
            value = getUwcBalance() * percent;
        } else {
            value = getUsdtBalance() * percent;
        }

        amountInput.value = value > 0 ? formatQty(value) : '';
        updateOrderPreview();
    }

    function submitOrder(side) {
        var orderSide = side === 'sell' ? 'sell' : 'buy';
        if (state.submitting) return;

        var inputId = orderSide === 'sell' ? 'txtSpotSellAmount' : 'txtSpotBuyAmount';
        var btnId = orderSide === 'sell' ? 'btnSpotSellSubmit' : 'btnSpotBuySubmit';
        var amountInput = byId(inputId);
        var amount = amountInput ? parseFloat(amountInput.value) : 0;
        setOrderMsg('', false, orderSide);

        if (!amount || amount <= 0) {
            setOrderMsg('Enter a valid amount.', true, orderSide);
            return;
        }

        state.submitting = true;
        state.side = orderSide;
        var btn = byId(btnId);
        if (btn) btn.disabled = true;

        postWebMethod('ExecuteSpotTrade', {
            side: orderSide,
            amount: amount,
            price: state.price
        }, function (res) {
            state.submitting = false;
            if (btn) btn.disabled = false;

            if (!res.success) {
                setOrderMsg(res.message || 'Order failed.', true, orderSide);
                return;
            }

            setBalances(res.usdtBalance || 0, res.uwcBalance || 0);
            setOrderMsg(res.message || 'Order filled.', false, orderSide);
            if (amountInput) amountInput.value = '';
            addTrade(res);
            updateOrderPreview();
        }, function (err) {
            state.submitting = false;
            if (btn) btn.disabled = false;
            setOrderMsg(err, true, orderSide);
        });
    }

    function seedRandomTrades(count) {
        var now = Math.floor(Date.now() / 1000);
        var list = [];
        var i;

        for (i = 0; i < count; i++) {
            var minutesAgo = randBetween(3, 175);
            var time = now - Math.floor(minutesAgo * 60);
            var side = Math.random() > 0.5 ? 'buy' : 'sell';
            var price = state.price * randBetween(0.93, 1.07);
            price = clampPrice(price);
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

    function bindEvents() {
        var buyInput = byId('txtSpotBuyAmount');
        var sellInput = byId('txtSpotSellAmount');
        if (buyInput) buyInput.addEventListener('input', updateBuyPreview);
        if (sellInput) sellInput.addEventListener('input', updateSellPreview);

        var buyBtn = byId('btnSpotBuySubmit');
        var sellBtn = byId('btnSpotSellSubmit');
        if (buyBtn) buyBtn.addEventListener('click', function () { submitOrder('buy'); });
        if (sellBtn) sellBtn.addEventListener('click', function () { submitOrder('sell'); });

        document.querySelectorAll('.sv-spot-quick-amt__btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                var pct = parseInt(btn.getAttribute('data-pct'), 10);
                var side = btn.getAttribute('data-side') || 'buy';
                if (!isNaN(pct)) applyQuickAmount(pct, side);
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

    var CRYPTO_API_URL = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false';
    var CRYPTO_REFRESH_MS = 30000;

    function formatCryptoPrice(value) {
        var n = Number(value);
        if (isNaN(n)) return '$0.00';
        if (n >= 1000) {
            return '$' + n.toLocaleString(undefined, { maximumFractionDigits: 0 });
        }
        if (n >= 1) {
            return '$' + n.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        }
        return '$' + n.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 4 });
    }

    function renderCryptoList(coins) {
        var list = byId('svSpotCryptoList');
        if (!list || !coins || !coins.length) return;

        var html = '';
        for (var i = 0; i < coins.length; i++) {
            var coin = coins[i];
            var change = Number(coin.price_change_percentage_24h) || 0;
            var up = change >= 0;
            var changeClass = up ? 'sv-spot-crypto-item__change--up' : 'sv-spot-crypto-item__change--down';
            var sign = up ? '+' : '';
            var rank = coin.market_cap_rank || (i + 1);
            var mcap = formatCompactUsd(coin.market_cap);
            var vol = formatCompactUsd(coin.total_volume);

            html +=
                '<div class="sv-spot-crypto-item">' +
                    '<div class="sv-spot-crypto-item__left">' +
                        '<span class="sv-spot-crypto-item__rank">' + rank + '</span>' +
                        '<img src="' + coin.image + '" alt="" width="32" height="32" loading="lazy">' +
                        '<div class="sv-spot-crypto-item__meta">' +
                            '<span class="sv-spot-crypto-item__symbol">' + coin.symbol.toUpperCase() + '</span>' +
                            '<span class="sv-spot-crypto-item__name">' + coin.name + '</span>' +
                        '</div>' +
                    '</div>' +
                    '<div class="sv-spot-crypto-item__right">' +
                        '<div class="sv-spot-crypto-item__price-row">' +
                            '<span class="sv-spot-crypto-item__price">' + formatCryptoPrice(coin.current_price) + '</span>' +
                            '<span class="sv-spot-crypto-item__change ' + changeClass + '">' + sign + change.toFixed(2) + '%</span>' +
                        '</div>' +
                        '<span class="sv-spot-crypto-item__detail">MCap ' + mcap + ' · Vol ' + vol + '</span>' +
                    '</div>' +
                '</div>';
        }

        list.innerHTML = html;
    }

    function loadTopCryptoPrices() {
        var list = byId('svSpotCryptoList');
        var updated = byId('svSpotCryptoUpdated');

        if (typeof fetch !== 'function') {
            if (list) {
                list.innerHTML = '<div class="sv-spot-crypto-empty">Live prices are not supported in this browser.</div>';
            }
            return;
        }

        fetch(CRYPTO_API_URL)
            .then(function (res) {
                if (!res.ok) throw new Error('fetch failed');
                return res.json();
            })
            .then(function (data) {
                if (!Array.isArray(data) || !data.length) throw new Error('empty');
                renderCryptoList(data);
                if (updated) {
                    updated.textContent = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                }
            })
            .catch(function () {
                if (list) {
                    list.innerHTML =
                        '<div class="sv-spot-crypto-empty">' +
                            '<i class="fa-solid fa-triangle-exclamation"></i>' +
                            '<span>Unable to load prices. Retrying...</span>' +
                        '</div>';
                }
            });
    }

    function startCryptoRefresh() {
        loadTopCryptoPrices();
        if (state.cryptoTimer) window.clearInterval(state.cryptoTimer);
        state.cryptoTimer = window.setInterval(loadTopCryptoPrices, CRYPTO_REFRESH_MS);
    }

    function startConfigRefresh() {
        if (state.configTimer) window.clearInterval(state.configTimer);
        state.configTimer = window.setInterval(refreshMarketRuntime, CONFIG_REFRESH_MS);
    }

    function bootSpotTrading() {
        buildSeedCandles();
        initChart();
        updateTicker();
        updateIntervalLabel();
        updateOrderPreview();
        bindEvents();
        seedRandomTrades(10);
        renderTrades();
        loadBalances();
        startLiveTicks();
        startCryptoRefresh();
        startConfigRefresh();
        window.setTimeout(resizeChart, 800);
    }

    function init() {
        loadMarketConfig(function () {
            bootSpotTrading();
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
