<%@ Page Title="Spot Trading" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SpotTrading.aspx.cs" Inherits="user_SpotTrading" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="css/dashboard-page.css" rel="stylesheet" />

    <link href="css/spot-trading.css" rel="stylesheet" />

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">

    <div class="sv-dashboard-page sv-spot-page">

        <div class="sv-dash-header sv-spot-header">

            <div class="sv-dash-header__glow sv-dash-header__glow--1"></div>

            <div class="sv-dash-header__glow sv-dash-header__glow--2"></div>

            <div class="sv-dash-header__grid"></div>



            <div class="sv-dash-header__main">

                <div class="sv-dash-header__icon sv-spot-header__icon">

                    <i class="fa-solid fa-chart-line"></i>

                </div>

                <div class="sv-dash-header__text">

                    <span class="sv-dash-header__eyebrow">

                        <span class="sv-dash-header__pulse"></span>

                        Live Market

                    </span>

                    <h1>Spot Trading</h1>

                    <p>Trade UWC+ instantly at live market price</p>

                </div>

            </div>



            <div class="sv-dash-header__actions">

                <a href="Dashboard.aspx" class="sv-dash-breadcrumb">

                    <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>

                    Dashboard

                </a>

            </div>

        </div>

    </div>

</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">

    <div class="sv-dashboard-page sv-spot-page">

        <asp:HiddenField ID="hdnUserId" runat="server" />

        <asp:HiddenField ID="hdnUsdtBalance" runat="server" />



        <section class="sv-spot-hero sv-spot-hero--compact" aria-live="polite">

            <div class="sv-spot-hero__bg" aria-hidden="true">
                <span class="sv-spot-hero__glow sv-spot-hero__glow--1"></span>
                <span class="sv-spot-hero__glow sv-spot-hero__glow--2"></span>
                <span class="sv-spot-hero__grid"></span>
            </div>

            <div class="sv-spot-hero__body">
                <div class="sv-spot-hero__left">
                    <div class="sv-spot-hero__pair">
                        <span class="sv-spot-hero__coin-wrap" aria-hidden="true">
                            <span class="sv-spot-hero__coin-ring"></span>
                            <span class="sv-spot-hero__coin">U+</span>
                        </span>
                        <div class="sv-spot-hero__pair-text">
                            <div class="sv-spot-hero__pair-top">
                                <h2 class="sv-spot-hero__pair-name">UWC+<span class="sv-spot-hero__pair-quote">/USDT</span></h2>
                                <span class="sv-spot-hero__tag">Spot</span>
                                <span class="sv-spot-hero__tag sv-spot-hero__tag--live"><span class="sv-spot-live-dot"></span>Live</span>
                            </div>
                            <span class="sv-spot-hero__sub" id="svSpotIntervalLabel"><i class="fa-solid fa-chart-line"></i> 15m candles</span>
                        </div>
                    </div>
                </div>

                <div class="sv-spot-hero__center">
                    <span class="sv-spot-hero__price-label">Last Price</span>
                    <div class="sv-spot-hero__price-row">
                        <span id="svSpotPrice" class="sv-spot-hero__price">$0.00040000</span>
                        <span id="svSpotChange" class="sv-spot-hero__change sv-spot-hero__change--up">
                            <i class="fa-solid fa-caret-up sv-spot-hero__change-icon" aria-hidden="true"></i>
                            <span class="sv-spot-hero__change-text">+0.00%</span>
                        </span>
                    </div>
                </div>
            </div>

            <div class="sv-spot-hero__footer">
                <div class="sv-spot-hero__stat">
                    <span class="sv-spot-hero__stat-label">24h High</span>
                    <strong id="svSpotHigh" class="sv-spot-hero__stat-value sv-spot-hero__stat-value--high">$0.00042000</strong>
                </div>
                <div class="sv-spot-hero__stat">
                    <span class="sv-spot-hero__stat-label">24h Low</span>
                    <strong id="svSpotLow" class="sv-spot-hero__stat-value sv-spot-hero__stat-value--low">$0.00013500</strong>
                </div>
                <div class="sv-spot-hero__stat-divider" aria-hidden="true"></div>
                <div class="sv-spot-hero__stat">
                    <span class="sv-spot-hero__stat-label">Launch</span>
                    <strong class="sv-spot-hero__stat-value">$0.000139</strong>
                </div>
                <div class="sv-spot-hero__stat">
                    <span class="sv-spot-hero__stat-label">Since Launch</span>
                    <strong id="svSpotLaunchGain" class="sv-spot-hero__stat-value sv-spot-hero__stat-value--up">+0.00%</strong>
                </div>
                <div class="sv-spot-hero__stat">
                    <span class="sv-spot-hero__stat-label">Updated</span>
                    <strong id="svSpotUpdated" class="sv-spot-hero__stat-value">--:--</strong>
                </div>
                <div class="sv-spot-hero__stat sv-spot-hero__stat--live">
                    <span class="sv-spot-hero__stat-label">Market</span>
                    <strong class="sv-spot-hero__stat-value sv-spot-hero__stat-value--live">Open</strong>
                </div>
            </div>

        </section>



        <div class="row g-3 sv-spot-layout">

            <div class="col-xl-8 sv-spot-layout__chart-col">

                <div class="sv-panel sv-spot-chart-panel">

                    <div class="sv-panel__head sv-spot-chart-toolbar">

                        <div class="sv-spot-chart-toolbar__left">

                            <h6><i class="fa-solid fa-chart-line"></i> UWC+ Chart</h6>

                            <div class="sv-spot-intervals" role="group" aria-label="Chart interval">
                                <button type="button" class="sv-spot-interval" data-interval="1">1m</button>
                                <button type="button" class="sv-spot-interval" data-interval="5">5m</button>
                                <button type="button" class="sv-spot-interval is-active" data-interval="15">15m</button>
                                <button type="button" class="sv-spot-interval" data-interval="1440">1d</button>
                            </div>

                        </div>

                        <div class="sv-spot-ohlc" id="svSpotOhlc">

                            <span>O <em id="svSpotO">—</em></span>

                            <span>H <em id="svSpotH">—</em></span>

                            <span>L <em id="svSpotL">—</em></span>

                            <span>C <em id="svSpotC">—</em></span>

                        </div>

                    </div>

                    <div class="sv-panel__body sv-spot-chart-panel__body">

                        <div class="sv-spot-chart-frame">

                            <div id="svSpotChart" class="sv-spot-chart"></div>

                        </div>

                    </div>

                </div>



                <div class="sv-panel sv-spot-order-panel">

                    <div class="sv-panel__head sv-spot-order-panel__head">

                        <h6><i class="fa-solid fa-bolt"></i> Place Order</h6>

                        <span class="sv-spot-order-type">Market</span>

                    </div>

                    <div class="sv-panel__body sv-spot-order-panel__body">

                        <div class="sv-spot-order-toolbar">

                            <div class="sv-spot-balances sv-spot-balances--compact">

                                <div class="sv-spot-balance-chip sv-spot-balance-chip--usdt">

                                    <span class="sv-spot-balance-chip__label">USDT</span>

                                    <strong id="svSpotUsdtBal" class="sv-spot-balance-chip__value">0.00</strong>

                                </div>

                                <div class="sv-spot-balance-chip sv-spot-balance-chip--uwc">

                                    <span class="sv-spot-balance-chip__label">UWC+</span>

                                    <strong id="svSpotUwcBal" class="sv-spot-balance-chip__value">0.00</strong>

                                </div>

                            </div>

                            <div class="sv-spot-order-meta">

                                <span>Market price</span>

                                <strong id="svSpotEstPrice">$0.00040000</strong>

                            </div>

                        </div>



                        <div class="row g-0 sv-spot-order-split">

                            <div class="col-md-6 sv-spot-order-col sv-spot-order-col--buy">

                                <div class="sv-spot-order-col__head">

                                    <i class="fa-solid fa-arrow-trend-up"></i> Buy UWC+

                                </div>

                                <label class="sv-spot-field">

                                    <span class="sv-spot-field__row">

                                        <span class="sv-spot-field__label">Amount</span>

                                        <span class="sv-spot-field__unit">USDT</span>

                                    </span>

                                    <div class="sv-spot-input-wrap">

                                        <input type="number" id="txtSpotBuyAmount" class="form-control sv-spot-input" min="0" step="any" placeholder="0.00" />

                                    </div>

                                </label>

                                <div class="sv-spot-quick-amt">

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="buy" data-pct="25">25%</button>

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="buy" data-pct="50">50%</button>

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="buy" data-pct="75">75%</button>

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="buy" data-pct="100">Max</button>

                                </div>

                                <div class="sv-spot-receive-box">

                                    <span>You receive</span>

                                    <strong id="svSpotBuyReceive">0 UWC+</strong>

                                </div>

                                <p id="svSpotBuyMsg" class="sv-spot-order-msg"></p>

                                <button type="button" id="btnSpotBuySubmit" class="sv-spot-submit sv-spot-submit--buy">

                                    <i class="fa-solid fa-arrow-trend-up"></i> Buy UWC+

                                </button>

                            </div>



                            <div class="col-md-6 sv-spot-order-col sv-spot-order-col--sell">

                                <div class="sv-spot-order-col__head">

                                    <i class="fa-solid fa-arrow-trend-down"></i> Sell UWC+

                                </div>

                                <label class="sv-spot-field">

                                    <span class="sv-spot-field__row">

                                        <span class="sv-spot-field__label">Amount</span>

                                        <span class="sv-spot-field__unit">UWC+</span>

                                    </span>

                                    <div class="sv-spot-input-wrap">

                                        <input type="number" id="txtSpotSellAmount" class="form-control sv-spot-input" min="0" step="any" placeholder="0.00" />

                                    </div>

                                </label>

                                <div class="sv-spot-quick-amt">

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="sell" data-pct="25">25%</button>

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="sell" data-pct="50">50%</button>

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="sell" data-pct="75">75%</button>

                                    <button type="button" class="sv-spot-quick-amt__btn" data-side="sell" data-pct="100">Max</button>

                                </div>

                                <div class="sv-spot-receive-box">

                                    <span>You receive</span>

                                    <strong id="svSpotSellReceive">0 USDT</strong>

                                </div>

                                <p id="svSpotSellMsg" class="sv-spot-order-msg"></p>

                                <button type="button" id="btnSpotSellSubmit" class="sv-spot-submit sv-spot-submit--sell">

                                    <i class="fa-solid fa-arrow-trend-down"></i> Sell UWC+

                                </button>

                            </div>

                        </div>

                    </div>

                </div>



                <div class="sv-panel sv-spot-trades-panel">

                    <div class="sv-panel__head">

                        <h6><i class="fa-solid fa-clock-rotate-left"></i> Recent Trades</h6>

                        <span>Session history</span>

                    </div>

                    <div class="sv-panel__body sv-spot-trades-panel__body">

                        <div class="sv-spot-trades-table">

                            <div class="sv-spot-trades-head">

                                <span>Time</span>

                                <span>Side</span>

                                <span>Price</span>

                                <span>Amount</span>

                                <span>Total USDT</span>

                            </div>

                            <div id="svSpotTradeList" class="sv-spot-trades-list">

                                <div class="sv-spot-trades-empty">

                                    <i class="fa-solid fa-arrows-rotate"></i>

                                    <p>No trades yet</p>

                                    <span>Your buy and sell orders will appear here</span>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>



            <div class="col-xl-4 sv-spot-layout__side-col">

                <div class="sv-spot-side-stack">

                    <div class="sv-panel sv-spot-crypto-panel">

                        <div class="sv-panel__head sv-spot-crypto-panel__head">

                            <h6><i class="fa-solid fa-coins"></i> Top Markets</h6>

                            <div class="sv-spot-crypto-panel__actions">

                                <span class="sv-spot-crypto-panel__badge">Top 10</span>

                                <span id="svSpotCryptoUpdated" class="sv-spot-crypto-panel__live">Live</span>

                            </div>

                        </div>

                        <div class="sv-panel__body sv-spot-crypto-panel__body">

                            <div id="svSpotCryptoList" class="sv-spot-crypto-list" aria-live="polite">

                                <div class="sv-spot-crypto-loading">

                                    <i class="fa-solid fa-spinner fa-spin"></i>

                                    <span>Loading top 10 markets...</span>

                                </div>

                            </div>

                        </div>

                    </div>



                    <div class="sv-panel sv-spot-info-panel">

                        <div class="sv-panel__head">

                            <h6><i class="fa-solid fa-circle-info"></i> Coin Info</h6>

                        </div>

                        <div class="sv-panel__body">

                            <div class="sv-spot-coin-card">

                                <div class="sv-spot-coin-card__badge">U+</div>

                                <div>

                                    <strong>UWC+</strong>

                                    <p>USDT World utility token for ecosystem rewards and spot trading.</p>

                                </div>

                            </div>

                            <ul class="sv-spot-info-list">

                                <li><span>Pair</span><strong>UWC+ / USDT</strong></li>

                                <li><span>Total supply</span><strong>1,000,000,000 UWC+</strong></li>

                                <li><span>Circulating supply</span><strong>750,000,000 UWC+</strong></li>

                                <li><span>Launch price</span><strong>$0.000139</strong></li>

                                <li><span>Current price</span><strong id="svSpotInfoPrice">$0.00040</strong></li>

                                <li><span>24h volume</span><strong id="svSpotInfoVolume">—</strong></li>

                                <li><span>Interval</span><strong id="svSpotInfoInterval">15 minutes</strong></li>

                                <li><span>Order type</span><strong>Market</strong></li>

                            </ul>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">

    <script src="https://unpkg.com/lightweight-charts@3.8.0/dist/lightweight-charts.standalone.production.js"></script>

    <script src="js/spot-trading.js?v=8"></script>

</asp:Content>

