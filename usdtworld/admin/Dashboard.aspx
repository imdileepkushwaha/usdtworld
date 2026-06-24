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
            </div>
            <ol class="adm-page-head__breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                <li><span class="sep">/</span></li>
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
                <div class="adm-widget">
                    <div class="adm-widget__head">
                        <h2 class="adm-widget__title">Quick Summary</h2>
                    </div>
                    <div class="adm-widget__body">
                        <div class="adm-quick-list">
                            <div class="adm-quick-item">
                                <div class="adm-quick-item__icon adm-quick-item__icon--deposit"><i class="fa-solid fa-arrow-down"></i></div>
                                <div class="adm-quick-item__content">
                                    <p class="adm-quick-item__title">Deposit Request</p>
                                    <div class="adm-quick-item__stats">
                                        Total: <strong><asp:Label ID="LblDepositlTotal" runat="server" Text="0" Font-Bold="true" /></strong><br />
                                        Pending: <strong><asp:Label ID="LblDepositPending" runat="server" Text="0" Font-Bold="true" /></strong>
                                    </div>
                                    <a href="DepositRequestReport.aspx" class="adm-quick-item__action">View report <i class="fa-solid fa-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="adm-quick-item">
                                <div class="adm-quick-item__icon adm-quick-item__icon--withdraw"><i class="fa-solid fa-arrow-up"></i></div>
                                <div class="adm-quick-item__content">
                                    <p class="adm-quick-item__title">Withdrawal Request</p>
                                    <div class="adm-quick-item__stats">
                                        Total: <strong><asp:Label ID="LblWithdrawlTotal" runat="server" Text="0" Font-Bold="true" /></strong><br />
                                        Pending: <strong><asp:Label ID="LblWithdrawlPending" runat="server" Text="0" Font-Bold="true" /></strong>
                                    </div>
                                    <a href="WithdrawlRequestReport.aspx" class="adm-quick-item__action">View report <i class="fa-solid fa-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="adm-quick-item">
                                <div class="adm-quick-item__icon adm-quick-item__icon--news"><i class="fa-solid fa-newspaper"></i></div>
                                <div class="adm-quick-item__content">
                                    <p class="adm-quick-item__title">News</p>
                                    <div class="adm-quick-item__stats">
                                        Count: <strong><asp:Label ID="LblNewsCount" runat="server" Text="0" /></strong>
                                    </div>
                                    <a href="NewsAdd.aspx" class="adm-quick-item__action">Manage news <i class="fa-solid fa-arrow-right"></i></a>
                                </div>
                            </div>
                            <div class="adm-quick-item">
                                <div class="adm-quick-item__icon adm-quick-item__icon--purchase"><i class="fa-solid fa-cart-shopping"></i></div>
                                <div class="adm-quick-item__content">
                                    <p class="adm-quick-item__title">Purchase Pending</p>
                                    <div class="adm-quick-item__stats">
                                        Count: <strong><asp:Label ID="LblPurchaseProductCount" runat="server" Text="0" /></strong>
                                    </div>
                                    <a href="#" class="adm-quick-item__action">View details <i class="fa-solid fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="adm-widget">
                    <div class="adm-widget__head">
                        <h2 class="adm-widget__title">Platform Statistics</h2>
                    </div>
                    <div class="adm-widget__body">
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
