<%@ Page Title="Topup Detail" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TopupDetail.aspx.cs" Inherits="TopupDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
    <link href="css/topup-pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-topup-page">
                <div class="sv-page-header sv-page-header--topup-detail">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-layer-group"></i></div>
                        <div class="sv-page-header__text">
                            <h1>Topup Detail</h1>
                            <p>View your plan activation and topup history</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Topup / Topup Detail</span>
                    </div>
                </div>

                <nav class="sv-topup-tabs" aria-label="Topup sections">
                    <a href="TopupRequestAdd.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-wallet"></i> Deposit Request</a>
                    <a href="ActivateUserToWallet.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-user-check"></i> Activate User</a>
                    <a href="TopupDetail.aspx" class="sv-topup-tabs__item sv-topup-tabs__item--active"><i class="fa-solid fa-list-check"></i> Topup Detail</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-table-list"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Topup History</h3>
                            <p>All completed topups linked to your account</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-msg-table-wrap">
                            <div class="sv-msg-table-scroll">
                                <asp:GridView ID="grdBank" runat="server"
                                    CssClass="sv-msg-table table table-borderless" Width="100%" GridLines="None"
                                    AutoGenerateColumns="False" EmptyDataText="No topup records found">
                                    <EmptyDataTemplate>
                                        <div class="sv-topup-empty">
                                            <i class="fa-solid fa-layer-group"></i>
                                            <p>No topup records found for your account.</p>
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
                                                <span class="sv-topup-user-cell"><%# Eval("Userid") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Topup Date">
                                            <ItemTemplate>
                                                <span class="sv-topup-date-cell"><%# Eval("entrydate") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Plan Amount">
                                            <ItemTemplate>
                                                <span class="sv-topup-amount-cell"><%# Eval("PlanAmount") %></span>
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
</asp:Content>
