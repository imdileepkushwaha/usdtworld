<%@ Page Title="Withdrawl Request" Language="C#" MasterPageFile="masterpage.master" AutoEventWireup="true" CodeFile="WithdrawlRequstAdd.aspx.cs" Inherits="user_WithdrawlRequstAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="sv-page-loader">
                <div class="sv-page-loader__card">
                    <div class="sv-page-loader__spinner"></div>
                    <span class="sv-page-loader__text">Processing request...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="sv-account-page sv-report-page">
                <div class="sv-page-header sv-page-header--withdraw">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-money-bill-transfer"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Withdrawal Request</h1>
                            <p>Submit a new withdrawal from your wallet balance</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Withdrawal / New Request</span>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--withdraw sv-password-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-hand-holding-dollar"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Request Details</h3>
                            <p>Enter user details and withdrawal amount</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3" style="display:none">
                            <div class="col-md-3">
                                <div class="sv-field">
                                    <asp:RadioButton ID="RDBtnTRecharge" runat="server" Text="Recharge Wallet" GroupName="A" AutoPostBack="true" OnCheckedChanged="RDBtnTRecharge_CheckedChanged" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="sv-field">
                                    <asp:RadioButton ID="RdBtnUtility" runat="server" Text="Utility Wallet" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnUtility_CheckedChanged" />
                                </div>
                            </div>
                        </div>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-id-badge"></i> User ID</label>
                                    <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-user"></i> User Name</label>
                                    <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                        </div>

                        <div class="sv-withdraw-balance">
                            <span class="sv-withdraw-balance__label">
                                <i class="fa-solid fa-wallet"></i> Available Balance
                            </span>
                            <div class="sv-withdraw-balance__value">
                                <asp:TextBox ID="txtbalance" Enabled="false" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" />
                            </div>
                        </div>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-coins"></i> Enter Amount</label>
                                    <asp:TextBox ID="txtamount" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" placeholder="0.00" />
                                </div>
                            </div>
                        </div>

                        <div class="row g-3" style="display:none">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Image</label>
                                    <asp:FileUpload ID="ImageUpload" runat="server" />
                                </div>
                            </div>
                        </div>

                        <div class="sv-form-actions sv-form-actions--end">
                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-btn-primary" runat="server" Text="Submit Request" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function validate() {
        }
    </script>
</asp:Content>
