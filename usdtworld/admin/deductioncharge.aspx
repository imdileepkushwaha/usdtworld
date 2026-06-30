<%@ Page Title="Deduction Charge" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="deductioncharge.aspx.cs" Inherits="deductioncharge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Updating settings...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="adm-page-head">
                    <div>
                        <h1 class="adm-page-head__title">Deduction Master</h1>
                        <p class="mb-0 text-muted" style="font-size:0.85rem;">Configure charges, TDS, wallet and deposit limits</p>
                    </div>
                    <ol class="adm-page-head__breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                        <li><span class="sep">/</span></li>
                        <li>Utility Management</li>
                        <li><span class="sep">/</span></li>
                        <li class="active">Deduction Master</li>
                    </ol>
                </div>

                <nav class="adm-util-tabs" aria-label="Utility management">
                    <a href="CountryAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-globe"></i> Country</a>
                    <a href="StateAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-map"></i> State</a>
                    <a href="CityAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-city"></i> City</a>
                    <a href="BankAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-building-columns"></i> Bank</a>
                    <a href="BankAccountAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-wallet"></i> Bank Account</a>
                    <a href="deductioncharge.aspx" class="adm-util-tabs__item adm-util-tabs__item--active"><i class="fa-solid fa-percent"></i> Deduction</a>
                    <a href="NewsAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-newspaper"></i> News</a>
                </nav>

                <div class="row">
                    <div class="col-12">
                        <div class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Deduction Charge Settings</h3>
                            </div>
                            <div class="box-body">
                                <asp:Label ID="lblid" runat="server" Visible="false" Text="0"></asp:Label>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-percent" aria-hidden="true"></i>
                                        Charges &amp; TDS
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtAdminCharge.ClientID %>">Admin Charge</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-coins adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtAdminCharge" runat="server" CssClass="form-control" placeholder="0.00" />
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtTdswithpan.ClientID %>">TDS With PAN</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-file-invoice adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtTdswithpan" runat="server" CssClass="form-control" placeholder="0.00" />
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtTdswithoutpan.ClientID %>">TDS Without PAN</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-file-circle-xmark adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtTdswithoutpan" runat="server" CssClass="form-control" placeholder="0.00" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-wallet" aria-hidden="true"></i>
                                        Cash Wallet
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtCashWallet.ClientID %>">Cash Wallet</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-wallet adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtCashWallet" runat="server" CssClass="form-control" placeholder="0.00" />
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtCashWalletPercent.ClientID %>">Cash Wallet Percentage</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-chart-pie adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtCashWalletPercent" runat="server" CssClass="form-control" placeholder="0" />
                                            </div>
                                            <span class="adm-field-hint">Enter percentage value</span>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtCappingAmount.ClientID %>">Capping Amount</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-layer-group adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtCappingAmount" runat="server" CssClass="form-control" placeholder="0.00" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-hand-holding-dollar" aria-hidden="true"></i>
                                        Deposit Limits
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtMinAmt.ClientID %>">Min Deposit Amount</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-arrow-down adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtMinAmt" runat="server" CssClass="form-control" placeholder="0.00" />
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtMaxAmt.ClientID %>">Max Deposit Amount</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-arrow-up adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtMaxAmt" runat="server" CssClass="form-control" placeholder="0.00" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update Settings" OnClick="btnUpdate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
