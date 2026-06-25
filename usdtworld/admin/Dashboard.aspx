<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-dashboard-page.css" rel="stylesheet" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <div class="adm-dashboard">
        <div class="adm-page-head">
            <div>
                <h1 class="adm-page-head__title">Dashboard</h1>
                <p class="adm-page-head__subtitle">Overview of users, business &amp; payouts</p>
            </div>
            <ol class="adm-page-head__breadcrumb">
                <li><a href="Dashboard.aspx" aria-label="Home"><i class="fa-solid fa-house"></i></a></li>
                <li class="active">Dashboard</li>
            </ol>
        </div>

        <p class="adm-section-title">Overview</p>
        <div class="adm-stat-grid">
            <a href="UserReport.aspx" class="adm-stat-card adm-stat-card--teal">
                <div>
                    <p class="adm-stat-card__label">Users</p>
                    <p class="adm-stat-card__value"><asp:Label ID="LblUserCount" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-users"></i></div>
            </a>
            <a href="UserReport.aspx" class="adm-stat-card adm-stat-card--green">
                <div>
                    <p class="adm-stat-card__label">Total Active Users</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lbltotalteamactive" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-user-check"></i></div>
            </a>
            <a href="UserReport.aspx" class="adm-stat-card adm-stat-card--blue">
                <div>
                    <p class="adm-stat-card__label">Today Active Users</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lbltodayteamactive" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-bolt"></i></div>
            </a>
            <a href="UserReport.aspx" class="adm-stat-card adm-stat-card--purple">
                <div>
                    <p class="adm-stat-card__label">Total Business</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lbltotakbusiness" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-chart-line"></i></div>
            </a>
            <a href="#" class="adm-stat-card adm-stat-card--amber">
                <div>
                    <p class="adm-stat-card__label">Total Bonus</p>
                    <p class="adm-stat-card__value"><asp:Label ID="lbltotalbonus" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-gift"></i></div>
            </a>
            <a href="TransactionReport.aspx" class="adm-stat-card adm-stat-card--teal">
                <div>
                    <p class="adm-stat-card__label">Today Business</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lbltotakbusinesstoday" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-calendar-day"></i></div>
            </a>
            <a href="TransactionReport.aspx" class="adm-stat-card adm-stat-card--coral">
                <div>
                    <p class="adm-stat-card__label">Total Withdrawal</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lblwithdrawal" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-arrow-up-from-bracket"></i></div>
            </a>
            <a href="TransactionReport.aspx" class="adm-stat-card adm-stat-card--rose">
                <div>
                    <p class="adm-stat-card__label">Today Withdrawal</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lblwithdrawaltoday" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-clock-rotate-left"></i></div>
            </a>
            <a href="#" class="adm-stat-card adm-stat-card--amber">
                <div>
                    <p class="adm-stat-card__label">Pending Withdrawal</p>
                    <p class="adm-stat-card__value"><asp:Label ID="lblpendingwithdraw" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-hourglass-half"></i></div>
            </a>
            <a href="TransactionReport.aspx" class="adm-stat-card adm-stat-card--green">
                <div>
                    <p class="adm-stat-card__label">Total Deposit</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lbldeposit" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-wallet"></i></div>
            </a>
            <a href="TransactionReport.aspx" class="adm-stat-card adm-stat-card--blue">
                <div>
                    <p class="adm-stat-card__label">Today Deposit</p>
                    <p class="adm-stat-card__value"><asp:Label ID="Lbldeposittoday" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-coins"></i></div>
            </a>
            <a href="TransactionReport.aspx" class="adm-stat-card adm-stat-card--purple">
                <div>
                    <p class="adm-stat-card__label">Total Payout</p>
                    <p class="adm-stat-card__value"><asp:Label ID="lbltotalpayout" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-money-bill-transfer"></i></div>
            </a>
            <a href="TransactionReport.aspx" class="adm-stat-card adm-stat-card--teal">
                <div>
                    <p class="adm-stat-card__label">Today Payout</p>
                    <p class="adm-stat-card__value"><asp:Label ID="lbltotalpayouttoday" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-hand-holding-dollar"></i></div>
            </a>
            <a href="ProductDetails.aspx" class="adm-stat-card adm-stat-card--coral">
                <div>
                    <p class="adm-stat-card__label">Products</p>
                    <p class="adm-stat-card__value"><asp:Label ID="LblActiveEpin" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-box"></i></div>
            </a>
            <a href="UsersRewardReport.aspx" class="adm-stat-card adm-stat-card--amber">
                <div>
                    <p class="adm-stat-card__label">Award &amp; Reward</p>
                    <p class="adm-stat-card__value"><asp:Label ID="lable1" runat="server" Text="0" /></p>
                </div>
                <div class="adm-stat-card__icon"><i class="fa-solid fa-trophy"></i></div>
            </a>
        </div>

        <asp:Label ID="LblProductCount" runat="server" Text=" " Visible="false" />
        <asp:Label ID="LblPurchaseAmount" runat="server" Text="" Visible="false" />

        <div class="row g-3 mt-1">
            <div class="col-lg-4">
                <div class="adm-widget adm-widget--summary">
                    <div class="adm-widget__head">
                        <div class="adm-widget__head-left">
                            <span class="adm-widget__icon adm-widget__icon--teal" aria-hidden="true"><i class="fa-solid fa-bolt"></i></span>
                            <div>
                                <h2 class="adm-widget__title">Quick Summary</h2>
                                <p class="adm-widget__subtitle">Pending requests at a glance</p>
                            </div>
                        </div>
                    </div>
                    <div class="adm-widget__body">
                        <div class="adm-quick-list">
                            <div class="adm-quick-item adm-quick-item--deposit">
                                <div class="adm-quick-item__icon adm-quick-item__icon--deposit"><i class="fa-solid fa-arrow-down"></i></div>
                                <div class="adm-quick-item__main">
                                    <p class="adm-quick-item__title">Deposit Request</p>
                                    <div class="adm-quick-item__stats">
                                        <span class="adm-quick-stat"><span class="adm-quick-stat__lbl">Total</span><span class="adm-quick-stat__val"><asp:Label ID="LblDepositlTotal" runat="server" Text="0" /></span></span>
                                        <span class="adm-quick-stat adm-quick-stat--pending"><span class="adm-quick-stat__lbl">Pending</span><span class="adm-quick-stat__val"><asp:Label ID="LblDepositPending" runat="server" Text="0" /></span></span>
                                    </div>
                                </div>
                                <a href="DepositRequestReport.aspx" class="adm-quick-item__go" title="View report"><i class="fa-solid fa-chevron-right"></i></a>
                            </div>
                            <div class="adm-quick-item adm-quick-item--withdraw">
                                <div class="adm-quick-item__icon adm-quick-item__icon--withdraw"><i class="fa-solid fa-arrow-up"></i></div>
                                <div class="adm-quick-item__main">
                                    <p class="adm-quick-item__title">Withdrawal Request</p>
                                    <div class="adm-quick-item__stats">
                                        <span class="adm-quick-stat"><span class="adm-quick-stat__lbl">Total</span><span class="adm-quick-stat__val"><asp:Label ID="LblWithdrawlTotal" runat="server" Text="0" /></span></span>
                                        <span class="adm-quick-stat adm-quick-stat--pending"><span class="adm-quick-stat__lbl">Pending</span><span class="adm-quick-stat__val"><asp:Label ID="LblWithdrawlPending" runat="server" Text="0" /></span></span>
                                    </div>
                                </div>
                                <a href="WithdrawlRequestReport.aspx" class="adm-quick-item__go" title="View report"><i class="fa-solid fa-chevron-right"></i></a>
                            </div>
                            <div class="adm-quick-item adm-quick-item--news">
                                <div class="adm-quick-item__icon adm-quick-item__icon--news"><i class="fa-solid fa-newspaper"></i></div>
                                <div class="adm-quick-item__main">
                                    <p class="adm-quick-item__title">News</p>
                                    <div class="adm-quick-item__stats">
                                        <span class="adm-quick-stat"><span class="adm-quick-stat__lbl">Count</span><span class="adm-quick-stat__val"><asp:Label ID="LblNewsCount" runat="server" Text="0" /></span></span>
                                    </div>
                                </div>
                                <a href="NewsAdd.aspx" class="adm-quick-item__go" title="Manage news"><i class="fa-solid fa-chevron-right"></i></a>
                            </div>
                            <div class="adm-quick-item adm-quick-item--purchase">
                                <div class="adm-quick-item__icon adm-quick-item__icon--purchase"><i class="fa-solid fa-cart-shopping"></i></div>
                                <div class="adm-quick-item__main">
                                    <p class="adm-quick-item__title">Purchase Pending</p>
                                    <div class="adm-quick-item__stats">
                                        <span class="adm-quick-stat adm-quick-stat--pending"><span class="adm-quick-stat__lbl">Pending</span><span class="adm-quick-stat__val"><asp:Label ID="LblPurchaseProductCount" runat="server" Text="0" /></span></span>
                                    </div>
                                </div>
                                <a href="#" class="adm-quick-item__go" title="View details"><i class="fa-solid fa-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="adm-widget adm-widget--chart">
                    <div class="adm-widget__head">
                        <div class="adm-widget__head-left">
                            <span class="adm-widget__icon adm-widget__icon--blue" aria-hidden="true"><i class="fa-solid fa-chart-line"></i></span>
                            <div>
                                <h2 class="adm-widget__title">Platform Statistics</h2>
                                <p class="adm-widget__subtitle">Business performance overview</p>
                            </div>
                        </div>
                        <span class="adm-widget__badge">Live</span>
                    </div>
                    <div class="adm-widget__body adm-widget__body--chart">
                        <div class="adm-chart-wrap">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            <div id="Div1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="display:none;">
            <asp:Literal ID="ltScripts" runat="server"></asp:Literal>
            <div id="chart_div" style="height:500px;"></div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
