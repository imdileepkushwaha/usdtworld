<%@ Page Title="Activate User" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ActivateUserToWallet.aspx.cs" Inherits="user_ActivateUserToWallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/topup-pages.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                alert('Enter User Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtusername.ClientID%>").value == "") {
                alert('Enter User Name');
                document.getElementById("<%=txtusername.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-topup-page">
                <div class="sv-page-header sv-page-header--topup-activate">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-user-check"></i></div>
                        <div class="sv-page-header__text">
                            <h1>Activate User</h1>
                            <p>Activate a downline member using your wallet balance</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Topup / Activate User</span>
                    </div>
                </div>

                <nav class="sv-topup-tabs sv-topup-tabs--wide" aria-label="Topup sections">
                    <a href="TopupRequestAdd.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-wallet"></i> Deposit Request</a>
                    <a href="ActivateUserToWallet.aspx" class="sv-topup-tabs__item sv-topup-tabs__item--active"><i class="fa-solid fa-user-check"></i> Activate User</a>
                    <a href="TopupDetail.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-list-check"></i> Topup Detail</a>
                    <a href="WalletTransferUSDT.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-right-left"></i> Wallet Transfer</a>
                    <a href="WalletTransfer.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-people-arrows"></i> P2P Transfer</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-bolt"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Activation Form</h3>
                            <p>Select member, plan and amount to activate</p>
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
                                        <label class="sv-field__label"><i class="fa-solid fa-signature"></i> User Name</label>
                                        <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-coins"></i> Wallet Balance</label>
                                        <asp:TextBox ID="txtbalance" Enabled="false" CssClass="form-control sv-topup-balance" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-topup-section">
                            <h4 class="sv-topup-section__title"><i class="fa-solid fa-users"></i> Member to Activate</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-user-plus"></i> Activate User ID</label>
                                        <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" placeholder="Enter member User ID" OnTextChanged="txttransferuserid_TextChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-user"></i> Activate User Name</label>
                                        <asp:TextBox ID="txttransferusername" runat="server" CssClass="form-control" placeholder="Member name" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-topup-section">

                               <h4 class="sv-topup-section__title"><i class="fa-solid fa-sliders"></i> Plan &amp; Amount</h4>
                                   <div class="row g-3">
                            <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-layer-group"></i> Select Plan</label>
                                        <asp:DropDownList ID="ddplan" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddplan_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                          
                            
                                <div class="col-md-6">
                                    <div class="sv-field sv-topup-amount-field">
                                       
                                        <label class="sv-field__label"><i class="fa-solid fa-indian-rupee-sign"></i> Amount</label>
                                        <asp:TextBox ID="txtamount" Text="" Enabled="true" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtamount_TextChanged" placeholder="Enter amount"></asp:TextBox>
                                    </div>
                                </div>
                                       </div>
                         
                        </div>

                        <div class="sv-topup-actions">
                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-btn-primary" runat="server" Text="Activate User" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="sv-btn-danger" runat="server" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>
