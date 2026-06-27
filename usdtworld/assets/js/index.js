document.addEventListener('DOMContentLoaded', () => {
    // ═══════ PARTICLES ═══════
    const particlesEl = document.getElementById('heroParticles');
    if (particlesEl) {
        for (let i = 0; i < 25; i++) {
            const p = document.createElement('div');
            p.className = 'particle';
            const size = Math.random() * 6 + 2;
            const colors = ['rgba(108,99,255,0.3)', 'rgba(0,212,255,0.25)', 'rgba(255,107,107,0.2)'];
            p.style.cssText = `
                width:${size}px;height:${size}px;
                top:${Math.random()*100}%;left:${Math.random()*100}%;
                background:${colors[Math.floor(Math.random()*3)]};
                animation-delay:${Math.random()*15}s;
                animation-duration:${Math.random()*12+12}s;
            `;
            particlesEl.appendChild(p);
        }
    }

    // ═══════ LIVE HERO PRICES ═══════
    async function loadHeroPrices() {
        try {
            const r = await fetch('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,solana&vs_currencies=usd&include_24hr_change=true');
            const d = await r.json();
            function setPair(id, coin) {
                const priceEl = document.getElementById(id + 'Price');
                const changeEl = document.getElementById(id + 'Change');
                if (!priceEl || !changeEl) return;
                const price = d[coin].usd;
                const change = d[coin].usd_24h_change?.toFixed(2) || 0;
                priceEl.textContent = '$' + parseFloat(price).toLocaleString();
                changeEl.textContent = (change >= 0 ? '▲ ' : '▼ ') + Math.abs(change) + '%';
                changeEl.className = 'tc-change ' + (change >= 0 ? 'tc-up' : 'tc-down');
            }
            setPair('btc', 'bitcoin'); setPair('eth', 'ethereum'); setPair('sol', 'solana');
        } catch (e) { }
    }
    if (document.getElementById('btcPrice')) {
        loadHeroPrices();
        setInterval(loadHeroPrices, 25000);
    }

    // ═══════ MARKET TAB DATA ═══════
    const allMarkets = {
        crypto: [
            { name: 'Bitcoin', pair: 'BTC/USD', icon: 'fab fa-bitcoin', color: '#f7931a', bg: 'rgba(247,147,26,0.1)', id: 'bitcoin' },
            { name: 'Ethereum', pair: 'ETH/USD', icon: 'fab fa-ethereum', color: '#627eea', bg: 'rgba(98,126,234,0.1)', id: 'ethereum' },
            { name: 'Solana', pair: 'SOL/USD', icon: 'fa-solid fa-sun', color: '#00d4ff', bg: 'rgba(0,212,255,0.1)', id: 'solana' },
            { name: 'Ripple', pair: 'XRP/USD', icon: 'fa-solid fa-circle-nodes', color: '#00aae4', bg: 'rgba(0,170,228,0.1)', id: 'ripple' },
            { name: 'Cardano', pair: 'ADA/USD', icon: 'fa-solid fa-cube', color: '#0033ad', bg: 'rgba(0,51,173,0.1)', id: 'cardano' },
            { name: 'Dogecoin', pair: 'DOGE/USD', icon: 'fa-solid fa-dog', color: '#c2a633', bg: 'rgba(194,166,51,0.1)', id: 'dogecoin' },
        ],
        forex: [
            { name: 'EUR/USD', pair: 'Euro · Dollar', icon: 'fa-solid fa-euro-sign', color: '#3b82f6', bg: 'rgba(59,130,246,0.1)', price: '1.0856', change: '+0.12' },
            { name: 'GBP/USD', pair: 'Pound · Dollar', icon: 'fa-solid fa-sterling-sign', color: '#8b5cf6', bg: 'rgba(139,92,246,0.1)', price: '1.2734', change: '+0.08' },
            { name: 'USD/JPY', pair: 'Dollar · Yen', icon: 'fa-solid fa-yen-sign', color: '#ef4444', bg: 'rgba(239,68,68,0.1)', price: '156.42', change: '-0.15' },
            { name: 'AUD/USD', pair: 'Aussie · Dollar', icon: 'fa-solid fa-dollar-sign', color: '#10b981', bg: 'rgba(16,185,129,0.1)', price: '0.6598', change: '+0.21' },
            { name: 'USD/CHF', pair: 'Dollar · Franc', icon: 'fa-solid fa-franc-sign', color: '#f59e0b', bg: 'rgba(245,158,11,0.1)', price: '0.9012', change: '-0.09' },
            { name: 'USD/CAD', pair: 'Dollar · Loonie', icon: 'fa-solid fa-leaf', color: '#ec4899', bg: 'rgba(236,72,153,0.1)', price: '1.3645', change: '+0.05' },
        ],
        stocks: [
            { name: 'Apple', pair: 'AAPL', icon: 'fab fa-apple', color: '#a3a3a3', bg: 'rgba(163,163,163,0.1)', price: '198.45', change: '+1.23' },
            { name: 'Tesla', pair: 'TSLA', icon: 'fa-solid fa-car', color: '#ef4444', bg: 'rgba(239,68,68,0.1)', price: '248.72', change: '+2.84' },
            { name: 'Amazon', pair: 'AMZN', icon: 'fab fa-amazon', color: '#f59e0b', bg: 'rgba(245,158,11,0.1)', price: '186.35', change: '+0.67' },
            { name: 'Google', pair: 'GOOGL', icon: 'fab fa-google', color: '#3b82f6', bg: 'rgba(59,130,246,0.1)', price: '175.98', change: '-0.32' },
            { name: 'Microsoft', pair: 'MSFT', icon: 'fab fa-microsoft', color: '#00d4ff', bg: 'rgba(0,212,255,0.1)', price: '422.86', change: '+1.45' },
            { name: 'NVIDIA', pair: 'NVDA', icon: 'fa-solid fa-microchip', color: '#10b981', bg: 'rgba(16,185,129,0.1)', price: '924.70', change: '+3.12' },
        ]
    };

    let currentTab = 'crypto';

    function buildCard(m, price, change, up, i) {
        let bars = '';
        for (let b = 0; b < 14; b++) {
            const h = Math.random() * 38 + 10;
            bars += `<div class="bar" style="height:${h}px;background:${up ? 'rgba(16,185,129,0.4)' : 'rgba(239,68,68,0.4)'};"></div>`;
        }
        const priceStr = typeof price === 'string' ? '$' + price : '$' + parseFloat(price).toLocaleString();
        const changeNum = typeof change === 'string' ? parseFloat(change) : change;
        return `
        <div class="mkt-card" style="animation: fadeSlideIn 0.5s ease ${i * 0.08}s both;">
            <div class="mkt-card-top">
                <div class="mkt-card-icon" style="background:${m.bg};color:${m.color};"><i class="${m.icon}"></i></div>
                <div class="mkt-badge" style="background:${up ? 'rgba(16,185,129,0.1)' : 'rgba(239,68,68,0.1)'};color:${up ? '#10b981' : '#ef4444'};">${up ? '▲' : '▼'} ${Math.abs(changeNum)}%</div>
            </div>
            <h5>${m.name}</h5>
            <div class="mkt-price" style="color:${up ? '#10b981' : '#ef4444'};">${priceStr}</div>
            <div class="mkt-pair">${m.pair}</div>
            <div class="mini-chart">${bars}</div>
        </div>`;
    }

    // Tab switching
    document.querySelectorAll('.market-tab').forEach(tab => {
        tab.addEventListener('click', () => {
            document.querySelectorAll('.market-tab').forEach(t => t.classList.remove('active'));
            tab.classList.add('active');
            currentTab = tab.dataset.tab;
            if (typeof renderMarketCards !== 'undefined') renderMarketCards(currentTab);
        });
    });

    // FAQ accordion
    document.querySelectorAll('.faq-question').forEach(button => {
        button.addEventListener('click', () => {
            const item = button.closest('.faq-item');
            const open = item.classList.toggle('open');
            const answer = item.querySelector('.faq-answer');
            if (open) {
                answer.style.maxHeight = answer.scrollHeight + 'px';
            } else {
                answer.style.maxHeight = '0';
            }
        });
    });

    // Initial load
    if (typeof renderMarketCards !== 'undefined') {
        renderMarketCards('crypto');
    }

    // ═══════ HERO TOKEN DATA (synced from #token-sale) ═══════
    (function initHeroToken() {
        const tokenSection = document.getElementById('token-sale');
        if (!tokenSection) return;

        const endDate = new Date(tokenSection.dataset.saleEnd || '2026-12-31T23:59:59');
        const totalRaised = parseFloat(tokenSection.dataset.totalRaised || '25555');
        const tokenPrice = tokenSection.dataset.tokenPrice || '0.000139';
        const tokenSymbol = tokenSection.dataset.tokenSymbol || 'USDTW';

        const priceEl = document.getElementById('heroTokenPrice');
        const symbolEl = document.getElementById('heroTokenSymbol');
        const raisedEl = document.getElementById('heroRaisedAmount');
        const daysEl = document.getElementById('heroDaysLeft');

        if (priceEl) priceEl.textContent = tokenPrice;
        if (symbolEl) symbolEl.textContent = tokenSymbol;
        if (raisedEl) raisedEl.textContent = '$' + totalRaised.toLocaleString();

        function updateDaysLeft() {
            if (!daysEl) return;
            const diff = endDate.getTime() - Date.now();
            const days = Math.max(0, Math.ceil(diff / 86400000));
            daysEl.textContent = String(days);
        }

        updateDaysLeft();
        setInterval(updateDaysLeft, 60000);
    })();

    // ═══════ TOKEN SALE COUNTDOWN ═══════
    (function initTokenSale() {
        const section = document.getElementById('token-sale');
        if (!section) return;

        const endDate = new Date(section.dataset.saleEnd || '2026-12-31T23:59:59');
        const totalRaised = parseFloat(section.dataset.totalRaised || '25555');
        const targetRaise = parseFloat(section.dataset.targetRaise || '100000');
        const tokenPrice = section.dataset.tokenPrice || '0.000139';
        const tokenSymbol = section.dataset.tokenSymbol || 'USDTW';

        const countdownEl = document.getElementById('tokenCountdown');
        const progressFill = document.getElementById('tokenProgressFill');
        const progressBar = section.querySelector('.token-sale-progress');
        const raisedText = document.getElementById('tokenRaisedText');
        const targetText = document.getElementById('tokenTargetText');
        const priceEl = document.getElementById('tokenPrice');
        const symbolEl = document.getElementById('tokenSymbol');
        const form = document.getElementById('tokenSaleForm');
        const emailInput = document.getElementById('tokenSaleEmail');
        const msgEl = document.getElementById('tokenSaleMsg');

        if (priceEl) priceEl.textContent = tokenPrice;
        if (symbolEl) symbolEl.textContent = tokenSymbol;
        if (targetText) targetText.textContent = targetRaise.toLocaleString() + ' USD';

        const percent = targetRaise > 0 ? Math.min(100, Math.round((totalRaised / targetRaise) * 100)) : 0;
        if (raisedText) {
            raisedText.textContent = totalRaised.toLocaleString() + ' USD (' + percent + '%)';
        }
        if (progressBar) {
            progressBar.setAttribute('aria-valuenow', String(percent));
        }

        function animateProgress() {
            if (!progressFill) return;
            requestAnimationFrame(function () {
                progressFill.style.width = percent + '%';
            });
        }

        if ('IntersectionObserver' in window && progressFill) {
            const observer = new IntersectionObserver(function (entries) {
                entries.forEach(function (entry) {
                    if (entry.isIntersecting) {
                        animateProgress();
                        observer.disconnect();
                    }
                });
            }, { threshold: 0.35 });
            observer.observe(section);
        } else {
            animateProgress();
        }

        function pad(n) {
            return String(n).padStart(2, '0');
        }

        function updateCountdown() {
            if (!countdownEl) return;
            const now = Date.now();
            const diff = endDate.getTime() - now;

            if (diff <= 0) {
                countdownEl.querySelectorAll('.token-countdown__value').forEach(function (el) {
                    el.textContent = '00';
                });
                return;
            }

            const days = Math.floor(diff / 86400000);
            const hours = Math.floor((diff % 86400000) / 3600000);
            const minutes = Math.floor((diff % 3600000) / 60000);
            const seconds = Math.floor((diff % 60000) / 1000);

            const map = { days: days, hours: hours, minutes: minutes, seconds: seconds };
            countdownEl.querySelectorAll('.token-countdown__value').forEach(function (el) {
                const unit = el.getAttribute('data-unit');
                if (!unit) return;
                el.textContent = unit === 'days' ? String(map[unit]) : pad(map[unit]);
            });
        }

        updateCountdown();
        setInterval(updateCountdown, 1000);

        function isValidEmail(value) {
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
        }

        if (form && emailInput) {
            const savedEmail = localStorage.getItem('tokenSaleEmail');
            if (savedEmail) {
                emailInput.value = savedEmail;
            }

            form.addEventListener('submit', function (e) {
                e.preventDefault();
                const email = emailInput.value.trim();

                if (!email) {
                    if (msgEl) {
                        msgEl.textContent = 'Please enter your email address.';
                        msgEl.className = 'token-sale-form__msg is-error';
                    }
                    emailInput.focus();
                    return;
                }

                if (!isValidEmail(email)) {
                    if (msgEl) {
                        msgEl.textContent = 'Please enter a valid email address.';
                        msgEl.className = 'token-sale-form__msg is-error';
                    }
                    emailInput.focus();
                    return;
                }

                localStorage.setItem('tokenSaleEmail', email);
                if (msgEl) {
                    msgEl.textContent = 'Redirecting to registration...';
                    msgEl.className = 'token-sale-form__msg is-success';
                }

                window.setTimeout(function () {
                    window.location.href = 'Register.aspx?email=' + encodeURIComponent(email);
                }, 600);
            });
        }
    })();

    // ═══════ FEATURED PROJECTS ═══════
    (function initFeaturedProjects() {
        const section = document.getElementById('featured-projects');
        if (!section) return;

        const endDate = new Date(section.dataset.saleEnd || '2026-12-31T23:59:59');
        const tokenPrice = section.dataset.tokenPrice || '0.000139';
        const tokenSymbol = section.dataset.tokenSymbol || 'USDTW';
        const daysEl = document.getElementById('featuredDaysLeft');
        const priceEl = document.getElementById('featuredTokenPrice');
        const symbolEl = document.getElementById('featuredTokenSymbol');

        if (priceEl) priceEl.textContent = tokenPrice;
        if (symbolEl) symbolEl.textContent = tokenSymbol;

        const tickerPriceEl = document.getElementById('featuredTickerPrice');
        if (tickerPriceEl) {
            const num = parseFloat(tokenPrice);
            tickerPriceEl.textContent = isNaN(num)
                ? '$' + tokenPrice
                : '$' + num.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 6 });
        }

        function updateDaysLeft() {
            if (!daysEl) return;
            const diff = endDate.getTime() - Date.now();
            const days = Math.max(0, Math.ceil(diff / 86400000));
            daysEl.textContent = String(days);
        }

        updateDaysLeft();
        setInterval(updateDaysLeft, 60000);
    })();

    // ═══════ NEWSLETTER SIGNUP ═══════
    (function initNewsletterSignup() {
        const form = document.getElementById('newsletterSignupForm');
        const emailInput = document.getElementById('newsletterEmail');
        const consentInput = document.getElementById('newsletterConsent');
        const msgEl = document.getElementById('newsletterMsg');

        if (!form || !emailInput) return;

        function isValidEmail(email) {
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
        }

        form.addEventListener('submit', function (e) {
            e.preventDefault();

            const email = emailInput.value.trim();

            if (!email) {
                if (msgEl) {
                    msgEl.textContent = 'Please enter your email address.';
                    msgEl.className = 'newsletter-banner__msg is-error';
                }
                emailInput.focus();
                return;
            }

            if (!isValidEmail(email)) {
                if (msgEl) {
                    msgEl.textContent = 'Please enter a valid email address.';
                    msgEl.className = 'newsletter-banner__msg is-error';
                }
                emailInput.focus();
                return;
            }

            if (consentInput && !consentInput.checked) {
                if (msgEl) {
                    msgEl.textContent = 'Please agree to receive emails from USDT World.';
                    msgEl.className = 'newsletter-banner__msg is-error';
                }
                consentInput.focus();
                return;
            }

            localStorage.setItem('newsletterEmail', email);

            if (msgEl) {
                msgEl.textContent = 'Redirecting to signup...';
                msgEl.className = 'newsletter-banner__msg is-success';
            }

            setTimeout(function () {
                window.location.href = 'Register.aspx?email=' + encodeURIComponent(email);
            }, 400);
        });
    })();
});
