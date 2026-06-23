<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DirectDownlineReport.aspx.cs" Inherits="admin_DirectReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
    <link href="css/team-pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page sv-team-page">
                <div class="sv-page-header sv-page-header--team">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-user-group"></i></div>
                        <div class="sv-page-header__text">
                            <h1>My Direct Team</h1>
                            <p>View your personally sponsored members</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Team / My Direct</span>
                    </div>
                </div>

                <nav class="sv-team-tabs" aria-label="Team sections">
                    <a href="DirectDownlineReport.aspx" class="sv-team-tabs__item sv-team-tabs__item--active"><i class="fa-solid fa-user-check"></i> My Direct</a>
                    <a href="DownlineReport.aspx" class="sv-team-tabs__item"><i class="fa-solid fa-sitemap"></i> My Downline</a>
                    <a href="treeview.aspx" class="sv-team-tabs__item"><i class="fa-solid fa-diagram-project"></i> Tree View</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search</h3>
                            <p>Load direct team for selected user</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-user"></i> User ID</label>
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
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-users"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Direct Team List</h3>
                            <p>Members directly under you</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-team-summary">
                            <div class="sv-team-stat">
                                <span class="sv-team-stat__label">Direct Team Count</span>
                                <span class="sv-team-stat__value"><asp:Label ID="LblTotalLeft" runat="server" Text="0"></asp:Label></span>
                            </div>
                            <asp:Label ID="LblTotalright" runat="server" Visible="false" Text="0"></asp:Label>
                        </div>

                        <div class="sv-msg-table-wrap">
                            <div class="sv-msg-table-scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%"
                                    AutoGenerateColumns="false" EmptyDataText="No direct members found" GridLines="None"
                                    OnRowDataBound="GridView1_RowDataBound">
                                    <EmptyDataTemplate>
                                        <div class="sv-team-tree-empty">
                                            <i class="fa-solid fa-users-slash"></i>
                                            <p>No direct team members found. Click Search to load data.</p>
                                        </div>
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User ID">
                                            <ItemTemplate>
                                                <span class="sv-team-user-id"><%# Eval("userid") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <span class="sv-team-name"><%# Eval("username") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Registration">
                                            <ItemTemplate>
                                                <span class="sv-team-date"><%# Eval("RegDate") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Topup">
                                            <ItemTemplate>
                                                <span class="sv-team-amount"><%# Eval("toupamount") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Activated">
                                            <ItemTemplate>
                                                <span class="sv-team-date"><%# Eval("ActivateDate") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <asp:GridView ID="GridView2" runat="server" Visible="false" CssClass="sv-msg-table table table-borderless"
                            Width="100%" AutoGenerateColumns="False" EmptyDataText="No Data Found" OnRowDataBound="GridView2_RowDataBound">
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
