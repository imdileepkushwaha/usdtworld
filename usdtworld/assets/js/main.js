document.addEventListener('DOMContentLoaded', () => {
    // ── AOS (disabled on mobile — content shows instantly) ──
    if (typeof AOS !== 'undefined') {
        AOS.init({
            duration: 700,
            once: true,
            offset: 80,
            easing: 'ease-out-cubic',
            anchorPlacement: 'top-bottom',
            disable: 'mobile'
        });

        const refreshAOS = () => {
            if (typeof AOS !== 'undefined') AOS.refresh();
        };

        window.addEventListener('load', refreshAOS);
        window.addEventListener('resize', refreshAOS);
        window.addEventListener('orientationchange', () => setTimeout(refreshAOS, 350));
    }

    // ── Swiper sliders ──
    if (typeof Swiper !== 'undefined') {
        if (document.querySelector('.testimonials-swiper')) {
            new Swiper('.testimonials-swiper', {
                slidesPerView: 1,
                spaceBetween: 24,
                loop: true,
                autoplay: { delay: 5200, disableOnInteraction: false },
                navigation: {
                    nextEl: '.testimonials-next',
                    prevEl: '.testimonials-prev'
                },
                breakpoints: {
                    760: { slidesPerView: 2 },
                    1080: { slidesPerView: 3 }
                }
            });
        }
        if (document.querySelector('.articles-swiper')) {
            new Swiper('.articles-swiper', {
                slidesPerView: 1,
                spaceBetween: 24,
                loop: false,
                navigation: {
                    nextEl: '.articles-next',
                    prevEl: '.articles-prev'
                },
                breakpoints: {
                    760: { slidesPerView: 2 },
                    1080: { slidesPerView: 3 },
                    1280: { slidesPerView: 4 }
                }
            });
        }
    }

    // ── Navbar scroll ──
    const navbar = document.getElementById('mainNavbar');
    const scrollBtn = document.getElementById('scrollTopBtn');
    if (navbar) {
        window.addEventListener('scroll', () => {
            const y = window.scrollY;
            navbar.classList.toggle('scrolled', y > 40);
            if (scrollBtn) scrollBtn.classList.toggle('visible', y > 400);
        });
    }

    // ── Hamburger ──
    const hamburger = document.getElementById('hamburgerBtn');
    const mobileOverlay = document.getElementById('mobileOverlay');
    if (hamburger && mobileOverlay) {
        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('open');
            mobileOverlay.classList.toggle('open');
            document.body.style.overflow = mobileOverlay.classList.contains('open') ? 'hidden' : '';
        });
        // Close on link click
        mobileOverlay.querySelectorAll('a').forEach(a => {
            a.addEventListener('click', () => {
                hamburger.classList.remove('open');
                mobileOverlay.classList.remove('open');
                document.body.style.overflow = '';
            });
        });
    }

    // ── Live Crypto Ticker ──
    const tickerCoins = ["bitcoin","ethereum","binancecoin","solana","ripple","dogecoin","cardano","tether","matic-network","avalanche-2","polkadot","chainlink"];
    async function loadTicker() {
        try {
            const url = `https://api.coingecko.com/api/v3/simple/price?ids=${tickerCoins.join(",")}&vs_currencies=usd&include_24hr_change=true`;
            const res = await fetch(url);
            const data = await res.json();
            const track = document.getElementById("tickerTrack");
            if (!track) return;
            let html = '';
            tickerCoins.forEach(coin => {
                if (!data[coin]) return;
                const price = data[coin].usd;
                const change = data[coin].usd_24h_change?.toFixed(2) || 0;
                const dir = change >= 0 ? 'up' : 'down';
                const arrow = change >= 0 ? '▲' : '▼';
                const label = coin.toUpperCase().replace('-2','').replace('-NETWORK','');
                html += `<div class="ticker-item"><span class="t-name">${label}</span><span class="t-price">$${parseFloat(price).toLocaleString()}</span><span class="t-${dir}">${arrow} ${Math.abs(change)}%</span></div>`;
            });
            track.innerHTML = html + html; // duplicate for seamless loop
        } catch(e) {
            console.warn("Ticker fetch failed", e);
        }
    }
    loadTicker();
    setInterval(loadTicker, 35000);

    // ── Smooth Scroll for Hash Links ──
    document.querySelectorAll('a[href*="#"]').forEach(link => {
        link.addEventListener('click', function(e) {
            const hash = this.hash;
            if (hash && hash !== '#') {
                try {
                    const target = document.querySelector(hash);
                    if (target) {
                        e.preventDefault();
                        const offset = 80; // navbar height
                        const targetPos = target.getBoundingClientRect().top + window.scrollY - offset;
                        window.scrollTo({
                            top: targetPos,
                            behavior: 'smooth'
                        });
                        window.history.pushState(null, null, hash);

                        if (typeof AOS !== 'undefined') {
                            setTimeout(() => AOS.refresh(), 700);
                        }
                        
                        // Also close mobile menu if open
                        const hamburger = document.getElementById('hamburgerBtn');
                        const mobileOverlay = document.getElementById('mobileOverlay');
                        if (hamburger && mobileOverlay) {
                            hamburger.classList.remove('open');
                            mobileOverlay.classList.remove('open');
                            document.body.style.overflow = '';
                        }
                    }
                } catch(err) {
                    console.warn("Invalid hash", err);
                }
            }
        });
    });
});

// ── Google Translate Custom Trigger ──
window.translatePage = function(langCode) {
    // Set the language in our custom dropdown UI (update active class)
    const links = document.querySelectorAll('.lang-dropdown a');
    links.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('onclick') && link.getAttribute('onclick').includes(langCode)) {
            link.classList.add('active');
            // update the button text to show selected lang code
            const btn = document.querySelector('.lang-btn');
            if(btn) {
                btn.innerHTML = `<i class="fa-solid fa-globe"></i> ${langCode.toUpperCase()} <i class="fa-solid fa-chevron-down arrow-icon"></i>`;
            }
        }
    });

    // Find the hidden Google Translate select and trigger change
    const select = document.querySelector('.goog-te-combo');
    if (select) {
        select.value = langCode;
        select.dispatchEvent(new Event('change'));
    } else {
        // If the widget hasn't loaded yet, try again in 500ms
        setTimeout(() => translatePage(langCode), 500);
    }
};
