<%@ Page Title="P2P Transfer" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="WalletTransfer.aspx.cs" Inherits="WalletTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/topup-pages.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txttransferuserid.ClientID%>").value == "") {
                alert('Enter User Id');
                document.getElementById("<%=txttransferuserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txttransferusername.ClientID%>").value == "") {
                alert('Enter User Name');
                document.getElementById("<%=txttransferusername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TXtAmount.ClientID%>").value == "") {
                alert('Enter Amount');
                document.getElementById("<%=TXtAmount.ClientID%>").focus();
                return false;
            }
        }
    </script>
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
                    <span class="sv-page-loader__text">Processing transfer...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-topup-page">
                <div class="sv-page-header sv-page-header--p2p-transfer">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-people-arrows"></i></div>
                        <div class="sv-page-header__text">
                            <h1>P2P Transfer</h1>
                            <p>Send wallet balance to another member securely</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Topup / P2P Transfer</span>
                    </div>
                </div>

                <nav class="sv-topup-tabs sv-topup-tabs--wide" aria-label="Topup sections">
                    <a href="TopupRequestAdd.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-wallet"></i> Deposit Request</a>
                    <a href="ActivateUserToWallet.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-user-check"></i> Activate User</a>
                    <a href="TopupDetail.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-list-check"></i> Topup Detail</a>
                    <a href="WalletTransferUSDT.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-right-left"></i> Wallet Transfer</a>
                    <a href="WalletTransfer.aspx" class="sv-topup-tabs__item sv-topup-tabs__item--active"><i class="fa-solid fa-people-arrows"></i> P2P Transfer</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-paper-plane"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Transfer to Another User</h3>
                            <p>Enter recipient details and amount — OTP will be sent to your registered mobile</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-topup-section">
                            <h4 class="sv-topup-section__title"><i class="fa-solid fa-user"></i> Your Account</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-id-badge"></i> User ID</label>
                                        <asp:TextBox ID="txtuserid" Enabled="false" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-user"></i> User Name</label>
                                        <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-topup-section">
                            <h4 class="sv-topup-section__title"><i class="fa-solid fa-coins"></i> Transfer Amount</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-scale-balanced"></i> Your Balance</label>
                                        <asp:TextBox ID="txtbalance" Enabled="false" runat="server" CssClass="form-control sv-topup-balance" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field sv-topup-amount-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-indian-rupee-sign"></i> Transfer Amount</label>
                                        <asp:TextBox ID="TXtAmount" runat="server" CssClass="form-control" placeholder="Enter amount to transfer" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-topup-section">
                            <h4 class="sv-topup-section__title"><i class="fa-solid fa-user-group"></i> Recipient</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-id-card"></i> Transfer User ID</label>
                                        <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" placeholder="Enter recipient user ID" OnTextChanged="txttransferuserid_TextChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-user-check"></i> Transfer User Name</label>
                                        <asp:TextBox ID="txttransferusername" runat="server" Enabled="false" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:Panel ID="pnlotp" Visible="false" runat="server">
                            <div class="sv-topup-section sv-topup-section--otp">
                                <h4 class="sv-topup-section__title"><i class="fa-solid fa-shield-halved"></i> OTP Verification</h4>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="sv-field">
                                            <label class="sv-field__label"><i class="fa-solid fa-hashtag"></i> Enter OTP</label>
                                            <asp:TextBox ID="txtotp" runat="server" CssClass="form-control" placeholder="Enter OTP from SMS" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="sv-topup-actions">
                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-btn-primary" runat="server" Text="Send OTP" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnotpsubmit" Visible="false" OnClientClick="return validate();" CssClass="sv-btn-success" runat="server" Text="Confirm Transfer" OnClick="btnotpsubmit_Click" />
                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="sv-btn-danger" runat="server" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
