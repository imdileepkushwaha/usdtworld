<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="socialvista._Default" %>

<asp:Content ID="HeadStyles" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- ═══════ HERO ═══════ -->
<section class="hero">
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
            <div class="hero-badge"><span class="live-dot"></span> Markets Open - 24/7</div>
            <h1 class="hero-title">
                Trade <span class="shimmer">Smarter,</span>
                <span class="line-2">Grow Faster.</span>
            </h1>
            <p class="hero-desc">Access global Crypto, Forex, and Stock markets from one powerful platform. AI-powered insights, real-time analytics, and lightning-fast execution at your fingertips.</p>
            <div class="hero-actions">
                <a href="Register.aspx" class="btn-hero-primary">Start Trading <i class="fa-solid fa-arrow-right"></i></a>
                <a href="#markets" class="btn-hero-secondary"><i class="fa-solid fa-chart-line"></i> Explore Markets</a>
            </div>
            <div class="hero-metrics">
                <div class="hero-metric">
                    <h3 id="counterUsers">0</h3>
                    <p>Active Traders</p>
                </div>
                <div class="hero-metric">
                    <h3>$2.5B+</h3>
                    <p>Trading Volume</p>
                </div>
                <div class="hero-metric">
                    <h3>150+</h3>
                    <p>Instruments</p>
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
<img src="assets/images/about_image.svg" alt="Crypto trading illustration" class="hero-img" />
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
    <div class="ticker-bar">
        <div class="ticker-track" id="tickerTrack">
            <div class="ticker-item"><span class="t-name">Loading live data...</span></div>
        </div>
    </div>



<!-- ═══════ ABOUT ═══════ -->
<section class="about-section" id="about">
    <div class="about-container">
        <div class="about-visual" data-aos="fade-right">
            <img src="assets/images/about_social_vista.png" alt="About USDT World" style="box-shadow: 0 20px 50px rgba(0,0,0,0.5);">
            <div class="about-float">
                <h3 class="gradient-text">98%</h3>
                <p>Client Satisfaction</p>
            </div>
            <div class="about-floating-icon a-float-1"><i class="fa-solid fa-chart-pie"></i></div>
            <div class="about-floating-icon a-float-2"><i class="fa-solid fa-bullseye"></i></div>
        </div>
        <div data-aos="fade-left">
            <span class="section-tag"><i class="fa-solid fa-star"></i> Why USDT World</span>
            <h2 class="section-title">Built for <span class="gradient-text">Modern Traders</span></h2>
            <p class="section-sub" style="margin-bottom: 10px;">We combine cutting-edge technology with years of market expertise to deliver a platform that empowers traders worldwide.</p>
            <div class="about-features">
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(var(--primary-rgb),0.1);color:var(--primary);"><i class="fa-solid fa-rocket"></i></div>
                    <div><h6>Lightning Fast Execution</h6><p>Sub-millisecond order processing for optimal results.</p></div>
                </div>
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(var(--secondary-rgb),0.1);color:var(--secondary);"><i class="fa-solid fa-globe"></i></div>
                    <div><h6>Global Market Access</h6><p>Trade across 150+ instruments in Crypto, Forex, and Stocks.</p></div>
                </div>
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(16,185,129,0.1);color:var(--emerald);"><i class="fa-solid fa-headset"></i></div>
                    <div><h6>24/7 Expert Support</h6><p>Our dedicated support team is always available to assist you.</p></div>
                </div>
                <div class="about-feat">
                    <div class="about-feat-icon" style="background:rgba(245,158,11,0.1);color:var(--gold);"><i class="fa-solid fa-lock"></i></div>
                    <div><h6>Regulated & Secure</h6><p>Fully licensed platform with institutional-grade security.</p></div>
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
<section class="services-section" id="services">
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
                <h2 class="section-title">Trusted by <span class="gradient-text">Thousands</span></h2>
                <p class="section-sub">See what our traders have to say about their experience with USDT World.</p>
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
                        <blockquote>"USDT World completely transformed my trading. The AI analytics helped me increase my returns by 340% in just 6 months. Absolutely incredible platform."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">AK</div>
                            <div><h6>Aarav Kumar</h6><span>Crypto Trader · Mumbai</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <blockquote>"The Forex signals and real-time execution are unmatched. I moved from three different platforms to just USDT World. It has everything I need."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">SR</div>
                            <div><h6>Sarah Rahman</h6><span>Forex Specialist · Dubai</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star-half-stroke"></i>
                        </div>
                        <blockquote>"Best stock trading experience I've ever had. The portfolio manager alone is worth the switch. Clean interface, powerful tools, great support."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">DP</div>
                            <div><h6>Deepak Patel</h6><span>Stock Investor · Delhi</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <blockquote>"The smart alerts saved me from a major market dip last month. I get notified exactly when I need to act — no more staring at charts all day."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">MJ</div>
                            <div><h6>Meera Joshi</h6><span>Day Trader · Bangalore</span></div>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="testi-card">
                        <div class="testi-stars">
                            <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
                        </div>
                        <blockquote>"I started with zero trading knowledge. The Trading Academy courses and demo account helped me go from beginner to confident trader in just 3 months."</blockquote>
                        <div class="testi-author">
                            <div class="testi-avatar">RS</div>
                            <div><h6>Rohan Sharma</h6><span>Options Trader · Pune</span></div>
                        </div>
                    </div>
                </div>
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
            <h2>Ready to Start <span class="gradient-text">Trading?</span></h2>
            <p>Join thousands of traders who trust USDT World. Create your free account in under 2 minutes and start growing your portfolio today.</p>
            <a href="Register.aspx" class="btn-hero-primary">Create Free Account <i class="fa-solid fa-arrow-right"></i></a>
        </div>
    </div>
</section>

<!-- ═══════ FAQ SECTION ═══════ -->
<section class="faq-section" id="faq">
    <div class="faq-container">
        <div class="faq-block" data-aos="fade-up">
            <span class="section-tag"><i class="fa-solid fa-question"></i> Frequently Asked Questions</span>
            <h2 class="section-title">Quick Answers For Traders</h2>
            <p class="section-sub">Explore the most common questions about our platform, account setup, and market access.</p>
            <div class="faq-layout">
                <div class="faq-content" data-aos="fade-right">
                    <div class="faq-grid">
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>What does this tool do?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>Online trading’s primary advantages are that it allows you to manage your trades at your convenience.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>What are the disadvantages of online trading?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>Yes, online trading involves market risk. Prices of assets like stocks or cryptocurrencies can fluctuate quickly, which may lead to losses if trades are not managed properly.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>Is online trading safe?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>It can be safe, but only if you use the right platform and follow proper precautions.</p>
                                <h6 style="color: #fff; margin: 15px 0 10px;">Smart Safety Tips</h6>
                                <p>Start with a small investment<br>Always verify platform credibility<br>Use secure internet (avoid public WiFi)<br>Withdraw profits regularly<br>Keep learning before scaling</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>What is online trading, and how does it work?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>Online trading means buying and selling financial assets through the internet using a trading platform or app.<br>Online trading is like digital buying & selling in financial markets, where you earn based on price movements.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>Which app is best for online trading?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>USDT World App is one of the most advanced platforms powered by AI-driven trading technology, designed to help users trade smarter and faster. With intelligent automation and real-time market insights, it simplifies trading for both beginners and professionals.</p>
                            </div>
                        </div>
                        <div class="faq-item">
                            <button type="button" class="faq-question">
                                <span>How to create a trading account?</span>
                                <i class="fa-solid fa-plus"></i>
                            </button>
                            <div class="faq-answer">
                                <p>To create a trading account, first choose a reliable trading platform or broker, then sign up by providing your basic details like name, mobile number, and email. After registration, complete the KYC (Know Your Customer) process by uploading documents such as your ID proof, address proof, PAN card, and bank details. Once your verification is approved, link your bank account and add funds to your wallet. After funding, your trading account becomes active, and you can start buying and selling assets like stocks, cryptocurrencies, or forex directly through the app or website.</p>
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
                    <h2 class="section-title">Insightful Trading Stories</h2>
                    <p class="section-sub">Read our latest market insights, strategy guides, and product updates.</p>
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
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 20, 2026</span><span>•</span><span>Trading Strategy</span></div>
                            <h5>Swing Trading Definition</h5>
                            <p>Our platform is not only about trading-it's also a hub for knowledge and learning.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/2.png" alt="Volatility market view"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 18, 2026</span><span>•</span><span>Trading Market</span></div>
                            <h5>Hedge Funds Work?</h5>
                            <p>To cater to your individual trading preferences, we offer a variety of order types,
                      including market.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/3.png" alt="Platform feature highlights"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 15, 2026</span><span>•</span><span>Platform Tips</span></div>
                            <h5>Options Trading business?</h5>
                            <p>Security is our top priority, and we employ robust measures to ensure the safety of
                      your funds.</p>
                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/4.png" alt="Platform feature highlights"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 15, 2026</span><span>•</span><span>Platform Tips</span></div>
                            <h5>Options Trading business?</h5>
                            <p>Security is our top priority, and we employ robust measures to ensure the safety of
                      your funds.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/5.png" alt="Crypto trading strategies"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 21, 2026</span><span>•</span><span>Crypto Trading</span></div>
                            <h5>Mastering Bitcoin Trading</h5>
                            <p>Learn the fundamental strategies for trading Bitcoin and understanding blockchain market cycles.</p>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="article-card-item">
                            <div class="article-thumb"><img src="assets/images/blog/6.png" alt="Crypto security guide"></div>
                            <div class="article-meta"><i class="fa-solid fa-calendar-days"></i><span>May 21, 2026</span><span>•</span><span>Crypto Security</span></div>
                            <h5>Securing Your Crypto Assets</h5>
                            <p>A comprehensive guide on cold wallets, multi-sig vaults, and keeping your digital assets safe.</p>
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
