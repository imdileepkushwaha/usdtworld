<%@ Page Title="Transaction Password" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="TransactionPass.aspx.cs" Inherits="user_TransactionPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/topup-pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="uplMaster">
        <ProgressTemplate>
            <div class="sv-page-loader">
                <div class="sv-page-loader__card">
                    <div class="sv-page-loader__spinner"></div>
                    <span class="sv-page-loader__text">Verifying password...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel runat="server" ID="uplMaster">
        <ContentTemplate>
            <div class="sv-account-page">
                <div class="sv-page-header sv-page-header--txn-pass">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-shield-halved"></i></div>
                        <div class="sv-page-header__text">
                            <h1>Transaction Password</h1>
                            <p>Verify your transaction password to continue securely</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Security / Transaction Password</span>
                    </div>
                </div>

                <div class="sv-form-card sv-password-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-key"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Verify Transaction Password</h3>
                            <p>Enter your credentials to access the requested action</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-id-badge"></i> User ID</label>
                                    <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-lock"></i> Transaction Password</label>
                                    <div class="sv-password-field__wrap">
                                        <span class="sv-password-field__icon"><i class="fa-solid fa-lock"></i></span>
                                        <asp:TextBox ID="Txtapssword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter transaction password"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-form-actions">
                            <asp:Button ID="btnSubmit" CssClass="sv-btn-primary" runat="server" Text="Verify &amp; Continue" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>

                <div id="Divotp" class="sv-txn-modal hidden">
                    <div class="sv-txn-modal__card">
                        <div class="sv-txn-modal__head">
                            <h4>OTP Confirmation</h4>
                            <p>Enter the OTP sent to your registered mobile number</p>
                        </div>
                        <div class="sv-txn-modal__body">
                            <div class="sv-field">
                                <label class="sv-field__label"><i class="fa-solid fa-hashtag"></i> OTP</label>
                                <asp:TextBox runat="server" CssClass="form-control" ID="TxtOtp" placeholder="Enter 6-digit OTP"></asp:TextBox>
                                <asp:Label ID="LblMessages" runat="server" Text="Invalid OTP please enter valid OTP...!" CssClass="sv-txn-modal__alert" Visible="false"></asp:Label>
                            </div>
                            <div id="div2" runat="server" visible="false" class="sv-txn-modal__success">
                                <strong>Success!</strong> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            </div>
                        </div>
                        <div class="sv-txn-modal__footer">
                            <asp:Button ID="BtnConfirm" runat="server" Text="Submit OTP" CssClass="sv-btn-success" OnClick="BtnConfirm_Click" />
                            <asp:Button ID="BtnResend" runat="server" Text="Resend OTP" CssClass="sv-btn-primary" OnClick="BtnResend_Click" />
                            <button type="button" class="sv-btn-danger" onclick="Closepopup1();">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
    <script type="text/javascript">
        function showModal12() {
            var modal = document.getElementById('Divotp');
            if (modal) modal.classList.remove('hidden');
        }

        function Closepopup1() {
            var modal = document.getElementById('Divotp');
            if (modal) modal.classList.add('hidden');
        }

        if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                var modal = document.getElementById('Divotp');
                if (modal && !modal.classList.contains('hidden')) {
                    modal.classList.remove('hidden');
                }
            });
        }
    </script>
</asp:Content>
