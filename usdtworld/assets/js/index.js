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

    // ═══════ COUNTER ANIMATION ═══════
    function animateCounter(el, target) {
        if (!el) return;
        let current = 0;
        const step = Math.ceil(target / 80);
        const timer = setInterval(() => {
            current += step;
            if (current >= target) { current = target; clearInterval(timer); }
            el.innerText = current.toLocaleString() + '+';
        }, 25);
    }
    const counterEl = document.getElementById('counterUsers');
    if (counterEl) {
        let stored = JSON.parse(localStorage.getItem("memberCounter"));
        if (!stored) stored = { value: 2332, lastUpdated: Date.now() };
        const interval = 3600000;
        let cycles = Math.floor((Date.now() - stored.lastUpdated) / interval);
        if (cycles > 0) { stored.value += cycles * 6; stored.lastUpdated += cycles * interval; }
        localStorage.setItem("memberCounter", JSON.stringify(stored));
        animateCounter(counterEl, stored.value);
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
});
