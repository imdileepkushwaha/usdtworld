<%@ Page Title="Single Leg Income Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SIngleLegIncomeReport.aspx.cs" Inherits="LevelIncomeReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/topup-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="sv-page-loader">
                <div class="sv-page-loader__card">
                    <div class="sv-page-loader__spinner"></div>
                    <span class="sv-page-loader__text">Loading income report...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page">
                <div class="sv-page-header sv-page-header--income-single">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-diagram-project"></i></div>
                        <div class="sv-page-header__text">
                            <h1>Single Leg Income</h1>
                            <p>View single leg plan income credited to your wallets</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Income / Single Leg Income</span>
                    </div>
                </div>

                <nav class="sv-topup-tabs sv-topup-tabs--wide sv-income-tabs" aria-label="Income sections">
                    <a href="DirectIncomeReport.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-user-plus"></i> Direct Income</a>
                    <a href="LevelIncomeReport.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-layer-group"></i> Level Income</a>
                    <a href="SIngleLegIncomeReport.aspx" class="sv-topup-tabs__item sv-topup-tabs__item--active"><i class="fa-solid fa-diagram-project"></i> Single Leg Income</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Criteria</h3>
                            <p>Filter single leg income by date range</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-calendar"></i> From Date</label>
                                    <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-calendar-day"></i> To Date</label>
                                    <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-id-badge"></i> User ID</label>
                                    <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="sv-report-actions">
                            <div class="sv-report-actions__left">
                                <asp:Button ID="btnSubmit" CssClass="sv-btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Reset" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-list"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Income Details</h3>
                            <p>Single leg income transaction history</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-report-toolbar">
                            <p class="sv-report-toolbar__title"><i class="fa-solid fa-table"></i> Single Leg Income List</p>
                        </div>
                        <div class="sv-msg-table-wrap">
                            <div class="sv-msg-table-scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%"
                                    AutoGenerateColumns="False" GridLines="None" OnRowCommand="GridView1_RowCommand"
                                    EmptyDataText="No single leg income records found.">
                                    <EmptyDataTemplate>
                                        <div class="sv-report-empty">
                                            <i class="fa-solid fa-diagram-project"></i>
                                            <p>No single leg income records found for the selected criteria.</p>
                                        </div>
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Id">
                                            <ItemTemplate>
                                                <span class="sv-topup-user-cell"><%# Eval("Userid") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Username">
                                            <ItemTemplate><%# Eval("Username") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plan">
                                            <ItemTemplate><%# Eval("planname") %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Earning Wallet">
                                            <ItemTemplate>
                                                <span class="sv-txn-amount sv-txn-amount--credit"><%# Eval("EarningWalletIncome") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Topup Wallet">
                                            <ItemTemplate>
                                                <span class="sv-txn-amount sv-txn-amount--credit"><%# Eval("TopupWalletIncome") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Income">
                                            <ItemTemplate>
                                                <span class="sv-topup-amount-cell"><%# Eval("Amount") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Closing Date">
                                            <ItemTemplate>
                                                <span class="sv-topup-date-cell"><%# Eval("closingDate") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Entry Date">
                                            <ItemTemplate>
                                                <span class="sv-topup-date-cell"><%# Eval("EntryDate") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>
