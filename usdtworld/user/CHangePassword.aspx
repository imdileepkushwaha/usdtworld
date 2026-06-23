<%@ Page Title="Change Password" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="CHangePassword.aspx.cs" Inherits="admin_CHangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtoldpassword.ClientID%>").value == "") {

                 alert('Enter Old Password');
                 document.getElementById("<%=txtoldpassword.ClientID%>").focus();
                 return false;
             }
             if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {

                 alert('Enter New Password');
                 document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                 return false;
             }
             if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {

                 alert('Enter Confirm Password');
                 document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                 return false;
             }
             if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {

                 alert('Password Not Match');
                 document.getElementById("<%=txtuserpassword.ClientID%>").focus();
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
                    <span class="sv-page-loader__text">Updating password...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page">
                <div class="sv-page-header sv-page-header--password">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-lock"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Change Password</h1>
                            <p>Update your login password securely</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Profile / Change Password</span>
                    </div>
                </div>

                <div class="sv-password-card">
                    <div class="sv-form-card">
                        <div class="sv-form-card__head">
                            <span class="sv-form-card__head-icon"><i class="fa-solid fa-shield-halved"></i></span>
                            <div class="sv-form-card__head-text">
                                <h3>Password Settings</h3>
                                <p>Enter your current password and choose a new one</p>
                            </div>
                        </div>
                        <div class="sv-form-card__body">
                            <div class="sv-password-fields">
                                <div class="sv-password-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-key"></i> Old Password</label>
                                    <div class="sv-password-field__wrap">
                                        <span class="sv-password-field__icon"><i class="fa-solid fa-lock"></i></span>
                                        <asp:TextBox ID="txtoldpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                        <button type="button" class="sv-password-field__toggle" data-target="<%= txtoldpassword.ClientID %>" aria-label="Show old password">
                                            <i class="fa-regular fa-eye"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="sv-password-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-lock"></i> New Password</label>
                                    <div class="sv-password-field__wrap">
                                        <span class="sv-password-field__icon"><i class="fa-solid fa-lock"></i></span>
                                        <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                        <button type="button" class="sv-password-field__toggle" data-target="<%= txtuserpassword.ClientID %>" aria-label="Show new password">
                                            <i class="fa-regular fa-eye"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="sv-password-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-lock-open"></i> Confirm Password</label>
                                    <div class="sv-password-field__wrap">
                                        <span class="sv-password-field__icon"><i class="fa-solid fa-lock"></i></span>
                                        <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                        <button type="button" class="sv-password-field__toggle" data-target="<%= txtconfirmpassword.ClientID %>" aria-label="Show confirm password">
                                            <i class="fa-regular fa-eye"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <div class="sv-form-actions">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-btn-primary" runat="server" Text="Update Password" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>

                        <div class="sv-otp-panel" id="divOTP" runat="server" visible="false">
                            <p class="sv-otp-panel__title"><i class="fa-solid fa-shield"></i> OTP Verification</p>
                            <span id="msg" style="font-size: 14px; margin-top: 5px; color: red" runat="server"></span>
                            <div class="row g-3 align-items-end">
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-hashtag"></i> Enter OTP</label>
                                        <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" placeholder="6-digit OTP"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <asp:Button ID="btnVerify" runat="server" CssClass="sv-btn-success" OnClick="btnVerify_Click" Text="Verify OTP" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnVerify" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function initPasswordToggles() {
            var buttons = document.querySelectorAll('.sv-password-field__toggle');
            for (var i = 0; i < buttons.length; i++) {
                var btn = buttons[i];
                if (btn.getAttribute('data-bound') === '1') continue;
                btn.setAttribute('data-bound', '1');
                btn.addEventListener('click', function () {
                    var targetId = this.getAttribute('data-target');
                    var input = document.getElementById(targetId);
                    var icon = this.querySelector('i');
                    if (!input || !icon) return;
                    if (input.type === 'password') {
                        input.type = 'text';
                        icon.classList.remove('fa-eye');
                        icon.classList.add('fa-eye-slash');
                        this.setAttribute('aria-label', 'Hide password');
                    } else {
                        input.type = 'password';
                        icon.classList.remove('fa-eye-slash');
                        icon.classList.add('fa-eye');
                        this.setAttribute('aria-label', 'Show password');
                    }
                });
            }
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', initPasswordToggles);
        } else {
            initPasswordToggles();
        }

        if (typeof Sys !== 'undefined' && Sys.Application) {
            Sys.Application.add_load(initPasswordToggles);
        }
    </script>
</asp:Content>

