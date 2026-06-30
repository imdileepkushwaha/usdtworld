<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="socialvista._Default" %>

<asp:Content ID="HeadStyles" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- ═══════ HERO ═══════ -->
<section class="hero" id="home">
    <div class="hero-bg-effects">
        <div class="glow glow-1"></div>
        <div class="glow glow-2"></div>
        <div class="glow glow-3"></div>
        <div class="hero-brand-orb hero-brand-orb--1"></div>
        <div class="hero-brand-orb hero-brand-orb--2"></div>
        <div class="hero-brand-orb hero-brand-orb--3"></div>
        <div class="hero-brand-orb hero-brand-orb--4"></div>
        <div class="hero-brand-orb hero-brand-orb--5"></div>
        <div class="hero-deco-particle hero-deco-particle--1"></div>
        <div class="hero-deco-particle hero-deco-particle--2"></div>
        <div class="hero-deco-particle hero-deco-particle--3"></div>
        <div class="hero-deco-particle hero-deco-particle--4"></div>
        <div class="hero-deco-particle hero-deco-particle--5"></div>
        <div class="hero-deco-particle hero-deco-particle--6"></div>
        <div class="hero-deco-particle hero-deco-particle--7"></div>
        <div class="hero-deco-particle hero-deco-particle--8"></div>
        <div class="hero-deco-particle hero-deco-particle--9"></div>
        <div class="hero-brand-orb hero-brand-orb--6"></div>
        <div class="hero-brand-orb hero-brand-orb--7"></div>
        <div class="hero-geo-deco hero-geo-deco--ring"></div>
        <div class="hero-geo-deco hero-geo-deco--ring-left"></div>
        <div class="hero-geo-deco hero-geo-deco--diamond"></div>
        <div class="hero-geo-deco hero-geo-deco--diamond-left"></div>
        <div class="hero-geo-deco hero-geo-deco--triangle"></div>
        <div class="hero-geo-deco hero-geo-deco--triangle-left"></div>
        <div class="hero-geo-deco hero-geo-deco--dots">
            <span></span><span></span><span></span>
            <span></span><span></span><span></span>
            <span></span><span></span><span></span>
        </div>
        <div class="hero-geo-deco hero-geo-deco--dots-right">
            <span></span><span></span><span></span>
            <span></span><span></span><span></span>
            <span></span><span></span><span></span>
        </div>
    </div>
    <div class="hero-grid-bg"></div>
    <div class="hero-particles" id="heroParticles"></div>

    <div class="hero-container">
        <div class="hero-left">
            <div class="hero-badge"><span class="live-dot"></span> Pre-Token Sale Live</div>
            <h1 class="hero-title">
                Power the Future with <span class="shimmer">UWC+</span>
                <span class="line-2">Token Sale.</span>
            </h1>
            <p class="hero-desc">Join the USDT World presale and secure your stake in a next-gen crypto launchpad ecosystem. Transparent pricing, real-time sale progress, and early access before public listing.</p>
            <div class="hero-actions">
                <a href="Register.aspx" class="btn-hero-primary">Buy USDTW <i class="fa-solid fa-arrow-right"></i></a>
                <a href="#token-sale" class="btn-hero-secondary"><i class="fa-solid fa-rocket"></i> View Token Sale</a>
            </div>
            <div class="hero-metrics">
                <div class="hero-metric">
                    <h3>$<span id="heroTokenPrice">0.000139</span></h3>
                    <p><span id="heroTokenSymbol">USDTW</span> Price</p>
                </div>
                <div class="hero-metric">
                    <h3 id="heroRaisedAmount">$25,555</h3>
                    <p>Funds Raised</p>
                </div>
                <div class="hero-metric">
                    <h3 id="heroDaysLeft">—</h3>
                    <p>Days to Sale End</p>
                </div>
            </div>
        </div>
        <div class="hero-visual">
            <div class="hero-image-panel">
                <div class="ripple_shape mb-lg-5">
                    <svg viewBox="0 0 501 455" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M500.5 227.5C500.5 352.824 388.618 454.5 250.5 454.5C112.382 454.5 0.5 352.824 0.5 227.5C0.5 102.176 112.382 0.5 250.5 0.5C388.618 0.5 500.5 102.176 500.5 227.5Z" stroke="url(#sro_paint0)"></path>
                      <path d="M463.5 247.5C463.5 361.81 368.15 454.5 250.5 454.5C132.85 454.5 37.5 361.81 37.5 247.5C37.5 133.19 132.85 40.5 250.5 40.5C368.15 40.5 463.5 133.19 463.5 247.5Z" stroke="url(#sro_paint1)"></path>
                      <path d="M425.5 268C425.5 371.031 347.12 454.5 250.5 454.5C153.88 454.5 75.5 371.031 75.5 268C75.5 164.969 153.88 81.5 250.5 81.5C347.12 81.5 425.5 164.969 425.5 268Z" stroke="url(#sro_paint2)"></path>
                      <path d="M379.5 268C379.5 343.97 321.715 405.5 250.5 405.5C179.285 405.5 121.5 343.97 121.5 268C121.5 192.03 179.285 130.5 250.5 130.5C321.715 130.5 379.5 192.03 379.5 268Z" stroke="url(#sro_paint3)"></path>
                      <defs>
                        <linearGradient id="sro_paint0" x1="250.5" y1="0" x2="250.5" y2="455" gradientUnits="userSpaceOnUse">
                          <stop offset="0" stop-color="#2A246D"></stop>
                          <stop offset="1" stop-color="#2A246D" stop-opacity="0"></stop>
                        </linearGradient>
                        <linearGradient id="sro_paint1" x1="250.5" y1="40" x2="250.5" y2="455" gradientUnits="userSpaceOnUse">
                          <stop offset="0" stop-color="#2A246D"></stop>
                          <stop offset="1" stop-color="#2A246D" stop-opacity="0"></stop>
                        </linearGradient>
                        <linearGradient id="sro_paint2" x1="250.5" y1="81" x2="250.5" y2="455" gradientUnits="userSpaceOnUse">
                          <stop offset="0" stop-color="#2A246D"></stop>
                          <stop offset="1" stop-color="#2A246D" stop-opacity="0"></stop>
                        </linearGradient>
                        <linearGradient id="sro_paint3" x1="250.5" y1="130" x2="250.5" y2="406" gradientUnits="userSpaceOnUse">
                          <stop offset="0" stop-color="#2A246D"></stop>
                          <stop offset="1" stop-color="#2A246D" stop-opacity="0"></stop>
                        </linearGradient>
                      </defs>
                    </svg>
                  </div>
                  <div class="coin_image">
<img src="assets/images/about_image.png" alt="Crypto trading illustration" class="hero-img" />
                  </div>
                
                <div class="coin-floating coin-1"><i class="fab fa-bitcoin"></i></div>
                <div class="coin-floating coin-2"><i class="fab fa-ethereum"></i></div>
                <div class="coin-floating coin-3"><i class="fa-brands fa-monero"></i></div>
                <div class="coin-floating coin-4"><i class="fas fa-coins"></i></div>
                
                <div class="hero-float-badge badge-profit">
                    <div class="h-badge-icon"><i class="fa-solid fa-arrow-trend-up"></i></div>
                    <div class="h-badge-text">
                        <span>Daily Profit</span>
                        <strong>+15.4%</strong>
                    </div>
                </div>
                <div class="hero-float-badge badge-secure">
                    <div class="h-badge-icon"><i class="fa-solid fa-shield-halved"></i></div>
                    <div class="h-badge-text">
                        <span>Secured</span>
                        <strong>100%</strong>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ═══════ LIVE TICKER ═══════ -->
    <div class="ticker-bar" style="display: none;">
        <div class="ticker-track" id="tickerTrack">
            <div class="ticker-item"><span class="t-name">Loading live data...</span></div>
        </div>
    </div>



<!-- ═══════ TOKEN SALE COUNTDOWN ═══════ -->
<section class="token-sale-section" id="token-sale"
    data-sale-end="2026-12-31T23:59:59"
    data-total-raised="25555"
    data-target-raise="100000"
    data-token-price="0.000139"
    data-token-symbol="USDTW">
    <div class="token-sale-glow"></div>
    <div class="token-sale-container">
        <div class="token-sale-card" data-aos="fade-right">
            <div class="token-sale-card__radar" aria-hidden="true"></div>
            <p class="token-sale-card__label">Pre Token Sale Ends In</p>
            <div class="token-countdown" id="tokenCountdown" aria-live="polite">
                <div class="token-countdown__unit">
                    <span class="token-countdown__value" data-unit="days">00</span>
                    <span class="token-countdown__suffix">d</span>
                </div>
                <span class="token-countdown__sep">:</span>
                <div class="token-countdown__unit">
                    <span class="token-countdown__value" data-unit="hours">00</span>
                    <span class="token-countdown__suffix">h</span>
                </div>
                <span class="token-countdown__sep">:</span>
                <div class="token-countdown__unit">
                    <span class="token-countdown__value" data-unit="minutes">00</span>
                    <span class="token-countdown__suffix">m</span>
                </div>
                <span class="token-countdown__sep">:</span>
                <div class="token-countdown__unit">
                    <span class="token-countdown__value" data-unit="seconds">00</span>
                    <span class="token-countdown__suffix">s</span>
                </div>
            </div>
            <p class="token-sale-card__hint">Buy tokens now and reap the benefits of the crypto revolution</p>

            <div class="token-sale-brand">
                <div class="token-sale-brand__icon">
                    <i class="fa-solid fa-rocket"></i>
                </div>
                <span class="token-sale-brand__name">USDT WORLD</span>
            </div>

            <p class="token-sale-price">
                Price 1 (<span id="tokenSymbol">USDTW</span>) = $<span id="tokenPrice">0.000139</span> per (USD)
            </p>

            <div class="token-sale-progress-head">
                <span>Total Raise: <strong id="tokenRaisedText">25,555 USD (26%)</strong></span>
                <span>Targeted Raise: <strong id="tokenTargetText">100,000 USD</strong></span>
            </div>
            <div class="token-sale-progress" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="26">
                <div class="token-sale-progress__fill" id="tokenProgressFill"></div>
            </div>

            <a href="Register.aspx" class="btn-token-buy">Buy Token</a>
        </div>

        <div class="token-sale-content" data-aos="fade-left">
            <h2 class="token-sale-title">Token Sale Countdown</h2>
            <p class="token-sale-desc">A token sale countdown creates urgency and drives investor interest before launch. It helps your community stay informed, builds trust through transparency, and prepares participants for the official sale window.</p>

            <div class="token-sale-features">
                <div class="token-sale-feat">
                    <span class="token-sale-feat__icon"><i class="fa-solid fa-chart-line"></i></span>
                    <span>Investment Opportunity</span>
                </div>
                <div class="token-sale-feat">
                    <span class="token-sale-feat__icon"><i class="fa-solid fa-clock"></i></span>
                    <span>Time Sensitivity</span>
                </div>
                <div class="token-sale-feat">
                    <span class="token-sale-feat__icon"><i class="fa-solid fa-users"></i></span>
                    <span>Community Engagement</span>
                </div>
                <div class="token-sale-feat">
                    <span class="token-sale-feat__icon"><i class="fa-solid fa-bullhorn"></i></span>
                    <span>Market Awareness</span>
                </div>
                <div class="token-sale-feat">
                    <span class="token-sale-feat__icon"><i class="fa-solid fa-shield-halved"></i></span>
                    <span>Investor Preparedness</span>
                </div>
                <div class="token-sale-feat">
                    <span class="token-sale-feat__icon"><i class="fa-solid fa-handshake"></i></span>
                    <span>Trust and Transparency</span>
                </div>
            </div>

            <p class="token-sale-cta-text">Sign up, trade, and earn up to <strong>100 USDT</strong></p>

            <form class="token-sale-form" id="tokenSaleForm" novalidate>
                <div class="token-sale-form__wrap">
                    <input type="email" id="tokenSaleEmail" class="token-sale-form__input" placeholder="Your email" autocomplete="email" required />
                    <button type="submit" class="token-sale-form__btn">Register Now</button>
                </div>
                <p class="token-sale-form__msg" id="tokenSaleMsg" role="status" aria-live="polite"></p>
            </form>
        </div>
    </div>
</section>

<!-- ═══════ FEATURED PROJECTS ═══════ -->
<section class="featured-projects" id="featured-projects"
    data-sale-end="2026-12-31T23:59:59"
    data-token-price="0.000139"
    data-token-symbol="USDTW">
    <div class="featured-projects__bg" aria-hidden="true">
        <div class="featured-projects__nebula featured-projects__nebula--1"></div>
        <div class="featured-projects__nebula featured-projects__nebula--2"></div>
        <div class="featured-projects__stars"></div>
    </div>

    <div class="featured-projects__container">
        <div class="featured-projects__header" data-aos="fade-up">
            <span class="section-tag"><i class="fa-solid fa-fire"></i> Top Picks</span>
            <h2 class="section-title">Featured <span class="gradient-text">Projects</span></h2>
        </div>

        <div class="featured-projects__grid">
            <div class="featured-projects__visual" data-aos="fade-right">
                <div class="featured-coin-scene">
                    <div class="featured-coin-platform" aria-hidden="true"></div>
                    <div class="featured-coin-glow" aria-hidden="true"></div>
                    <div class="featured-coin-ring featured-coin-ring--1" aria-hidden="true"></div>
                    <div class="featured-coin-ring featured-coin-ring--2" aria-hidden="true"></div>

                    <div class="featured-ticker featured-ticker--1 featured-ticker--up">
                        <span class="featured-ticker__icon"><i class="fa-brands fa-bitcoin"></i></span>
                        <span class="featured-ticker__body">
                            <small class="featured-ticker__pair">BTC / USD</small>
                            <strong class="featured-ticker__val">$67,256</strong>
                            <span class="featured-ticker__chg">+2.4%</span>
                        </span>
                    </div>
                    <div class="featured-ticker featured-ticker--2 featured-ticker--up">
                        <span class="featured-ticker__icon"><i class="fa-brands fa-ethereum"></i></span>
                        <span class="featured-ticker__body">
                            <small class="featured-ticker__pair">ETH / USD</small>
                            <strong class="featured-ticker__val">$3,604</strong>
                            <span class="featured-ticker__chg">+1.8%</span>
                        </span>
                    </div>
                    <div class="featured-ticker featured-ticker--3 featured-ticker--down">
                        <span class="featured-ticker__icon"><i class="fa-solid fa-dollar-sign"></i></span>
                        <span class="featured-ticker__body">
                            <small class="featured-ticker__pair">USDT / USD</small>
                            <strong class="featured-ticker__val">$1.00</strong>
                            <span class="featured-ticker__chg">-0.01%</span>
                        </span>
                    </div>
                    <div class="featured-ticker featured-ticker--4 featured-ticker--up">
                        <span class="featured-ticker__icon"><i class="fa-solid fa-coins"></i></span>
                        <span class="featured-ticker__body">
                            <small class="featured-ticker__pair">USDTW</small>
                            <strong class="featured-ticker__val" id="featuredTickerPrice">$0.000139</strong>
                            <span class="featured-ticker__chg">+8.2%</span>
                        </span>
                    </div>

                    <div class="featured-coin">
                        <div class="featured-coin__shadow" aria-hidden="true"></div>
                        <div class="featured-coin__body">
                            <div class="featured-coin__face featured-coin__face--front">
                                <span class="featured-coin__rim" aria-hidden="true"></span>
                                <span class="featured-coin__inner" aria-hidden="true"></span>
                                <img src="assets/images/usdtw.png" alt="USDT World Token" onerror="this.onerror=null;this.src='img/usdtw.png';" />
                            </div>
                            <div class="featured-coin__edge" aria-hidden="true"></div>
                            <div class="featured-coin__face featured-coin__face--back">
                                <span class="featured-coin__rim" aria-hidden="true"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="featured-project-card" data-aos="fade-left">
                <div class="featured-project-card__sheen" aria-hidden="true"></div>
                <div class="featured-project-card__accent" aria-hidden="true"></div>

                <div class="featured-project-card__topbar">
                    <span class="featured-project-card__badge featured-project-card__badge--live">
                        <span class="featured-project-card__pulse" aria-hidden="true"></span>
                        Live Sale
                    </span>
                    <span class="featured-project-card__badge featured-project-card__badge--chain">
                        <i class="fa-solid fa-cubes"></i>
                        Own Blockchain
                    </span>
                </div>

                <div class="featured-project-card__head">
                    <div class="featured-project-card__logo">
                        <img src="assets/images/usdtw.png" alt="USDTW" onerror="this.onerror=null;this.src='img/usdtw.png';" />
                    </div>
                    <div class="featured-project-card__intro">
                        <h3 class="featured-project-card__name">UWC+</h3>
                        <p class="featured-project-card__subtitle">USDT World Token Ecosystem</p>
                    </div>
                    <div class="featured-project-card__countdown">
                        <strong id="featuredDaysLeft">60</strong>
                        <span>Days Left</span>
                    </div>
                </div>

                <dl class="featured-project-card__details">
                    <div class="featured-project-row">
                        <dt><i class="fa-solid fa-align-left"></i> Description</dt>
                        <dd>USDT World disrupts traditional finance through decentralized applications (dApps) and smart contracts built for modern traders.</dd>
                    </div>
                    <div class="featured-project-row">
                        <dt><i class="fa-solid fa-star"></i> Key Features</dt>
                        <dd>Decentralized applications (dApps) and smart contracts. Yield farming and liquidity provision. Decentralized exchanges.</dd>
                    </div>
                    <div class="featured-project-row">
                        <dt><i class="fa-solid fa-circle-info"></i> Info</dt>
                        <dd>Secure, transparent token ecosystem with multi-market trading, staking rewards, and community-driven governance.</dd>
                    </div>
                    <div class="featured-project-row featured-project-row--price">
                        <dt><i class="fa-solid fa-tag"></i> Token Price</dt>
                        <dd>
                            <span class="featured-project-price">
                                1 <span id="featuredTokenSymbol">USDTW</span> = $<span id="featuredTokenPrice">0.000139</span> USD
                            </span>
                        </dd>
                    </div>
                </dl>

                <div class="featured-project-card__foot">
                    <a href="#token-sale" class="btn-featured-read">
                        Read More
                        <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ═══════ LAUNCHPAD BENEFITS ═══════ -->
<section class="launchpad-benefits" id="launchpad-benefits">
    <div class="launchpad-benefits__bg" aria-hidden="true">
        <div class="launchpad-benefits__glow launchpad-benefits__glow--1"></div>
        <div class="launchpad-benefits__glow launchpad-benefits__glow--2"></div>
    </div>
    <div class="launchpad-benefits__deco" aria-hidden="true">
        <div class="launchpad-parachute">
            <span class="launchpad-parachute__canopy"></span>
            <span class="launchpad-parachute__lines"></span>
            <span class="launchpad-parachute__coin"><i class="fa-brands fa-bitcoin"></i></span>
        </div>
    </div>

    <div class="launchpad-benefits__container">
        <span class="launchpad-benefits__eyebrow" data-aos="fade-up"><i class="fa-solid fa-layer-group"></i> Launchpad Benefits</span>
        <h2 class="launchpad-benefits__title" data-aos="fade-up">
            The Benefits of Using a <span>Crypto Launchpad</span>
        </h2>

        <div class="launchpad-benefits__grid">
            <article class="launchpad-card" data-aos="fade-up" data-aos-delay="0">
                <div class="launchpad-card__accent" aria-hidden="true"></div>
                <div class="launchpad-card__icon"><i class="fa-solid fa-shield-halved"></i></div>
                <h3 class="launchpad-card__title">Access to Vetted Projects</h3>
                <p class="launchpad-card__text">Access to vetted projects guarantees investors a curated selection of credible and high-quality opportunities, reducing the risk of fraudulent or low-quality investments.</p>
                <div class="launchpad-card__visual">
                    <figure class="launchpad-card__figure">
                        <img src="assets/images/benefit1.png" alt="" />
                    </figure>
                </div>
            </article>

            <article class="launchpad-card launchpad-card--early" data-aos="fade-up" data-aos-delay="100">
                <div class="launchpad-card__accent" aria-hidden="true"></div>
                <div class="launchpad-card__icon"><i class="fa-solid fa-rocket"></i></div>
                <h3 class="launchpad-card__title">Early Investment Opportunities</h3>
                <p class="launchpad-card__text">Early investment opportunities provide access to promising projects before they gain widespread attention, potentially offering significant returns on investment.</p>
                <div class="launchpad-card__visual">
                    <figure class="launchpad-card__figure">
                        <img src="assets/images/benefit2.png" alt="" />
                    </figure>
                </div>
            </article>

            <article class="launchpad-card launchpad-card--community" data-aos="fade-up" data-aos-delay="200">
                <div class="launchpad-card__accent" aria-hidden="true"></div>
                <div class="launchpad-card__icon"><i class="fa-solid fa-headset"></i></div>
                <h3 class="launchpad-card__title">Community and Support</h3>
                <p class="launchpad-card__text">Community and support networks foster collaboration, knowledge sharing, and mutual assistance within the cryptocurrency ecosystem.</p>
                <div class="launchpad-card__visual">
                    <figure class="launchpad-card__figure">
                        <img src="assets/images/benefit3.png" alt="" />
                    </figure>
                </div>
            </article>
        </div>
    </div>
</section>

<!-- ═══════ HOW TO GET STARTED ═══════ -->
<section class="get-started" id="get-started">
    <div class="get-started__bg" aria-hidden="true">
        <div class="get-started__glow"></div>
    </div>

    <div class="get-started__container">
        <div class="get-started__header" data-aos="fade-up">
            <span class="section-tag"><i class="fa-solid fa-route"></i> Quick Start</span>
            <h2 class="section-title">How to Get <span class="gradient-text">Started</span></h2>
        </div>

        <div class="get-started__grid">
            <article class="get-started-step get-started-step--featured" data-aos="fade-up" data-aos-delay="0">
                <div class="get-started-step__card">
                    <div class="get-started-step__icon get-started-step__icon--blue">
                        <i class="fa-solid fa-user-plus"></i>
                    </div>
                    <h3 class="get-started-step__title">Create Account</h3>
                    <p class="get-started-step__text">Create your account today to unlock a world of possibilities in the cryptocurrency and decentralized finance space.</p>
                    <a href="Register.aspx" class="get-started-step__btn">Signup</a>
                </div>
            </article>

            <article class="get-started-step" data-aos="fade-up" data-aos-delay="100">
                <div class="get-started-step__icon get-started-step__icon--gold">
                    <i class="fa-solid fa-id-card"></i>
                </div>
                <h3 class="get-started-step__title">Verify Your Identity</h3>
                <p class="get-started-step__text">Complete the identity verification process to ensure compliance and unlock full access to our platform's features.</p>
            </article>

            <article class="get-started-step" data-aos="fade-up" data-aos-delay="200">
                <div class="get-started-step__icon get-started-step__icon--gold">
                    <i class="fa-solid fa-wallet"></i>
                </div>
                <h3 class="get-started-step__title">Deposit Funds</h3>
                <p class="get-started-step__text">To begin investing, deposit funds securely into your account and start exploring our wide range of cryptocurrency opportunities.</p>
            </article>

            <article class="get-started-step" data-aos="fade-up" data-aos-delay="300">
                <div class="get-started-step__icon get-started-step__icon--gold">
                    <i class="fa-solid fa-chart-line"></i>
                </div>
                <h3 class="get-started-step__title">Start Trading</h3>
                <p class="get-started-step__text">Start trading today to take advantage of the dynamic cryptocurrency market and seize opportunities for growth and profit.</p>
            </article>
        </div>
    </div>
</section>

<!-- ═══════ ECOSYSTEM ═══════ -->
<section class="ecosystem-section" id="ecosystem">
    <div class="ecosystem-section__container">
        <header class="ecosystem-section__head" data-aos="fade-up">
            <span class="section-tag"><i class="fa-solid fa-globe"></i> Our Ecosystem</span>
            <h2 class="section-title">USDT World Ecosystem <span class="gradient-text">for Everyone</span></h2>
            <p class="section-sub">USDT World ecosystem embodies a dynamic and inclusive landscape, redefining decentralized finance (DeFi) with innovative platforms and a user-centric approach built for modern traders.</p>
        </header>

        <div class="ecosystem-section__grid">
            <article class="ecosystem-card" data-aos="fade-up" data-aos-delay="0">
                <div class="ecosystem-card__visual ecosystem-card__visual--trading" aria-hidden="true">
                    <div class="eco-pie">
                        <span class="eco-pie__slice eco-pie__slice--btc"><i class="fa-brands fa-bitcoin"></i></span>
                        <span class="eco-pie__slice eco-pie__slice--pink"></span>
                        <span class="eco-pie__slice eco-pie__slice--green"></span>
                    </div>
                </div>
                <h3 class="ecosystem-card__title">Token Trading</h3>
                <p class="ecosystem-card__text">Token trading enables users to seamlessly exchange cryptocurrencies and tokens, facilitating efficient portfolio management and market participation.</p>
            </article>

            <article class="ecosystem-card" data-aos="fade-up" data-aos-delay="100">
                <div class="ecosystem-card__visual ecosystem-card__visual--liquidity" aria-hidden="true">
                    <span class="eco-arrow eco-arrow--down"><i class="fa-solid fa-arrow-down"></i></span>
                    <div class="eco-bag">
                        <i class="fa-solid fa-sack-dollar"></i>
                    </div>
                    <span class="eco-arrow eco-arrow--up"><i class="fa-solid fa-arrow-up"></i></span>
                    <span class="eco-ring"></span>
                </div>
                <h3 class="ecosystem-card__title">Liquidity Provision</h3>
                <p class="ecosystem-card__text">Liquidity provision on our platform facilitates market efficiency by enabling users to contribute assets to pools and earn rewards through liquidity mining.</p>
            </article>

            <article class="ecosystem-card" data-aos="fade-up" data-aos-delay="200">
                <div class="ecosystem-card__visual ecosystem-card__visual--launchpad" aria-hidden="true">
                    <div class="eco-rocket">
                        <i class="fa-solid fa-rocket"></i>
                    </div>
                    <span class="eco-pad"></span>
                </div>
                <h3 class="ecosystem-card__title">Token Launchpad</h3>
                <p class="ecosystem-card__text">Our token launchpad offers a platform for new cryptocurrency projects to raise capital and gain exposure, fostering innovation and growth within the crypto ecosystem.</p>
            </article>
        </div>
    </div>
</section>

<!-- ═══════ ABOUT ═══════ -->
<section class="about-section" id="about">
    <div class="about-container">
        <div class="about-visual" data-aos="fade-right">
            <img src="assets/images/about_social_vista.png" alt="About USDT World" style="box-shadow: 0 20px 50px rgba(0,0,0,0.5);">
            <div class="about-float">
                <h3 class="gradient-text">USDTW</h3>
                <p>Native Token</p>
            </div>
            <div class="about-floating-icon a-float-1"><i class="fa-solid fa-coins"></i></div>
            <div class="about-floating-icon a-float-2"><i class="fa-solid fa-rocket"></i></div>
        </div>
        <div data-aos="fade-left">
            <span class="section-tag"><i class="fa-solid fa-star"></i> About USDTW</span>
            <h2 class="section-title">The Token Behind <span class="gradient-text">USDT World</span></h2>
            <p class="section-sub" style="margin-bottom: 10px;">USDTW powers the USDT World launchpad ecosystem — from presale access and staking rewards to governance and platform utility across token trading, liquidity, and new project launches.</p>
            <div class="about-features">
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(var(--primary-rgb),0.1);color:var(--primary);"><i class="fa-solid fa-tags"></i></div>
                    <div><h6>Early Presale Access</h6><p>Secure USDTW at $0.000139 before public listing and benefit from early-bird pricing.</p></div>
                </div>
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(var(--secondary-rgb),0.1);color:var(--secondary);"><i class="fa-solid fa-layer-group"></i></div>
                    <div><h6>Launchpad Utility</h6><p>Use USDTW to participate in vetted token launches, liquidity pools, and ecosystem rewards.</p></div>
                </div>
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(16,185,129,0.1);color:var(--emerald);"><i class="fa-solid fa-chart-line"></i></div>
                    <div><h6>Transparent Tokenomics</h6><p>Track presale progress, raise targets, and sale milestones in real time on our platform.</p></div>
                </div>
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(245,158,11,0.1);color:var(--gold);"><i class="fa-solid fa-shield-halved"></i></div>
                    <div><h6>Secure &amp; Audited</h6><p>Built with institutional-grade security, smart contract best practices, and investor protection in mind.</p></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ═══════ MARKETS ═══════ -->
<section class="markets-section" id="markets" style="display: none;">
    <div class="markets-container">
        <div class="markets-header" data-aos="fade-up">
            <span class="section-tag"><i class="fa-solid fa-chart-bar"></i> Live Markets</span>
            <h2 class="section-title">Services <span class="gradient-text">We offer</span></h2>
            <p class="section-sub">We offer the best services around — from strategy consulting and financial advisory to exchange optimization and marketing support.</p>
        </div>
        <div class="market-grid" data-aos="fade-up" data-aos-delay="150">
            <div class="market-feature-card">
                <div class="feature-icon"><i class="fa-solid fa-chart-column"></i></div>
                <h5>Strategy Consulting</h5>
                <p>A social assistant that's flexible can accommodate your schedule and needs, making life easier.</p>
            </div>
            <div class="market-feature-card">
                <div class="feature-icon"><i class="fa-solid fa-wallet"></i></div>
                <h5>Financial Advisory</h5>
                <p>Modules transform smart trading by automating processes and improving decision-making.</p>
            </div>
            <div class="market-feature-card">
                <div class="feature-icon"><i class="fa-solid fa-chart-line"></i></div>
                <h5>Management</h5>
                <p>There, it’s me, your friendly neighborhood report’s news analyst processes and improving currency.</p>
            </div>
            <div class="market-feature-card">
                <div class="feature-icon"><i class="fa-solid fa-mobile-screen-button"></i></div>
                <h5>Supply Optimization</h5>
                <p>Hey, have you checked out that new cryptocurrency platform? It’s pretty cool and easy to use!</p>
            </div>
            <div class="market-feature-card">
                <div class="feature-icon"><i class="fa-solid fa-arrows-rotate"></i></div>
                <h5>Exchange Consulting</h5>
                <p>Hey guys, just a quick update on exchange orders. There have been some changes in currency!</p>
            </div>
            <div class="market-feature-card">
                <div class="feature-icon"><i class="fa-solid fa-bullhorn"></i></div>
                <h5>Marketing Consulting</h5>
                <p>Hey! Just wanted to let you know that the price notification module processes is now live changes trading!</p>
            </div>
        </div>
    </div>
</section>

<!-- ═══════ SERVICES ═══════ -->
<section class="services-section" id="services" style="display: none;">
    <div class="services-container">
        <div class="services-header" data-aos="fade-up">
            <span class="section-tag"><i class="fa-solid fa-rocket"></i> Our Services</span>
            <h2 class="section-title">Powerful <span class="gradient-text">Trading Tools</span></h2>
            <p class="section-sub">Everything you need to succeed in global financial markets, from AI signals to portfolio management.</p>
        </div>
        <div class="services-grid">
            <div class="svc-card" data-aos="fade-up" data-aos-delay="0">
                <div class="svc-icon" style="background:rgba(var(--primary-rgb),0.1);color:var(--primary);"><i class="fa-solid fa-brain"></i></div>
                <h5>AI-Powered Analytics</h5>
                <p>Our intelligent algorithms analyze millions of data points in real-time to give you the edge in every trade.</p>
            </div>
            <div class="svc-card" data-aos="fade-up" data-aos-delay="20">
                <div class="svc-icon" style="background:rgba(var(--secondary-rgb),0.1);color:var(--secondary);"><i class="fa-solid fa-bolt-lightning"></i></div>
                <h5>Instant Execution</h5>
                <p>Sub-millisecond trade execution ensures you never miss a market opportunity. Speed is our superpower.</p>
            </div>
            <div class="svc-card" data-aos="fade-up" data-aos-delay="40">
                <div class="svc-icon" style="background:rgba(16,185,129,0.1);color:var(--emerald);"><i class="fa-solid fa-shield-halved"></i></div>
                <h5>Bank-Grade Security</h5>
                <p>256-bit encryption, 2FA, and cold wallet storage keep your assets safe. Your security is our top priority.</p>
            </div>
            <div class="svc-card" data-aos="fade-up" data-aos-delay="80">
                <div class="svc-icon" style="background:rgba(245,158,11,0.1);color:var(--gold);"><i class="fa-solid fa-chart-pie"></i></div>
                <h5>Portfolio Manager</h5>
                <p>Track, analyze, and optimize your portfolio performance with our advanced dashboard and reporting tools.</p>
            </div>
            <div class="svc-card" data-aos="fade-up" data-aos-delay="160">
                <div class="svc-icon" style="background:rgba(var(--accent-rgb),0.1);color:var(--accent);"><i class="fa-solid fa-bell"></i></div>
                <h5>Smart Alerts</h5>
                <p>Set custom price alerts and get notified instantly via push, email, or SMS when markets move your way.</p>
            </div>
            <div class="svc-card" data-aos="fade-up" data-aos-delay="320">
                <div class="svc-icon" style="background:rgba(236,72,153,0.1);color:#ec4899;"><i class="fa-solid fa-graduation-cap"></i></div>
                <h5>Trading Academy</h5>
                <p>Access 500+ hours of expert courses and live webinars. From beginner basics to advanced strategies.</p>
            </div>
        </div>
    </div>
</section>



<!-- ═══════ TESTIMONIALS ═══════ -->
<section class="testimonials-section" id="testimonials">
    <div class="testimonials-container">
        <div class="testimonials-header section-header-row" data-aos="fade-up">
            <div class="section-header-text">
                <span class="section-tag"><i class="fa-solid fa-quote-left"></i> Testimonials</span>
                <h2 class="section-title">Trusted by <span class="gradient-text">Early Investors</span></h2>
                <p class="section-sub">See what presale participants and token holders say about the USDTW experience.</p>
            </div>
            <div class="swiper-nav">
                <button type="button" class="swiper-button-prev testimonials-prev" aria-label="Previous testimonial"></button>
                <button type="button" class="swiper-button-next testimonials-next" aria-label="Next testimonial"></button>
            </div>
        </div>
        <div class="testimonials-swiper swiper" data-aos="fade-up">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <blockquote>"I joined the USDTW presale early and the process was seamless. Clear pricing at $0.000139, transparent progress bar, and instant registration — exactly what I wanted from a launchpad token."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">AK</div>
                            <div><h6>Aarav Kumar</h6><span>Presale Investor · Mumbai</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <blockquote>"USDT World launchpad gave me access to vetted projects I couldn't find elsewhere. Holding USDTW unlocks early allocations and the ecosystem feels well thought out."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">SR</div>
                            <div><h6>Sarah Rahman</h6><span>Token Holder · Dubai</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star-half-stroke"></i>
                        </div>
                        <blockquote>"The presale countdown and raise tracker built real trust. I knew exactly how much was raised toward the $100K target before I committed my allocation."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">DP</div>
                            <div><h6>Deepak Patel</h6><span>Crypto Investor · Delhi</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <blockquote>"USDTW isn't just a token — it's the key to the whole platform. Staking, launchpad access, and liquidity features all tie back to holding USDTW. Strong utility from day one."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">MJ</div>
                            <div><h6>Meera Joshi</h6><span>DeFi Enthusiast · Bangalore</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <blockquote>"I was new to token presales but USDT World made it simple. Register, buy USDTW, and track everything in one dashboard. Great onboarding for first-time investors."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">RS</div>
                            <div><h6>Rohan Sharma</h6><span>Early Backer · Pune</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ═══════ NEWSLETTER SIGNUP ═══════ -->
<section class="newsletter-banner" id="newsletter" style="display:none">
    <div class="newsletter-banner__container">
        <div class="newsletter-banner__box" data-aos="fade-up">
            <div class="newsletter-banner__content">
                <h2 class="newsletter-banner__title">Sign up for Updates</h2>
                <form class="newsletter-banner__form" id="newsletterSignupForm" novalidate>
                    <label class="newsletter-banner__label" for="newsletterEmail">Email Address</label>
                    <div class="newsletter-banner__row">
                        <input type="email" id="newsletterEmail" class="newsletter-banner__input" placeholder="example@gmail.com" autocomplete="email" required />
                        <button type="submit" class="newsletter-banner__btn">Signup</button>
                    </div>
                    <label class="newsletter-banner__consent">
                        <input type="checkbox" id="newsletterConsent" required />
                        <span>I agree to receive emails from USDT World</span>
                    </label>
                    <p class="newsletter-banner__msg" id="newsletterMsg" aria-live="polite"></p>
                </form>
            </div>

            <div class="newsletter-banner__coins" aria-hidden="true">
                <img src="assets/images/newsletter-coins.png" alt="" width="492" height="445" loading="lazy" />
            </div>
        </div>
    </div>
</section>

<!-- ═══════ CTA ═══════ -->
<section class="cta-section">
    <div class="cta-container">
        <div class="cta-box" data-aos="zoom-in">
            <div class="cta-bg-effects">
                <div class="cta-brand-orb cta-brand-orb--1"></div>
                <div class="cta-brand-orb cta-brand-orb--2"></div>
                <div class="cta-brand-orb cta-brand-orb--3"></div>
                <div class="cta-brand-orb cta-brand-orb--4"></div>
                <div class="cta-deco-particle cta-deco-particle--1"></div>
                <div class="cta-deco-particle cta-deco-particle--2"></div>
                <div class="cta-deco-particle cta-deco-particle--3"></div>
                <div class="cta-deco-particle cta-deco-particle--4"></div>
                <div class="cta-deco-particle cta-deco-particle--5"></div>
                <div class="cta-geo-deco cta-geo-deco--ring"></div>
                <div class="cta-geo-deco cta-geo-deco--ring-left"></div>
                <div class="cta-geo-deco cta-geo-deco--diamond"></div>
                <div class="cta-geo-deco cta-geo-deco--diamond-left"></div>
                <div class="cta-geo-deco cta-geo-deco--triangle"></div>
                <div class="cta-geo-deco cta-geo-deco--dots">
                    <span></span><span></span><span></span>
                    <span></span><span></span><span></span>
                    <span></span><span></span><span></span>
                </div>
            </div>
            <div class="cta-icons">
                <div class="cta-icon cta-icon-1"><i class="fab fa-bitcoin"></i></div>
                <div class="cta-icon cta-icon-2"><i class="fab fa-ethereum"></i></div>
                <div class="cta-icon cta-icon-3"><i class="fa-solid fa-coins"></i></div>
                <div class="cta-icon cta-icon-4"><i class="fa-solid fa-chart-line"></i></div>
            </div>
            <h2>Ready to Buy <span class="gradient-text">USDTW?</span></h2>
            <p>Join the USDT World presale at $0.000139 per token. Secure your allocation before the sale ends and be part of the next-generation crypto launchpad ecosystem.</p>
            <a href="Register.aspx" class="btn-hero-primary">Buy USDTW Token <i class="fa-solid fa-arrow-right"></i></a>
        </div>
    </div>
</section>

<!-- ═══════ FAQ SECTION ═══════ -->
<section class="faq-section" id="faq">
    <div class="faq-container">
        <div class="faq-block" data-aos="fade-up">
            <span class="section-tag"><i class="fa-solid fa-question"></i> Frequently Asked Questions</span>
            <h2 class="section-title">Quick Answers About <span class="gradient-text">USDTW</span></h2>
            <p class="section-sub">Everything you need to know about the USDT World token, presale, and how to participate.</p>
            <div class="faq-layout">
                <div class="faq-content" data-aos="fade-right">
                    <div class="faq-grid">
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>What is the USDTW token?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>USDTW is the native utility token of USDT World. It powers the launchpad ecosystem — enabling presale participation, staking rewards, governance voting, and access to token trading, liquidity provision, and new project launches on the platform.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>How do I buy USDTW in the presale?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>Click "Buy USDTW" or "Register" on our homepage, create your account, and complete the registration process. Once verified, you can purchase USDTW at the current presale price of $0.000139 per token before the public sale ends.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>What is the presale price and raise target?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>Each USDTW token is priced at $0.000139 (USD) during the presale. The targeted raise is $100,000 USD, with live progress tracking available on the Token Sale section of our homepage.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>When does the token sale end?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>The pre-token sale runs until December 31, 2026. A live countdown timer on our homepage shows the exact time remaining. We recommend securing your allocation early as presale tiers may sell out before the deadline.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>What can I do with USDTW after purchase?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>USDTW holders can access the USDT World launchpad for vetted project allocations, participate in liquidity pools, earn staking rewards, and use the token across the platform's trading and ecosystem features as they go live.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>Is the USDTW presale safe?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>USDT World follows smart contract security best practices and provides transparent sale metrics on-chain and on-platform. Always verify you're on the official usdtworld.com site, never share your private keys, and only invest what you can afford to lose.</p>
                                <h6 style="color: #fff; margin: 15px 0 10px;">Safety Tips</h6>
                                <p>Verify the official website URL<br>Never send funds to unofficial wallets<br>Complete KYC only through our platform<br>Track your purchase in your dashboard<br>Contact support for any doubts before investing</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="faq-visual" data-aos="fade-left" style="position: relative;">
                    <img src="assets/images/faq_illustration.png" alt="FAQ support illustration" style="border-radius: 20px; max-width: 100%; height: auto; position: relative; z-index: 1;">
                    <div class="faq-visual-badge">
                        <i class="fa-solid fa-headset"></i>
                        <div>
                            <strong>24/7 Support</strong>
                            <span>We are here to help</span>
                        </div>
                    </div>
                    <div class="faq-visual-badge-2">
                        <i class="fa-solid fa-bolt"></i>
                        <div>
                            <strong>Fast Answers</strong>
                            <span>Instant replies</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ═══════ ARTICLES SECTION ═══════ -->
<section class="articles-section" id="articles">
    <div class="articles-container">
        <div class="articles-block" data-aos="fade-up">
            <div class="articles-header section-header-row">
                <div class="section-header-text">
                    <span class="section-tag"><i class="fa-solid fa-newspaper"></i> Latest Articles</span>
                    <h2 class="section-title">USDTW &amp; <span class="gradient-text">Token Insights</span></h2>
                    <p class="section-sub">Read the latest on USDTW presale, launchpad updates, tokenomics, and crypto investing guides.</p>
                </div>
                <div class="swiper-nav">
                    <button type="button" class="swiper-button-prev articles-prev" aria-label="Previous article"></button>
                    <button type="button" class="swiper-button-next articles-next" aria-label="Next article"></button>
                </div>
            </div>
            <div class="articles-swiper swiper" data-aos="fade-up">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/1.png" alt="Crypto portfolio chart"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 20, 2026</span><span>•</span><span>Token Sale</span></div>
                            <h5>USDTW Presale: A Complete Guide</h5>
                            <p>Everything you need to know about buying USDTW at $0.000139, sale milestones, and how to secure your allocation.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/2.png" alt="Volatility market view"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 18, 2026</span><span>•</span><span>Tokenomics</span></div>
                            <h5>Understanding USDTW Token Utility</h5>
                            <p>How USDTW powers the launchpad, staking, governance, and liquidity features across the USDT World ecosystem.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/3.png" alt="Platform feature highlights"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 15, 2026</span><span>•</span><span>Launchpad</span></div>
                            <h5>Why Crypto Launchpads Matter</h5>
                            <p>Discover how USDT World's launchpad vets projects and gives USDTW holders early access to high-potential token sales.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/5.png" alt="Crypto trading strategies"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 14, 2026</span><span>•</span><span>Presale Tips</span></div>
                            <h5>5 Tips for First-Time Token Buyers</h5>
                            <p>From verifying the official site to tracking raise progress — a practical checklist before joining any crypto presale.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/6.png" alt="Crypto security guide"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 12, 2026</span><span>•</span><span>Security</span></div>
                            <h5>Securing Your USDTW Investment</h5>
                            <p>Best practices for wallet safety, avoiding scams, and protecting your tokens after the presale purchase.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsContent" runat="server">
<script src="assets/js/index.js"></script>
</asp:Content>
