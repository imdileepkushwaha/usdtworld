<%@ Page Title="Tree View" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TreeView.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/team-pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page sv-team-page">
                <div class="sv-page-header sv-page-header--team">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-diagram-project"></i></div>
                        <div class="sv-page-header__text">
                            <h1>Team Tree View</h1>
                            <p>Visual hierarchy of your downline network</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Team / Tree View</span>
                    </div>
                </div>

                <nav class="sv-team-tabs" aria-label="Team sections">
                    <a href="DirectDownlineReport.aspx" class="sv-team-tabs__item"><i class="fa-solid fa-user-check"></i> My Direct</a>
                    <a href="DownlineReport.aspx" class="sv-team-tabs__item"><i class="fa-solid fa-sitemap"></i> My Downline</a>
                    <a href="treeview.aspx" class="sv-team-tabs__item sv-team-tabs__item--active"><i class="fa-solid fa-diagram-project"></i> Tree View</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Criteria</h3>
                            <p>Load team tree for a user ID</p>
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
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-network-wired"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Downline Tree</h3>
                            <p>Expand nodes to explore sub-teams</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <asp:Panel ID="pnllist" runat="server" Visible="false">
                            <div class="sv-team-tree-wrap">
                                <asp:TreeView ShowLines="true" ID="Account_Chart" runat="server" ExpandDepth="0" ImageSet="Simple"
                                    OnTreeNodePopulate="Account_Chart_TreeNodePopulate" CssClass="sv-team-tree" BorderStyle="None">
                                    <HoverNodeStyle Font-Underline="False" />
                                    <NodeStyle Font-Names="Inter, sans-serif" Font-Size="10pt" ForeColor="#e2e8f0" HorizontalPadding="4px" NodeSpacing="2px" VerticalPadding="4px" />
                                    <SelectedNodeStyle Font-Underline="False" HorizontalPadding="4px" VerticalPadding="4px" />
                                </asp:TreeView>
                                <asp:Literal ID="ltteam" runat="server" Visible="false"></asp:Literal>
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnlEmpty" runat="server" Visible="true" CssClass="sv-team-tree-empty">
                            <i class="fa-solid fa-diagram-project"></i>
                            <p>Enter User ID and click Search to load the team tree.</p>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
