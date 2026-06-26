<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="user_Dashboard" %>







<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	<style>
body {
  background: #0b0f19;
}

.crypto-box {
  background: #1a2236;
  border-radius: 20px;
  padding: 20px;
  color: #fff;
}

.crypto-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 10px 0;
  border-bottom: 1px solid rgba(255,255,255,0.05);
}

.crypto-left {
  display: flex;
  align-items: center;
  gap: 10px;
}

.crypto-left img {
  width: 28px;
  height: 28px;
}

.crypto-name {
  font-weight: 600;
}

.crypto-symbol {
  font-size: 12px;
  color: #aaa;
}

.price {
  font-weight: 600;
}

.green {
  color: #00ffa6;
}

.red {
  color: #ff4d4d;
}
</style>

	 <style>
.scroll-box {
  background: #121826;
  border-radius: 10px;
  padding: 10px 0;
  overflow: hidden;
  white-space: nowrap;
  position: relative;
}

.scroll-text {
  display: inline-block;
  padding-left: 100%;
  animation: scrollText 25s linear infinite;
  color: #00ffd5;
  font-weight: 500;
}

@keyframes scrollText {
  0% {
    transform: translateX(0%);
  }
  100% {
    transform: translateX(-100%);
  }
}
</style>
 
<style>
  
    .chart-box {
      background: #121826;
      border-radius: 12px;
      padding: 10px;
      box-shadow: 0 0 15px rgba(0,0,0,0.5);
    }
  </style>

    <meta property="og:title" content="Affiliate Link" />

    <meta property="og:url" content="http://arsenpay.in/user/Dashboard.aspx" />

    <style>
        .img-thumbnail {
            padding: 0;
        }

        .danger-table > tbody > tr > th {
            background: #f5d7d4;
            border: 1px solid #f5d7d4;
        }

        .danger-table > tbody > tr > td {
            border: 1px solid #e6e3e3;
        }

        .sucess-table > tbody > tr > th {
            background: #bce9bb;
            border: 1px solid #bce9bb;
        }

        .sucess-table > tbody > tr > td {
            border: 1px solid #e6e3e3;
        }

        .warning-table > tbody > tr > th {
            background: #f8ffbb;
            border: 1px solid #f8ffbb;
        }

        .warning-table > tbody > tr > td {
            border: 1px solid #e6e3e3;
        }
    </style>




    <script type="text/javascript">
        function theFunction(liElem, aElem) {

            document.getElementById("limobile").className = "";
            $('#tab1').removeClass('active');
            document.getElementById("lidth").className = "";
            $('#tab2').removeClass('active');
            document.getElementById("lilandline").className = "";
            $('#tab3').removeClass('active');
            document.getElementById("lielectricity").className = "";
            $('#tab4').removeClass('active');
            // document.getElementById("liSettings").className = "";
            // $('#settings').removeClass('active');
            document.getElementById("ligas").className = "";
            $('#tab5').removeClass('active');
            // alert(liElem);
            document.getElementById(liElem).className = "active";
            document.getElementById(aElem).className += " active";
        }




    </script>


    <style type="text/css">
        .nav-tabs {
            border-bottom: 2px solid #456f28;
            background: #456f28;
        }

            .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
                border-width: 0;
            }

            .nav-tabs > li > a {
                border: none;
                color: #ffffff;
                background: #456f28;
                padding: 10px 20px;
            }

                .nav-tabs > li.active > a, .nav-tabs > li > a:hover {
                    border: none;
                    color: #5a4080 !important;
                    background: #fff;
                }

                .nav-tabs > li > a::after {
                    content: "";
                    background: #5a4080;
                    height: 2px;
                    position: absolute;
                    width: 100%;
                    left: 0px;
                    bottom: -1px;
                    transition: all 250ms ease 0s;
                    transform: scale(0);
                }

            .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after {
                transform: scale(1);
            }

        .tab-nav > li > a::after {
            background: #5a4080 none repeat scroll 0% 0%;
            color: #fff;
        }

        .tab-pane {
            padding: 15px 0;
        }

        .tab-content {
            padding: 20px;
        }

        .nav-tabs > li {
            width: auto;
            text-align: center;
        }



        .form-horizontal .form-control {
            height: 44px;
        }

        @media all and (max-width:724px) {
            .nav-tabs > li > a > span {
                display: none;
            }

            .nav-tabs > li > a {
                padding: 5px 5px;
            }
        }

        .input-group {
            margin-bottom: 30px;
        }

        .list-inline > li {
            display: inline-block;
            width: 47%;
            padding: 6px 30px;
        }

        .dashboardbox {
            border: 1px solid #b9d4ec;
            border-bottom: none;
            padding: 17px 0;
            background-color: #f2f2f2;
            background-image: -webkit-gradient(linear, left top, left bottom, from(white), to(#f2f2f2));
            background-image: -webkit-linear-gradient(top, white, #f2f2f2);
            background-image: -moz-linear-gradient(top, white, #f2f2f2);
            background-image: -ms-linear-gradient(top, white, #f2f2f2);
            background-image: -o-linear-gradient(top, white, #f2f2f2);
            background-image: linear-gradient(top, white, #f2f2f2);
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            display: block;
            text-align: center;
            cursor: pointer;
            -webkit-transition: all 0.3s ease;
            -moz-transition: all 0.3s ease;
            -ms-transition: all 0.3s ease;
            -o-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }


        .footer {
            background: #02337f;
            padding: 15px;
            color: #fffdfd;
            font-weight: bold;
            font-size: 10px;
            border-radius: 20px;
            text-align: center;
        }


        .accordion .card-header:after {
            font-family: 'FontAwesome';
            content: "\f068";
            float: right;
        }

        .accordion .card-header.collapsed:after {
            /* symbol for "collapsed" panels */
            content: "\f067";
        }
    </style>


    <!--(Ends)-->
    <link href="../dist/css/user-profile.css" rel="stylesheet" />
    <link href="css/dashboard-page.css" rel="stylesheet" />
    <link href="assets/plugins/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="sv-dashboard-page">

    <div class="sv-dash-header">
        <div class="sv-dash-header__glow sv-dash-header__glow--1"></div>
        <div class="sv-dash-header__glow sv-dash-header__glow--2"></div>
        <div class="sv-dash-header__grid"></div>

        <div class="sv-dash-header__main">
            <div class="sv-dash-header__icon">
                <i class="fa-solid fa-chart-pie"></i>
            </div>
            <div class="sv-dash-header__text">
                <span class="sv-dash-header__eyebrow">
                    <span class="sv-dash-header__pulse"></span>
                    Live Trading Panel
                </span>
                <h1>Trading Dashboard</h1>
                <p>Live markets, wallets &amp; performance at a glance</p>
                <div class="sv-dash-header__tags">
                    <span><i class="fa-solid fa-bolt"></i> Real-time</span>
                    <span><i class="fa-solid fa-shield-halved"></i> Secure</span>
                    <span><i class="fa-solid fa-wallet"></i> Multi-wallet</span>
                </div>
            </div>
        </div>

        <div class="sv-dash-header__actions">
            <a href="Dashboard.aspx" class="sv-dash-breadcrumb">
                <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                Dashboard
            </a>
            <div class="sv-dash-header__meta">
                <span class="sv-dash-header__meta-label">Member</span>
                <strong><asp:Label ID="lblHeaderUser" runat="server" Text="—" /></strong>
            </div>
        </div>
    </div>

    <div class="sv-flags-marquee" aria-label="Global trading markets">
        <div class="sv-flags-marquee__viewport">
            <div class="sv-flags-marquee__track">
                <div class="sv-flags-marquee__group">
                    <span class="sv-flags-marquee__item" title="United Kingdom"><span class="flag-icon flag-icon-squared flag-icon-gb" role="img" aria-label="United Kingdom"></span></span>
                    <span class="sv-flags-marquee__item" title="Australia"><span class="flag-icon flag-icon-squared flag-icon-au" role="img" aria-label="Australia"></span></span>
                    <span class="sv-flags-marquee__item" title="India"><span class="flag-icon flag-icon-squared flag-icon-in" role="img" aria-label="India"></span></span>
                    <span class="sv-flags-marquee__item" title="Canada"><span class="flag-icon flag-icon-squared flag-icon-ca" role="img" aria-label="Canada"></span></span>
                    <span class="sv-flags-marquee__item" title="Japan"><span class="flag-icon flag-icon-squared flag-icon-jp" role="img" aria-label="Japan"></span></span>
                    <span class="sv-flags-marquee__item" title="Germany"><span class="flag-icon flag-icon-squared flag-icon-de" role="img" aria-label="Germany"></span></span>
                    <span class="sv-flags-marquee__item" title="France"><span class="flag-icon flag-icon-squared flag-icon-fr" role="img" aria-label="France"></span></span>
                    <span class="sv-flags-marquee__item" title="Italy"><span class="flag-icon flag-icon-squared flag-icon-it" role="img" aria-label="Italy"></span></span>
                    <span class="sv-flags-marquee__item" title="Spain"><span class="flag-icon flag-icon-squared flag-icon-es" role="img" aria-label="Spain"></span></span>
                    <span class="sv-flags-marquee__item" title="Brazil"><span class="flag-icon flag-icon-squared flag-icon-br" role="img" aria-label="Brazil"></span></span>
                    <span class="sv-flags-marquee__item" title="Singapore"><span class="flag-icon flag-icon-squared flag-icon-sg" role="img" aria-label="Singapore"></span></span>
                    <span class="sv-flags-marquee__item" title="United States"><span class="flag-icon flag-icon-squared flag-icon-us" role="img" aria-label="United States"></span></span>
                </div>
                <div class="sv-flags-marquee__group" aria-hidden="true">
                    <span class="sv-flags-marquee__item" title="United Kingdom"><span class="flag-icon flag-icon-squared flag-icon-gb"></span></span>
                    <span class="sv-flags-marquee__item" title="Australia"><span class="flag-icon flag-icon-squared flag-icon-au"></span></span>
                    <span class="sv-flags-marquee__item" title="India"><span class="flag-icon flag-icon-squared flag-icon-in"></span></span>
                    <span class="sv-flags-marquee__item" title="Canada"><span class="flag-icon flag-icon-squared flag-icon-ca"></span></span>
                    <span class="sv-flags-marquee__item" title="Japan"><span class="flag-icon flag-icon-squared flag-icon-jp"></span></span>
                    <span class="sv-flags-marquee__item" title="Germany"><span class="flag-icon flag-icon-squared flag-icon-de"></span></span>
                    <span class="sv-flags-marquee__item" title="France"><span class="flag-icon flag-icon-squared flag-icon-fr"></span></span>
                    <span class="sv-flags-marquee__item" title="Italy"><span class="flag-icon flag-icon-squared flag-icon-it"></span></span>
                    <span class="sv-flags-marquee__item" title="Spain"><span class="flag-icon flag-icon-squared flag-icon-es"></span></span>
                    <span class="sv-flags-marquee__item" title="Brazil"><span class="flag-icon flag-icon-squared flag-icon-br"></span></span>
                    <span class="sv-flags-marquee__item" title="Singapore"><span class="flag-icon flag-icon-squared flag-icon-sg"></span></span>
                    <span class="sv-flags-marquee__item" title="United States"><span class="flag-icon flag-icon-squared flag-icon-us"></span></span>
                </div>
            </div>
        </div>
    </div>

        
    <div class="row sv-market-row g-3" style="display:none">
        <div class="col-lg-4 col-md-5">
            <div class="sv-panel h-100">
                <div class="sv-panel__head">
                    <h6><i class="fa-solid fa-coins" style="margin-right:8px;color:#c4b5fd;"></i>Live Crypto</h6>
                    <span>Top 5</span>
                </div>
                <div class="sv-panel__body">
                    <div id="crypto-list" class="crypto-box"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-md-7">
            <div class="sv-panel h-100">
                <div class="sv-panel__head">
                    <h6><i class="fa-solid fa-chart-line" style="margin-right:8px;color:#67e8f9;"></i>Market Chart</h6>
                    <span>BTC / USDT</span>
                </div>
                <div class="sv-panel__body p-0">
                    <div class="chart-box">
                        <div class="tradingview-widget-container">
                            <div id="tradingview_chart"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="scroll-box" style="display:none">
        <div class="scroll-text">
            <span class="sv-welcome-label">Welcome,</span>
            <asp:Label ID="lblusername" runat="server" Text="Member"></asp:Label>
            &nbsp;&bull;&nbsp; Trade ID:
            <asp:Label ID="lbluserid" runat="server" Text="—"></asp:Label>
            &nbsp;&bull;&nbsp; Happy Trading!
        </div>
    </div>

    <section class="sv-plans-section" aria-label="Membership plans">
        <div class="sv-plans-section__head">
            <div>
                <span class="sv-plans-section__eyebrow"><i class="fa-solid fa-layer-group"></i> Packages</span>
                <h2>Investment Plans</h2>
                <p>Explore membership tiers and grow your portfolio</p>
            </div>
            <asp:Label ID="LblCurrentPlanBadge" runat="server" CssClass="sv-plans-section__current" Visible="false" />
        </div>
        <div class="sv-plans-grid">
            <asp:Repeater ID="rptPlans" runat="server" OnItemDataBound="rptPlans_ItemDataBound">
                <ItemTemplate>
                    <article class="sv-plan-card sv-plan-card--accent-<%# Container.ItemIndex % 4 %>">
                        <div class="sv-plan-card__top">
                            <span class="sv-plan-card__shield"><i class="fa-solid fa-shield-halved"></i></span>
                            <h3 class="sv-plan-card__name"><%# Eval("PlanName") %></h3>
                        </div>
                        <div class="sv-plan-card__main">
                            <div class="sv-plan-card__pricing">
                                <span class="sv-plan-card__price">$<%# Eval("Planamount") %></span>
                                <span class="sv-plan-card__badge">Members Only</span>
                            </div>
                            <div class="sv-plan-card__logo-wrap">
                                <img src="img/usdt.png" alt="UWC" class="sv-plan-card__logo" />
                            </div>
                        </div>
                        <div class="sv-plan-card__footer">
                            <div class="sv-plan-card__metric" style="display:none">
                                <asp:Literal ID="litMetric" runat="server" />
                            </div>
                            <asp:HyperLink ID="lnkAction" runat="server" />
                        </div>
                    </article>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <asp:Panel ID="pnlNoPlans" runat="server" Visible="false" CssClass="sv-plans-empty">
            <i class="fa-solid fa-box-open"></i>
            <p>No plans available at the moment.</p>
        </asp:Panel>
    </section>


    <div class="card mt-24 sv-wallet-section">
                <div class="card-header">
                    <div class="d-flex align-items-center flex-wrap gap-2 justify-content-between">
                        <div>
                            <h6 class="mb-1 fw-bold text-lg mb-0">My Wallet</h6>
                            <p class="sv-wallet-section__sub mb-0">Track your nonworking, working &amp; topup balances</p>
                        </div>
                        <span class="sv-wallet-section__badge"><i class="fa-solid fa-wallet"></i> 3 Wallets</span>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row gy-4 sv-wallet-grid">

                        <div class="col-xxl-4 col-sm-4">
                            <div class="sv-wallet-card sv-wallet-card--nonworking">
                                <div class="sv-wallet-card__glow"></div>
                                <div class="sv-wallet-card__top">
                                    <span class="sv-wallet-card__icon">
                                        <iconify-icon icon="mdi:wallet-outline" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-wallet-card__chip">Earning</span>
                                </div>
                                <p class="sv-wallet-card__label">Earning Wallet</p>
                                <div class="sv-wallet-card__amount">
                                    <asp:Label ID="Lblnonworking" CssClass="heading sv-wallet-card__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-wallet-card__currency">USD</span>
                                </div>
                                <p class="sv-wallet-card__hint">Reserved / inactive balance</p>
                            </div>
                        </div>

                        <div class="col-xxl-4 col-sm-4">
                            <div class="sv-wallet-card sv-wallet-card--working">
                                <div class="sv-wallet-card__glow"></div>
                                <div class="sv-wallet-card__top">
                                    <span class="sv-wallet-card__icon">
                                        <iconify-icon icon="mdi:wallet" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-wallet-card__chip">Topup</span>
                                </div>
                                <p class="sv-wallet-card__label">Topup Wallet</p>
                                <div class="sv-wallet-card__amount">
                                    <asp:Label ID="Lblworking" CssClass="heading sv-wallet-card__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-wallet-card__currency">USD</span>
                                </div>
                                <p class="sv-wallet-card__hint">Available for Topup</p>
                            </div>
                        </div>

                        <div class="col-xxl-4 col-sm-4">
                            <div class="sv-wallet-card sv-wallet-card--topup">
                                <div class="sv-wallet-card__glow"></div>
                                <div class="sv-wallet-card__top">
                                    <span class="sv-wallet-card__icon">
                                        <iconify-icon icon="mdi:cash-plus" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-wallet-card__chip">Upgrade</span>
                                </div>
                                <p class="sv-wallet-card__label">Upgrade Wallet</p>
                                <div class="sv-wallet-card__amount">
                                    <asp:Label ID="Lbltoupup" CssClass="heading sv-wallet-card__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-wallet-card__currency">USD</span>
                                </div>
                                <p class="sv-wallet-card__hint">Upgrade &amp; activation </p>
                            </div>
                        </div>
                        
           
                      

                        <div class="col-xxl-6 col-sm-6" style="display:none">
                            <div class="card p-3 shadow-none radius-8 border h-100 purple-light-end-3">
                                <div class="card-body p-0" data-bs-toggle="modal" data-bs-target="#modal-month">
                                    <div class="d-flex flex-wrap align-items-center justify-content-between gap-1 mb-8">

                                        <div class="d-flex align-items-center gap-2">
                                            <span class="mb-0 w-48-px h-48-px bg-purple text-white flex-shrink-0 d-flex justify-content-center align-items-center rounded-circle h6">
                                                <iconify-icon icon="mingcute:user-follow-fill" class="icon"></iconify-icon>
                                            </span>
                                            <div>
                                                <span class="mb-2 fw-medium text-secondary-light text-sm">Bonanza</span>
                                                <h6 class="fw-semibold">
                                                    <asp:Label ID="Label14" CssClass="heading" runat="server" Text="0"></asp:Label></h6>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-xxl-6 col-sm-6" style="display:none">
                            <div class="card p-3 shadow-none radius-8 border h-100 purple-light-end-2">
                                <div class="card-body p-0" data-bs-toggle="modal" data-bs-target="#modal-total">
                                    <div class="d-flex flex-wrap align-items-center justify-content-between gap-1 mb-8">

                                        <div class="d-flex align-items-center gap-2">
                                            <span class="mb-0 w-48-px h-48-px bg-success-main flex-shrink-0 text-white d-flex justify-content-center align-items-center rounded-circle h6">
                                                <iconify-icon icon="mingcute:user-follow-fill" class="icon"></iconify-icon>
                                            </span>
                                            <div>
                                                <span class="mb-2 fw-medium text-secondary-light text-sm">Total Income</span>
                                                <h6 class="fw-semibold">
                                                    <asp:Label ID="Label15" CssClass="heading" runat="server" Text="0"></asp:Label></h6>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


<section class="content-header">

      
		<div class="container mt-12">
  <div class="row">
    
    <!-- Chart Column (6 width) -->
   

  </div>
</div>

        <div class="ibox-title pull-left">

            <div style="display: none">
                <h5>Other Income Wallet:
                <asp:Label ID="lblwalletbalance123" runat="server" Text="Label" CssClass="label-success"></asp:Label>&nbsp;&nbsp;&nbsp;
              PFS Income Wallet:
                <asp:Label ID="lblUtilityBalance" runat="server" Text="Label" CssClass="label-success"></asp:Label></h5>
                <asp:TextBox ID="txtflag" Style="display: none" runat="server"></asp:TextBox>
                <span id="LblNo" runat="server"></span>
            </div>
        </div>
    </section>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="sv-dashboard-page">
    <div class="row gy-8">
        <div class="col-lg-12">
            <div class="">
                <div class="pt-24 ms-16 mb-24 me-16">

                 
                  
                          
 
                         <ul>
                        <li class="d-flex align-items-center gap-1 mb-12">
                       
                           
                            <span class="w-70 text-secondary-light fw-medium" style="display:none">Mobile 
            <asp:Label ID="lblmobile" runat="server" Text=""></asp:Label></span>
                        </li>
                        <li class="d-flex align-items-center gap-1 mb-12" style="display:none">
                            <span class="w-30 text-md fw-semibold text-primary-light" style="display:none">Rank</span>
                            <span class="w-70 text-secondary-light fw-medium" style="display:none">:
            <asp:Label ID="lblrank" runat="server" Text="" style="display:none"></asp:Label></span>
                        </li>

                    </ul>
                </div>
            </div>
	</div>
	
	<div  class="row" style="display:none">
        <div class="col-12 d-none">
            <div class="card h-100">
                <div class="card-body p-24">
                    <div class="d-flex align-items-center flex-wrap gap-2 justify-content-between">
                        <h6 class="mb-2 fw-bold text-lg">
                            <marquee direction="left" onmouseover="stop();" onmouseout="start();">
                                <asp:Literal ID="ltnews" runat="server"></asp:Literal></marquee>
                        </h6>

                    </div>

                    <div class="mt-32">
                        <asp:Panel ID="pnlnotification" runat="server">

                            <div class="alert alert-danger">
                                <strong>Error!</strong> Please Update your bank details  <a href="UserEdit.aspx">click here</a> to update. 
                            </div>

                        </asp:Panel>
                    </div>

                </div>
            </div>
        </div>
	</div>
	
	<div  class="row" style="display:none">
        <div class="col-xxl-6">
            <div class="row gy-0">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="d-flex justify-content-between mt-3 mb-3" style="display:none">
                                <div class="card-rank" style="display:none">
                                    <h3 class="mb-0">Rank</h3>

                                </div>
                                <div class="card-rank text-end" style="display:none">
                                    <h3 class="mb-0" style="display:none">
                                        <span class="text-muted me-1">
                                            <asp:Label ID="lblrank1" runat="server" Text="0.00"></asp:Label>
                                        </span>
                                        <asp:Label ID="lblrankreward" runat="server" Text="0.00" Visible="false"></asp:Label>
                                    </h3>
                                </div>
                            </div>

                         
                            <div class="d-flex justify-content-between mt-3 mb-3" style="display:none">
                                <div class="card-rank" style="display:none">
                                    <h3 class="mb-0">Category</h3>

                                </div>
                                <div class="card-rank text-end" style="display:none">
                                    <h3 class="mb-0" style="display:none">
                                        <asp:Label ID="lblrank2" runat="server" Text="Category Name"></asp:Label>
                                    </h3>
                                </div>
                            </div>
						</div>	</div>
						  </div>
						</div>
						  </div>
						</div>
	

                       <div class="row g-3 align-items-stretch">

                               <div class="col-lg-6">
            <div class="sv-ref-card">
                <div class="sv-ref-card__glow" aria-hidden="true"></div>

                <div id="dvlink" runat="server" visible="True">
                    <div class="sv-ref-card__head">
                        <span class="sv-ref-card__icon">
                            <iconify-icon icon="solar:link-round-bold" class="icon"></iconify-icon>
                        </span>
                        <div class="sv-ref-card__titles">
                            <asp:Label ID="Label1" runat="server" Text="Reference Link" CssClass="sv-ref-card__title"></asp:Label>
                            <p class="sv-ref-card__sub">Share your link and invite new members to your team</p>
                        </div>
                        <span class="sv-ref-card__badge"><i class="fa-solid fa-user-plus"></i> Invite</span>
                    </div>

                    <div class="sv-ref-card__body">
                        <div class="sv-ref-card__input-wrap">
                            <span class="sv-ref-card__input-icon"><i class="fa-solid fa-link"></i></span>
                            <asp:TextBox ID="TxtLeftLinkLink" runat="server" CssClass="sv-ref-card__input form-control" ReadOnly="true" />
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Copy Link" CssClass="sv-ref-card__copy" OnClientClick="return CopyToClipboard();" />
                    </div>

                    <p class="sv-ref-card__hint">
                        <i class="fa-solid fa-circle-info"></i>
                        Copy and share via WhatsApp, Telegram, or social media
                    </p>
                </div>

                <div style="display:none">
                    <asp:Label class="form-label" ID="Label2" runat="server" Text="Affiliate Link (RIGHT)"></asp:Label>
                    <div class="input-group mb-0">
                        <asp:TextBox ID="TxtRightLink" runat="server" CssClass="form-control" />
                        <asp:Button ID="Button2" runat="server" Text="Copy" CssClass="btn btn-primary" OnClientClick="return CopyToClipboard2();" />
                    </div>
                </div>
            </div>
        </div>
                           <div class="col-lg-6">
                               <div class="sv-invest-card">
                                   <div class="sv-invest-card__glow" aria-hidden="true"></div>
                                   <div class="sv-invest-card__head">
                                       <span class="sv-invest-card__icon">
                                           <iconify-icon icon="mdi:chart-areaspline" class="icon"></iconify-icon>
                                       </span>
                                       <div class="sv-invest-card__titles">
                                           <span class="sv-invest-card__label">Investment Amount</span>
                                           <p class="sv-invest-card__sub">Your active package value</p>
                                       </div>
                                       <a href="javascript:void(0)" class="sv-invest-card__status">
                                           <i class="fa-solid fa-circle-check"></i>
                                           <asp:Label ID="lblstatus" runat="server" Text="Active"></asp:Label>
                                       </a>
                                   </div>
                                   <div class="sv-invest-card__amount-row">
                                       <asp:Label ID="lblinvamount" CssClass="heading sv-invest-card__value" runat="server" Text="0"></asp:Label>
                                       <span class="sv-invest-card__currency">USD</span>
                                   </div>
                                   <p class="sv-invest-card__date">
                                       <i class="fa-solid fa-calendar-check"></i>
                                       Activated: <asp:Label ID="Lblactivatedate2" runat="server" Text="—"></asp:Label>
                                   </p>
                               </div>
                           </div>

                            <div class="col-md-5 radius-8 border h-100 purple-light-end-1 gap-1 mb-8 " style="display:none"> 

                                          <div class="d-flex justify-content-between align-items-center mt-3 mb-3">

                                <div class="card-rank">
                                    <h3 class="mb-0">110 $</h3>

                                           <small>
                                        <asp:Label ID="Lblactivatedate3" runat="server" Text="01/07/2024"></asp:Label></small>
                              
                                </div>


                                <a href="javascript:void(0)" class="btn btn-success btn-sm">
                                    <asp:Label ID="lbl110" runat="server" Text="Label"></asp:Label></a>
                            </div>
                                </div>
                           <div class="col-md-6 radius-8 border h-100 purple-light-end-1 gap-1 mb-10" style="display:none">   <div class="d-flex justify-content-between align-items-center mt-3 mb-3">

                                <div class="card-rank">
                                    <h3 class="mb-0">550 $</h3>

                                           <small>
                                        <asp:Label ID="Lblactivatedate4" runat="server" Text="01/07/2024"></asp:Label></small>
                              
                                </div>


                                <a href="javascript:void(0)" class="btn btn-success btn-sm">
                                    <asp:Label ID="lbl550" runat="server" Text="Label"></asp:Label></a>
                            </div></div>

                                            <div class="col-md-5 radius-8 border h-100 purple-light-end-1 gap-1 mb-8" style="display:none">                 <div class="d-flex justify-content-between align-items-center mt-3 mb-3">

                                <div class="card-rank">
                                    <h3 class="mb-0">1100 $</h3>

                                           <small>
                                        <asp:Label ID="Lblactivatedate5" runat="server" Text="01/07/2024"></asp:Label></small>
                              
                                </div>


                                <a href="javascript:void(0)" class="btn btn-success btn-sm">
                                    <asp:Label ID="lbl100" runat="server" Text="Label"></asp:Label></a>
                            </div></div>
                       </div>
                          
                        

                               


                    
                        </div>
                   
              
            <div class="card mt-24 sv-earn-section">
                <div class="card-header">
                    <div class="d-flex align-items-center flex-wrap gap-2 justify-content-between">
                        <div>
                            <h6 class="mb-1 fw-bold text-lg mb-0">Earning Performance</h6>
                            <p class="sv-earn-section__sub mb-0">Track direct, daily, level &amp; total income</p>
                        </div>
                        <span class="sv-earn-section__badge"><i class="fa-solid fa-chart-line"></i> Live Stats</span>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row gy-4 sv-earn-grid">

                            <div class="col-xxl-6 col-sm-6">
                            <div class="sv-earn-stat sv-earn-stat--direct">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:account-cash" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Direct</span>
                                </div>
                                <p class="sv-earn-stat__label">Direct Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lblDirectincome" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>

                         <div class="col-xxl-6 col-sm-6" style="display:none">
                            <div class="sv-earn-stat sv-earn-stat--direct">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:calendar-today" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Today</span>
                                </div>
                                <p class="sv-earn-stat__label">Level  Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lbldailydirect" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>
                            <div class="col-xxl-6 col-sm-6" style="display:none">
                            <div class="sv-earn-stat sv-earn-stat--level" data-bs-toggle="modal" data-bs-target="#modal-today">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:stairs" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Level</span>
                                </div>
                                <p class="sv-earn-stat__label">Level Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lblMatching" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-xxl-6 col-sm-6">
                            <div class="sv-earn-stat sv-earn-stat--daily">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:cash-clock" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Daily</span>
                                </div>
                                <p class="sv-earn-stat__label">Level Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lblroi" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>



                              <div class="col-xxl-6 col-sm-6">
                            <div class="sv-earn-stat sv-earn-stat--level">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:layers-triple" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Nonworking</span>
                                </div>
                                <p class="sv-earn-stat__label">Single Leg Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lblhelp" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>
                        
                           <div class="col-xxl-6 col-sm-6" >
                            <div class="sv-earn-stat sv-earn-stat--reward">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mingcute:user-follow-fill" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Nonworking</span>
                                </div>
                                <p class="sv-earn-stat__label">Non Working Global Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lblreward" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>


                              <div class="col-xxl-6 col-sm-6">
                            <div class="sv-earn-stat sv-earn-stat--total">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:cash-multiple" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Total</span>
                                </div>
                                <p class="sv-earn-stat__label">Total Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lbltotal" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-xxl-6 col-sm-6" style="display:none">
                            <div class="sv-earn-stat sv-earn-stat--bonus" data-bs-toggle="modal" data-bs-target="#modal-month">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:gift" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">Bonus</span>
                                </div>
                                <p class="sv-earn-stat__label">Bonanza</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lblCurrentMonth" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-xxl-6 col-sm-6" style="display:none">
                            <div class="sv-earn-stat sv-earn-stat--total" data-bs-toggle="modal" data-bs-target="#modal-total">
                                <div class="sv-earn-stat__glow"></div>
                                <div class="sv-earn-stat__top">
                                    <span class="sv-earn-stat__icon">
                                        <iconify-icon icon="mdi:chart-timeline-variant" class="icon"></iconify-icon>
                                    </span>
                                    <span class="sv-earn-stat__chip">All Time</span>
                                </div>
                                <p class="sv-earn-stat__label">Total Income</p>
                                <div class="sv-earn-stat__amount">
                                    <asp:Label ID="lbltotalincome" CssClass="heading sv-earn-stat__value" runat="server" Text="0"></asp:Label>
                                    <span class="sv-earn-stat__currency">USD</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
       
   
       
            
        <div class="col-xxl-6" style="display:none">

            <div class="card radius-12">
                <div class="card-body p-16">
                    <div class="row gy-4">
                        <div class="col-xxl-12">
                            <div class="px-20 py-16 shadow-none radius-8 h-100 bg-info-focus left-line line-bg-primary position-relative overflow-hidden">
                                <div class="d-flex flex-wrap align-items-center justify-content-between gap-1 mb-8">
                                    <div>
                                        <span class="mb-2 fw-medium text-secondary-light text-md">Total Direct</span>
                                        <h6 class="fw-semibold mb-1">
                                            <asp:Label ID="LblDirect" runat="server" Text="Label"></asp:Label></h6>
                                    </div>
                                    <span class="w-44-px h-44-px radius-8 d-inline-flex justify-content-center align-items-center text-2xl mb-12 bg-primary-100 text-primary-600">
                                        <i class="ri-group-3-fill"></i>
                                    </span>
                                </div>

                            </div>
                        </div>
                        <div class="col-xxl-12" >
                            <div class="px-20 py-16 shadow-none radius-8 h-100 bg-purple-light left-line line-bg-lilac position-relative overflow-hidden">
                                <div class="d-flex flex-wrap align-items-center justify-content-between gap-1 mb-8">
                                    <div>
                                        <span class="mb-2 fw-medium text-secondary-light text-md">Active Direct</span>
                                        <h6 class="fw-semibold mb-1">
                                            <asp:Label ID="LblActiveDirect" runat="server" Text="Label"></asp:Label></h6>
                                    </div>
                                    <span class="w-44-px h-44-px radius-8 d-inline-flex justify-content-center align-items-center text-2xl mb-12 bg-lilac-200 text-lilac-600">
                                        <i class="ri-group-3-fill"></i>
                                    </span>
                                </div>

                            </div>
                        </div>
                        <div class="col-xxl-12">
                            <div class="px-20 py-16 shadow-none radius-8 h-100 bg-success-100 left-line line-bg-success position-relative overflow-hidden">
                                <div class="d-flex flex-wrap align-items-center justify-content-between gap-1 mb-8">
                                    <div>
                                        <span class="mb-2 fw-medium text-secondary-light text-md">Single Leg  Team</span>

                                           <h6 class="fw-semibold mb-1">
                                            <asp:Label ID="Lblsingleleg" runat="server" Text="Label"></asp:Label></h6>
                                        <h6 class="fw-semibold mb-1" style="display:none" >
                                            <asp:Label ID="LblTotalLeft" runat="server" Text="Label"></asp:Label></h6>
                                    </div>
                                    <span class="w-44-px h-44-px radius-8 d-inline-flex justify-content-center align-items-center text-2xl mb-12 bg-success-200 text-success-600">
                                        <i class="ri-group-3-fill"></i>
                                    </span>
                                </div>

                                <div class="d-flex justify-content-between" style="display:none">
                                    <p class="text-sm mb-0" style="display:none">
                                        <span class="bg-success-focus px-1 rounded-2 fw-medium text-success-main text-sm">
                                            <i class="ri-arrow-up-line"></i>
                                            <asp:Label ID="Lblactiveleft" runat="server" Text="Label"></asp:Label></span> Active
                                    </p>

                                    <p class="text-sm mb-0" style="display:none">
                                        <span class="bg-danger-focus px-1 rounded-2 fw-medium text-danger-main text-sm">
                                            <i class="ri-arrow-down-line"></i>
                                            <asp:Label ID="LblInactiveleft" runat="server" Text="Label"></asp:Label></span> Inactive
                                    </p>
                                </div>

                            </div>
                        </div>
                        <div class="col-xxl-12"  style="display:none">
                            <div class="px-20 py-16 shadow-none radius-8 h-100 bg-yellow-light left-line line-bg-warning position-relative overflow-hidden">
                                <div class="d-flex flex-wrap align-items-center justify-content-between gap-1 mb-8">
                                    <div>
                                        <span class="mb-2 fw-medium text-secondary-light text-md">Total Right Team</span>
                                        <h6 class="fw-semibold mb-1">
                                            <asp:Label ID="LblTotalright" runat="server" Text="Label"></asp:Label></h6>
                                    </div>
                                    <span class="w-44-px h-44-px radius-8 d-inline-flex justify-content-center align-items-center text-2xl mb-12 bg-warning-focus text-warning-600">
                                        <i class="ri-group-3-fill"></i>
                                    </span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p class="text-sm mb-0">
                                        <span class="bg-success-focus px-1 rounded-2 fw-medium text-success-main text-sm">
                                            <i class="ri-arrow-up-line"></i>
                                            <asp:Label ID="LblActiveRight" runat="server" Text="Label"></asp:Label></span> Active
                                    </p>

                                    <p class="text-sm mb-0">
                                        <span class="bg-danger-focus px-1 rounded-2 fw-medium text-danger-main text-sm">
                                            <i class="ri-arrow-down-line"></i>
                                            <asp:Label ID="LblInActiveRight" runat="server" Text="Label"></asp:Label></span> Inactive
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>

        <div class="col-xxl-12 d-none">
            <div class="card h-100">

                <div class="card-body p-24">
                    <div class="table-responsive scroll-sm">
                        <asp:GridView ID="GrdPerformance" runat="server" CssClass="table table-hover table-bordered dataTable"
                            Width="100%" AutoGenerateColumns="False" Visible="false">
                            <Columns>
                                <asp:TemplateField HeaderText="Performance">
                                    <ItemTemplate>

                                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("active") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Deactive">
                                    <ItemTemplate>
                                        <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("deactive") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("Total") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>


                            </Columns>
                        </asp:GridView>
                    </div>



                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left top, #47a0419e, #47a041ad)">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-black icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left font-weight-semibold text-black">Self-Purchase Bonus</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-black">
                                    <asp:Label ID="lblselfincome" runat="server" Text="Label"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"><a href="#">More Info</a></i>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display:none">
            <div class="card" style="background: linear-gradient(to left top, #47a0419e, #47a041ad)">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-black icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left font-weight-semibold text-black">Developer Bonus</p>
                            <br>
                            <div class="" >
                                <h3 class="font-weight-semibold text-left mb-0 text-white"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblDirectisncome" runat="server" Text="00.00" Visible="false"></asp:Label></h3>
                            </div>
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-black"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblMatching11" runat="server" Text="00.00" Visible="false"></asp:Label>
                                    <asp:Label ID="lblMatchinggsg" runat="server" Text="00.00"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="Dailypayoutdetail.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left top, #47a0419e, #47a041ad)">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-black icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left font-weight-semibold text-black">Team Development Income</p>
                            <br>
                            <div class="">

                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-white"
                                    style="display: none"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblDIrectorIncomeaa" runat="server" Text="Label"></asp:Label>

                                </h3>
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-black"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblMatchingss" runat="server" Text="Label"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="dailypayoutdetail.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Travel Fund Bonus</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-white"
                                    style="display: none"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lbldailyincome" runat="server" Text="0.00"></asp:Label>

                                </h3>
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-white"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblDIrectorIncome" runat="server" Text="0.00"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="BonusIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-inr text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Elite Bonus</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white"><i class="fa fa-inr"></i>&nbsp
                                                    <asp:Label ID="lblgoldirector" runat="server" Text="0"></asp:Label>
                                </h3>



                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="BonusIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-inr text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Director Bonus</p>
                            <br />
                            <div class="">
                                <asp:Label ID="lblleadership" runat="server" Text="0.00"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="BonusIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Ruby Director Bonus</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblCurrentWallet" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i><a href="TransactionReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(to left bottom, #addf9a, #bccbc8);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Crown Director Bonus</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-success">
                                    <asp:Label ID="Label6" runat="server" Text="0.00"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #FFA500 60%,#FFC55C 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">House Fund</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold tex
                                                t-left mb-0 text-success">
                                    <asp:Label ID="Label7" runat="server" Text="0.00"></asp:Label>

                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Rank</p>
                            <br>
                            <div class="">
                                <h2 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="sdsdff" runat="server" Text="Label"></asp:Label></h2>
                                </h2>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>








    </div>
    
    <div class="row">
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #000075 60%,#0000D1 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-indian-rupee-sign text-white icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Consistency Bonus</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblCredited" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i>More Info
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #964B00 60%,#C46200 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Program Bonus</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblDebited" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>More Info
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg, #FF4B2B 60%, #FF416C 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-indian-rupee-sign text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Car Fund</p>
                            <br>
                            <div class="">

                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblREpurchaseIncome" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>




        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-users text-white icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">AutoPool Team</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblPooldownline" runat="server" Text="0"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="PoolBinaryReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Current Package</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblCurrentpackage" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <br />
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Today Performance Pair</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lblPerformance" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br />
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="Dailypayoutdetail.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Total Team</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblDownline" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="DownlineReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Total Active Team</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblActiveDownline" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="DownlineReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>




    </div>


    <div class="row">


        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Left SV (Bonanza 26 Sept) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblleftBonanzasv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV (Bonanza 26-Spet) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblRightBonanzasv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">LEFT SV </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblRleftbv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
								  <asp:Label ID="lblcurrentleftbv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>


        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>

                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="LblRrightbv" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Right SV
								  <asp:Label ID="lblcurrrentightbv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>




        <div class="col-sm-12 col-lg-6 col-xl-4 " style="display: none">
            <div class="card mb-0 gradient-10 gradient-10-shadow border1px-white card-summary gradient-10-hover">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-bubbles"></i>
                        </div>
                        <div class="text-right">
                            <h2 class="card-summary__price">
                                <asp:Label ID="Lblleftbv" runat="server" Text="Label"></asp:Label></h2>
                            <p class="card-summary__title">Total Left SV </p>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i>Carry PV
								<asp:Label ID="Lblleftcarrypv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>


            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Total Income</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lblTotalssincome" runat="server" Text="Label"></asp:Label>
                                    <i class="fa fa-inr"></i></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="UserDirectAssociates.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-users text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Left Directs</p>
                            <br>
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblLeftDirect" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-users text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right Directs</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LblRightDirect" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-secondary" aria-hidden="true"></i><a href="#">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-wallet text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Cash Wallet</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="Totalbalance" runat="server" Text="Label"></asp:Label>
                                    <i class="fa fa-inr"></i></h4>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <br />
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Cash Back Income</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LbllevelROiIncome" runat="server" Text="0"></asp:Label>
                                    <i class="fa fa-inr"></i></h4>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="levelincomereport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">LEFT SV (First Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblleftjoiningsv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
                                    
								  <asp:Label ID="lblleftjoiningcarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV (First Purchase) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblrightjoiningsv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
								  <asp:Label ID="lblrightjoiningcarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>


        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>

                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Self SV (First Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lbltotalselfjoiningsv" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>

    </div>


    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">LEFT SV (Re-Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblleftrepurchasesv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
                                    
								  <asp:Label ID="lblleftrepurchasecarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>



        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Right SV (Re-Purchase) </p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lblRightrepurchasesv" runat="server" Text="Label"></asp:Label></h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <i class="mdi mdi-arrow-down-drop-circle mr-1 text-danger" aria-hidden="true"></i>Current Left SV
								  <asp:Label ID="lblRightrepurchasecarrysv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>




        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none;">
            <div class="card" style="background: linear-gradient(110deg,#075264 60%,#9F92FF 60%);">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-certificate text-white"></i>

                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Self SV (Re-Purchase)</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-white">
                                    <asp:Label ID="lbltotalselfRepurchasesv" runat="server" Text="Label"></asp:Label>
                                </h4>
                            </div>
                        </div>
                    </div>

                    <hr class="hr-white">
                    <p class="mb-0 text-white">
                        <br />
                    </p>
                </div>
            </div>
        </div>

    </div>



    <div class="row">




        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price">
                                <asp:Label ID="Lblrightbv" runat="server" Text="Label"></asp:Label>
                            </h2>
                            <p class="card-summary__title">RIGHT PV </p>
                        </div>
                    </div>

                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i>Left Carry PV
								<asp:Label ID="Lblrightcarrypv" runat="server" Text="Label"></asp:Label>
                    </p>
                </div>
            </div>
        </div>






    </div>

    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price">
                                <asp:Label ID="LblRetailProfit" runat="server" Text="Label"></asp:Label>
                            </h2>
                            <p class="card-summary__title">Self BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>






    </div>

    <div class="row" style="display: none">
        <div class="col-sm-12 col-lg-6 col-xl-4">
            <div class="card mb-0 gradient-10 gradient-10-shadow border1px-white card-summary gradient-10-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-bubbles"></i>
                        </div>
                        <div class="text-right">
                            <h2 class="card-summary__price"></h2>
                            <p class="card-summary__title">CURRENT LEFT BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price"></h2>
                            <p class="card-summary__title">CURRENT RIGHT BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4">
            <div class="card mb-0 gradient-2 gradient-2-shadow border1px-white card-summary gradient-2-hover">
                <div class="card-body" style="background: linear-gradient(110deg,#A36A00 60%,#D18700 60%);">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="card-summary__icon">
                            <i class="icon-cloud-download"></i>
                        </div>
                        <div class="text-right">

                            <h2 class="card-summary__price">
                                <asp:Label ID="lblcurrentselfbv" runat="server" Text="Label"></asp:Label>
                            </h2>
                            <p class="card-summary__title">CURRENT Self BV </p>
                        </div>
                    </div>
                    <hr class="hr-white">
                </div>
            </div>
        </div>






    </div>


    <div class="row">

        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Autopool Income</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success"><i class="fa fa-inr"></i>
                                    <asp:Label ID="LblPoolIncome" runat="server" Text="Label"></asp:Label>
                                </h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="AutoPoolIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa fa-inr text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Level Income</p>
                            <br />
                            <div class="">
                                <h4 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lbl878" runat="server" Text="0"></asp:Label>
                                    <i class="fa fa-inr"></i></h4>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-white" aria-hidden="true"></i><a href="LevelIncomeReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">

                            <i class="fa fa-inr text-secondary icon-size" style="color: green"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Group Income</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="LBlGroupIncome" runat="server" Text="Label"></asp:Label>
                                    <i class="fa fa-inr"></i></h3>
                            </div>
                        </div>
                    </div>
                    <br />
                    <p class="text-muted mb-0">
                        <i class="mdi mdi-arrow-up-drop-circle mr-1 text-success" aria-hidden="true"></i><a href="LuckyDrawClosingReport.aspx">More Info</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-lg-6 col-xl-4" style="display: none">
            <div class="card">
                <div class="card-body">
                    <div class="clearfix">
                        <div class="float-right">
                            <i class="fa-solid fa-calendar text-secondary icon-size"></i>
                        </div>
                        <div class="float-left">
                            <p class="mb-0 text-left">Payment Date</p>
                            <br />
                            <div class="">
                                <h3 class="font-weight-semibold text-left mb-0 text-success">
                                    <asp:Label ID="lblpaydate" runat="server" Text="Label"></asp:Label></h3>
                            </div>
                        </div>
                    </div>
                    <br>
                    <p class="text-muted mb-0">
                        <br>
                    </p>
                </div>
            </div>
        </div>


    </div>

    <!--  <div class="row">
                        <div class="col-lg-4 col-xs-12" style="display:none;">
                            <div class="small-box bg-aqua" style="height: 130px; background-color: #28e8cf !important;">
                                <div class="col-md-6" style="background-color: #28e8cf !important">
                                    <div class="inner">
                                        <p class="text">Main Wallet</p>
                                        <h3 class="number count-to">
                                           </h3>
                                    </div>
                                </div>
                                <div class="col-md-6" style="background-color: #28e8cf !important">
                                    <div class="inner">
                                        <p class="text">Payout Wallet</p>
                                        <h3 class="number count-to">
                                          </h3>
                                    </div>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-inr"></i>
                                </div>
                            </div>

                        </div>

						
						<div class="col-lg-4 col-xs-12" >
							
							 <div class="small-box bg-primary">
                                <div class="inner">
                                    <p class="text">Status &nbsp;&nbsp;&nbsp;&nbsp;||&nbsp;
Profit Share Budget</p>
                                    <h3 class="number count-to">
                                        </h3>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-inr"></i>
                                </div>
                               
                            </div>
							
						</div>
                          	<div class="col-lg-4 col-xs-12" >
                            <div class="small-box bg-primary" >
                                <div class="inner">
                                    <p class="text">Current Package</p>
                                    <h3 class="number count-to">
                                      
                                              </asp:Label>
                                    </h3>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                              
                            </div>
                        </div>

                             <div class="col-lg-4 col-xs-12" style="display:none" >
                            <div class="small-box bg-primary" >
                                <div class="inner">
                                    <p class="text">Current Group</p>
                                    <h3 class="number count-to">
                                      
                                          <asp:Label ID="LblGroup" runat="server" Text="Label"></asp:Label>
                                    </h3>
                                </div>
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                              
                            </div>
                        </div>
						   <div class="col-lg-4 col-xs-12" >
                            <div class="small-box bg-primary" >
                                <div class="inner">
                                    <p class="text">Activation Date</p>
                                    <h3 class="number count-to">
                                      
                                           
                                    </h3>
                                </div>
                                <div class="icon">
                                       <i class="fa fa-calendar"></i>
                                </div>
                              
                            </div>
                        </div> -->

    <div class="row">

        <div class="col-lg-4 col-xs-12" style="display: none">
            <div class="small-box bg-primary">
                <div class="inner">
                    <p class="text">Main Wallet</p>
                    <h3 class="number count-to">
                        <asp:Label ID="lblwalletBalance" runat="server" Text="Label"></asp:Label></h3>
                </div>
                <div class="icon">
                    <i class="fa fa-inr"></i>
                </div>
                <a href="UserWallet.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-lg-4 col-xs-12" style="display: none">
            <div class="small-box bg-primary">
                <div class="inner">
                    <p class="text">Payout Wallet</p>
                    <h3 class="number count-to">
                        <asp:Label ID="lblshoppingWallet" runat="server" Text="Label"></asp:Label></h3>
                </div>
                <div class="icon">
                    <i class="fa fa-inr"></i>
                </div>
                <a href="UserWallet.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>

        </div>
    </div>

                       <!--	<div class="row">

                       <div class="col-lg-4 col-xs-12" >	 
						 
                            <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Team</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="DownlineReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
						
						
					</div>

                       <div class="col-lg-4 col-xs-12" >
                            <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Active Team</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="DownlineReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
						
					</div>
				<div class="col-lg-4 col-xs-12" >
					
                            <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Active Direct</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="UserDirectAssociates.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
					</div>
						
					</div>	
				
					 <div class="col-lg-4 col-xs-12" >
				
						
		
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Direct</p>
                                   <h3 class="number count-to">
                                       <asp:Label ID="LblsalaryPoint" runat="server" Text="Label" Visible="false"></asp:Label>
                                       
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="UserDirectAssociates.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
					</div> 


                   <div class="col-lg-4 col-xs-12" >
				
						
		
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Total Income</p>
                                   <h3 class="number count-to">
                                     
                                        
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="UserDirectAssociates.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
					</div> 
					
					
				</div>
				<div class="row">
                        <div class="col-lg-4 col-xs-12">
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">Level ROI Income</p>
                                   <h3 class="number count-to">
                                       <asp:Label ID="Lblsalary" runat="server" Text="0" Visible="false"></asp:Label>
                                          <font style="color:#fff">$</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="GiftBalanceReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
						 
						 <div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">ROI Income</p>
                                 
                                     
								 <h3 class="number count-to">
									 <asp:Label ID="LblBinaryPoint" runat="server" Text="0" Visible="false"></asp:Label>
                                          <font style="color:#fff">$</font>
								</h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="GiftBalanceReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>

                       <div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">Autopool Income</p>
                                   <h3 class="number count-to">
                                      <%-- <asp:Label ID="LblBinaryIncome" runat="server" Text="Label" Visible="false"></asp:Label>--%>
                                        <asp:Label ID="asfr" runat="server" Text="0" Visible="false" ></asp:Label>
                                           <font style="color:#fff">$</font>
                                   </h3>
                                   
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="AutoPoolIncomeReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>

                       <div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary">
                               <div class="inner">
                                   <p class="text">Level Income</p>
                                   <h3 class="number count-to">
                                       <asp:Label ID="LblRechargewallet" runat="server" Text="Label" Visible="false"></asp:Label>
                                        <font style="color:#fff">$</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-inr"></i>
                               </div>
                               <a href="LevelIncomeReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
					<div class="col-lg-4 col-xs-12" style="display:none;" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Level Achieved</p>
                                   <h3 class="number count-to">
                                     
                                        <asp:Label ID="LblLevelNo" runat="server" Text="Label" ></asp:Label>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
					<div class="col-lg-4 col-xs-12" >
<div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Group Income</p>
                                   <h3 class="number count-to">
                                     
                                        <font style="color:#fff">$</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="LuckyDrawClosingReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
						
					</div>
					
					<div class="col-lg-4 col-xs-12" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Payment Date</p>
                                   <h3 class="number count-to">
                                     
                                               
                                   </h3><br>
                               </div>
                               <div class="icon">
                                  <i class="fa fa-calendar"></i>
                               </div>
                             
                           </div>
                       </div>
                     
                       <div class="col-lg-4 col-xs-12" style="display:none" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Group Income (commission)</p>
                                   <h3 class="number count-to">
                                     
                                               <asp:Label ID="lblincome" runat="server" Text="Label"></asp:Label> <font style="color:#fff">%</font>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="LuckyDrawClosingReport.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>
                    
                     

                     

                  

                       <div class="col-lg-4 col-xs-12" style="display:none" >
                           <div class="small-box bg-primary" >
                               <div class="inner">
                                   <p class="text">Boost Profit Share Status</p>
                                   <h3 class="number count-to">
                                     
                                        <asp:Label ID="LblBoostPFS" runat="server" Text="" ></asp:Label>
                                   </h3>
                               </div>
                               <div class="icon">
                                   <i class="fa fa-users"></i>
                               </div>
                               <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                           </div>
                       </div>

				</div> -->

   




                    <div class="col-lg-4 col-xs-12" style="display: none;">
                        <div class="small-box bg-aqua">
                            <div class="inner">
                                <p class="text">Change Password</p>
                                <h3 class="number count-to">
                                    <span id="Span4" style="color: transparent">0.0</span></h3>
                            </div>
                            <div class="icon">
                                <i class="fa fa-key"></i>
                            </div>
                            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>

               

                <div class="col-lg-4 col-xs-12" style="display: none;">
                    <div class="small-box bg-purple">
                        <div class="inner" style="min-height: 104px;">
                            <p class="text">Total Business</p>
                            <h3 class="number count-to" style="font-size: 16px;">
                                <asp:Label ID="labl1323" runat="server" Text="Label"></asp:Label>
                                <span style="color: white;">|</span>
                                <asp:Label ID="lblBVvalue" runat="server" Text="Label"></asp:Label>
                            </h3>
                        </div>
                        <div class="icon">
                            <i class="fa fa-inr"></i>
                        </div>
                        <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>






        <!--Recharge Panel (Starts) pasted from Recharge.aspx-->


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="updateProgress" runat="server">
            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate></ContentTemplate>
        </asp:UpdatePanel>



        <!--Recharge Panel (Ends)-->
        <div class="row" style="display: none">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Quick link
                                    <span id="spanprime" runat="server" visible="false" class="blinking spanprime" style="float: right; font-weight: bold; font-size: 16px;">Become a Prime Member Now&nbsp;<a href="#" id="a_prime" onclick="return primeclick();" style="color: yellow;">click here</a></span>

                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="useradd.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-user fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-success" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">User add </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6" style="display: none">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="Recharge.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-mobile fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-success" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Recharge & Bill </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6" style="display: none">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="rechargereport.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-calendar fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-danger" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Recharge Detail </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6" style="display: none">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="PurchaseItem.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-cart-plus fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-warning" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Purchase Product </div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="WithdrawlRequstAdd.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-inr fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-primary" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Withdrawl Request</div>
                                        </div>
                                    </a>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel-body no-padding dashboardbox">
                                    <a href="DepositRequstAdd.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-inr fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-info" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Deposit Request </div>
                                        </div>
                                    </a>
                                </div>

                            </div>

                            <div class="col-md-6 col-lg-3 col-sm-6">
                                <div class="panel panel-default panel-white">
                                    <a href="UserWallet.aspx" style="text-decoration: none;">
                                        <div class="panel-body no-padding dashboardbox">
                                            <div class="partition-azure padding-20 text-center core-icon">
                                                <i class="fa fa-inr fa-3x icon-big"></i>
                                            </div>
                                            <div class="core-content">
                                            </div>
                                        </div>

                                        <div class="panel-footer clearfix label-primary" style="padding: 5px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px;">
                                            <div class="subtitle" style="text-align: center; color: #fff">Wallet Status </div>
                                        </div>
                                    </a>
                                </div>

                            </div>




                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="row" style="display: none">
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <p class="text">Current PV</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblCurrentPV" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-green">
                    <div class="inner">
                        <p class="text">Used PV</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblUsedPV" runat="server" Text="Label"></asp:Label></h3>

                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-red">
                    <div class="inner">
                        <p class="text">Total PV</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblTotalPV" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>








        </div>


        <div class="row" style="display: none;">
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <p class="text">Current Recharge wallet</p>
                        <h3 class="number count-to">
                            <%-- <asp:Label ID="LblRechargewallet" runat="server" Text="Label"></asp:Label>--%></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <p class="text">Current Utility Wallet</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblUtilityWallet" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>


            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <p class="text">Current Balance</p>
                        <h3 class="number count-to"></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>






            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-lime">
                    <div class="inner">
                        <p class="text">Monthly Business</p>
                        <h3 class="number count-to">
                            <asp:Label ID="Label3" runat="server" Text="0.00"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>







        </div>

        <div class="row" style="display: none;">
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <p class="text">Today's Business</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblTodayBuissness" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-green">
                    <div class="inner">
                        <p class="text">Recharge Wallet Purchase</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblTodayWalletPurchase" runat="server" Text="Label"></asp:Label></h3>

                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <div class="small-box bg-red">
                    <div class="inner">
                        <p class="text">Utility Wallet Purchase</p>
                        <h3 class="number count-to">
                            <asp:Label ID="LblUtilitywalletPurchase" runat="server" Text="Label"></asp:Label></h3>
                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>



            <%--<div class="col-lg-3 col-xs-6">--%>
            <div class="col-lg-3 col-xs-12">
                <!-- small box -->
                <div class="small-box bg-blue">
                    <div class="inner">
                        <p class="text">Today's Commission</p>
                        <h3 class="number count-to">
                            <asp:Label ID="Label4" runat="server" Text="0.00"></asp:Label></h3>

                    </div>
                    <div class="icon">
                        <i class="fa fa-inr"></i>
                    </div>
                    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>



        </div>


        <div class="row" style="display: none;">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Status Report</div>
                    <div class="panel-body">
                        <label>Awards & Rewards Current Qualification Status</label>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>

                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AWARD">
                                        <ItemTemplate>
                                            <asp:Label ID="labawardname" runat="server" Text='<%#Eval("awardname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="START DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("Fromdate1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="END DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("Todate1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET LEFT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetleft" runat="server" Text='<%#Eval("TargetLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET RIGHT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetright" runat="server" Text='<%#Eval("TargetRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentLeftBv" runat="server" Text='<%#Eval("CurrentLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentRightBv" runat="server" Text='<%#Eval("CurrentRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredLeftBv" runat="server" Text='<%#Eval("RequiredLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredRightBv" runat="server" Text='<%#Eval("RequiredRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <label>Dream Vacation Achievers Status Report</label>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.N.">
                                        <ItemTemplate>

                                            <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="VACATION">
                                        <ItemTemplate>
                                            <asp:Label ID="labawardname" runat="server" Text='<%#Eval("vacationname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="START DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("Fromdate1") %>'></asp:Label>
                                            <asp:Label ID="lblfromdate1" runat="server" Text='<%#Eval("Fromdate") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="END DATE">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltodate" runat="server" Text='<%#Eval("Todate1") %>'></asp:Label>
                                            <asp:Label ID="lbltodate1" runat="server" Text='<%#Eval("Todate") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET LEFT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetleft" runat="server" Text='<%#Eval("TargetLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TARGET RIGHT">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltargetright" runat="server" Text='<%#Eval("TargetRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentLeftBv" runat="server" Text='<%#Eval("CurrentLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CURRENT RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentRightBv" runat="server" Text='<%#Eval("CurrentRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED LEFTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredLeftBv" runat="server" Text='<%#Eval("RequiredLeft") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="REQUIRED RIGHTBV">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrequiredRightBv" runat="server" Text='<%#Eval("RequiredRight") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="STATUS">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>
                </div>

            </div>

        </div>

        <div class="row" style="display: none;">
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                <div class="userbox">
                    <div class="box-icon">
                        <asp:Image ID="ImgMyPhoto" runat="server" class="img-responsive img-circle" />
                        <%-- <img src="img/pic.png" class="img-responsive img-circle"/>--%>
                    </div>
                    <div class="info">
                        <h4 class="text-center">User Details</h4>
                        <h6 class="text-center"><strong>Address :</strong>
                            <asp:Label ID="lbladdress" runat="server" Text=""></asp:Label></h6>
                        <ul class="list-inline">
                            <li><strong>Joining Date :</strong>
                                <asp:Label ID="lbljoiningdate" runat="server" Text=""></asp:Label></li>
                            <li><strong>Activate date :</strong>
                                <asp:Label ID="Lblactivatedate" runat="server" Text=""></asp:Label></li>
                            <li><strong>Sponser ID :</strong>
                                <asp:Label ID="LblSponserId" runat="server" Text=""></asp:Label></li>
                            <li><strong>Sponser Name :</strong>
                                <asp:Label ID="LblSponserName" runat="server" Text=""></asp:Label></li>
                            <li><strong>Parent ID :</strong>
                                <asp:Label ID="LblParentId" runat="server" Text=""></asp:Label></li>
                            <li><strong>Parent Name :</strong>
                                <asp:Label ID="LblParentName" runat="server" Text=""></asp:Label></li>
                            <li><strong>Mobile :</strong>

                            <li><strong>Email :</strong>
                                <asp:Label ID="lblemail" runat="server" Text=""></asp:Label></li>
                        </ul>

                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" style="display: none;">
                <div class="userbox">
                    <div class="info">
                        <h4 class="text-center">Bank Details</h4>
                        <p>
                            <strong>A/c Holder Name :</strong>
                            <asp:Label ID="lblaccountholdername" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>A/c No :</strong>
                            <asp:Label ID="lblaccountno" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>Bank :</strong>
                            <asp:Label ID="lblbank" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>IFSC Code :</strong>
                            <asp:Label ID="lblifsc" runat="server" Text=""></asp:Label>
                        </p>
                        <p>
                            <strong>Pan No :</strong>
                            <asp:Label ID="lblpan" runat="server" Text=""></asp:Label>
                        </p>

                    </div>
                </div>
            </div>

        </div>


        <div class="row" style="display: none;">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">Award List</div>
                    <div class="panel-body">
                        <div class="">
                            <div class="col-md-12">
                                <div class="table-responsive">

                                    <asp:GridView ID="GridView3" runat="server" CssClass="table table-hover table-bordered dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdBank_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Level">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("ulevel") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Target">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("target") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Acheived">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("bv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="Amount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Acheived Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Status1" runat="server" Text='<%#Eval("ADate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PaymentStatus">
                                                <ItemTemplate>
                                                    <asp:Label ID="PaymentStatus" runat="server" Text='<%#Eval("PaymentStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PaymentDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="PaymentDate" runat="server" Text='<%#Eval("pdate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView4" runat="server" CssClass="table table-hover dataTable danger-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Weekly Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">

                                    <asp:GridView ID="GridView5" runat="server" CssClass="table dataTable sucess-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fortnight Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView6" runat="server" CssClass="table table-hover dataTable warning-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Total Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>




        <div class="row" style="display: none;">
            <div class="col-md-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">User Performance</div>
                    <div class="panel-body">
                        <div class="">
                            <div class="col-md-6">
                                <div class="table-responsive">

                                    <asp:GridView ID="GridViewToday" runat="server" CssClass="table table-hover table-bordered dataTable" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Today Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GrvVwWeek" runat="server" CssClass="table table-hover dataTable danger-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Weekly Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">

                                    <asp:GridView ID="GrdVwMonth" runat="server" CssClass="table dataTable sucess-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Fortnight Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="table-responsive">
                                    <asp:GridView ID="GrdVwTotal" runat="server" CssClass="table table-hover dataTable warning-table" Width="100%" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Total Performance">
                                                <ItemTemplate>

                                                    <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Joining BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbljoiningbv" runat="server" Text='<%#Eval("joiningBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Repurchase BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrepurchasebv" runat="server" Text='<%#Eval("RepurchaseBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Total BV">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltotalbv" runat="server" Text='<%#Eval("TotalBv") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="count" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>



   


    <style>
        .serviceBox .service-icon {
            display: inline-block;
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 19px;
            position: relative;
        }

            .serviceBox .service-icon .heading {
                display: inline-block;
                width: 100%;
                height: 100%;
                border-radius: 50%;
                line-height: 80px;
                background: #fff;
                box-shadow: -5px 5px 5px rgba(0,0,0,0.5);
                font-size: 35px;
                color: #0fb513;
                position: absolute;
                top: 0;
                left: 0;
                text-align: center;
            }

            .serviceBox .service-icon:before {
                content: "";
                background: #0fb513;
                border-radius: 50%;
                position: absolute;
                top: -10px;
                left: -10px;
                bottom: -10px;
                right: -10px;
            }

            .serviceBox .service-icon:after {
                content: "";
                width: 4px;
                height: 0;
                background: #0fb513;
                margin: 0 auto;
                position: absolute;
                bottom: -55px;
                left: 0;
                right: 0;
                transition: all 0.3s ease 0s;
            }

        .serviceBox .title {
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 1px;
            color: #000;
            text-transform: uppercase;
            margin: 0 0 10px 0;
            position: relative;
        }

        .serviceBox.pink .service-icon:before, .serviceBox.pink .service-icon:after {
            background: #d41271;
        }

        .serviceBox.pink .service-icon:before, .serviceBox.pink .service-icon:after {
            background: #d41271;
        }

        .serviceBox.yellow .service-icon:before, .serviceBox.yellow .service-icon:after {
            background: #fba21a;
        }

        .serviceBox.yellow .service-icon:before, .serviceBox.yellow .service-icon:after {
            background: #fba21a;
        }

        .serviceBox.blue .service-icon:before, .serviceBox.blue .service-icon:after {
            background: #05b4b7;
        }

        .serviceBox.blue .service-icon:before, .serviceBox.blue .service-icon:after {
            background: #05b4b7;
        }
    </style>
    <!-- /.box-body -->
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript" language="javascript">
        function showRefCopyToast(message) {
            var toast = document.getElementById('sv-ref-toast');
            if (!toast) {
                toast = document.createElement('div');
                toast.id = 'sv-ref-toast';
                toast.className = 'sv-ref-toast';
                document.body.appendChild(toast);
            }
            toast.textContent = message;
            toast.classList.add('sv-ref-toast--show');
            clearTimeout(window._svRefToastTimer);
            window._svRefToastTimer = setTimeout(function () {
                toast.classList.remove('sv-ref-toast--show');
            }, 2500);
        }

        function setRefCopyBtnState(btn, defaultText) {
            if (!btn) return;
            btn.classList.add('sv-ref-card__copy--done');
            btn.value = 'Copied!';
            clearTimeout(btn._svCopyResetTimer);
            btn._svCopyResetTimer = setTimeout(function () {
                btn.classList.remove('sv-ref-card__copy--done');
                btn.value = defaultText;
            }, 2000);
        }

        function copyRefText(inputEl, btn, defaultText) {
            if (!inputEl || !inputEl.value) return false;

            var text = inputEl.value;
            var onSuccess = function () {
                showRefCopyToast('Link copied to clipboard!');
                setRefCopyBtnState(btn, defaultText);
            };

            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(text).then(onSuccess).catch(function () {
                    inputEl.select();
                    document.execCommand('copy');
                    onSuccess();
                });
            } else {
                inputEl.select();
                document.execCommand('copy');
                onSuccess();
            }
            return false;
        }

        function CopyToClipboard() {
            return copyRefText(
                document.getElementById('<%=TxtLeftLinkLink.ClientID%>'),
                document.getElementById('<%=Button1.ClientID%>'),
                'Copy Link'
            );
        }

        function CopyToClipboard2() {
            return copyRefText(
                document.getElementById('<%=TxtRightLink.ClientID%>'),
                document.getElementById('<%=Button2.ClientID%>'),
                'Copy'
            );
        }

        function primeclick() {

            if (confirm("Are you sure want to become a prime member ?")) {
                $.ajax({
                    url: "Dashboard.aspx/BecomePrimeMember",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{}",
                    success: function (r) {
                        if (r.d == 1) {
                            alert('Congrats! Your request has been send');
                            $(".spanprime").hide();
                            location.href = "Dashboard.aspx";
                        }
                        else if (r.d == 2) {

                            alert('error! you are already prime member');
                        }
                        else if (r.d == 3) {

                            alert('error! your previous request is already pending');
                        }
                        else {
                            return false;
                        }
                    },
                    error: function (r) { }
                });

            }
            else {
                return false;
            }
        }


        var coll = document.getElementsByClassName("collapsible");
        var i;

        for (i = 0; i < coll.length; i++) {
            coll[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var content = this.nextElementSibling;
                if (content.style.display === "block") {
                    content.style.display = "none";
                } else {
                    content.style.display = "block";
                }
            });
        }
    </script>


    <!--(Starts) For User Performance-->

    <div class="modal fade" id="modal-today">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Today Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTodayActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTodayDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTodayTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modal-week">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Current Week Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblWeekActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblWeekDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblWeekTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modal-month">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Current Month Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblMonthActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMonthTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <div class="modal fade" id="modal-total">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header py-16 px-24 border border-top-0 border-start-0 border-end-0">

                    <h4 class="modal-title">Total Performance</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <center>
                            <table style="width: 100%; text-align: center" class="table table-bordered table-hover table-responsive">
                                <tr>
                                    <th style="text-align: center">Active</th>
                                    <th style="text-align: center">Deactive</th>
                                    <th style="text-align: center">Total</th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTotalActive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTotalDeactive" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblTotalTotal" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </p>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
<!-- TradingView Script -->
<script src="https://s3.tradingview.com/tv.js"></script>

<script>
    new TradingView.widget({
        "width": "100%",
        "height": 400,
        "symbol": "BINANCE:BTCUSDT",
        "interval": "15",
        "timezone": "Asia/Kolkata",
        "theme": "dark",
        "style": "1",
        "locale": "en",
        "toolbar_bg": "#121826",
        "enable_publishing": false,
        "hide_top_toolbar": false,
        "hide_legend": false,
        "container_id": "tradingview_chart"
    });
</script>

    <script>
        async function loadCrypto() {
            const url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=5&page=1&sparkline=false";

            const res = await fetch(url);
            const data = await res.json();

            let html = "";

            data.forEach(coin => {
                const changeClass = coin.price_change_percentage_24h >= 0 ? "green" : "red";
                const changeSign = coin.price_change_percentage_24h >= 0 ? "+" : "";

                html += `
              <div class="crypto-item">
        
                <div class="crypto-left">
                  <img src="${coin.image}">
                  <div>
                    <div class="crypto-name">${coin.symbol.toUpperCase()}</div>
                    <div class="crypto-symbol">${coin.name}</div>
                  </div>
                </div>

                <div class="text-end">
                  <div class="price">$${coin.current_price.toLocaleString()}</div>
                  <div class="${changeClass}">
                    ${changeSign}${coin.price_change_percentage_24h.toFixed(2)}%
                  </div>
                </div>

              </div>
            `;
            });

            document.getElementById("crypto-list").innerHTML = html;
        }

        // Load data
        loadCrypto();
        setInterval(loadCrypto, 30000);
</script>
    </div>
</asp:Content>