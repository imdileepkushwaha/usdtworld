<%@ Page Title="Deposit Request" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DepositRequstAdd.aspx.cs" Inherits="user_DepositRequstAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/kyc-page.css" rel="stylesheet" />
    <link href="css/topup-pages.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=RDBTNAdmin.ClientID%>").checked == true) {
                if (document.getElementById("<%=ddbankaccountno.ClientID%>").value == "0") {
                    alert('Select Bank Account');
                    document.getElementById("<%=ddbankaccountno.ClientID%>").focus();
                    return false;
                }
                if (document.getElementById("<%=ddmode.ClientID%>").value == "Select") {
                    alert('Select Paymentmode');
                    document.getElementById("<%=ddmode.ClientID%>").focus();
                    return false;
                }
                if (document.getElementById("<%=TxtTransactionId.ClientID%>").value == "") {
                    alert('Enter TransactionID');
                    document.getElementById("<%=TxtTransactionId.ClientID%>").focus();
                    return false;
                }
            }
            if (document.getElementById("<%=RDBtnFranchisee.ClientID%>").checked == true) {
                if (document.getElementById("<%=TxtFranchiseeUserId.ClientID%>").value == "") {
                    alert('Enter franchisee ID');
                    document.getElementById("<%=TxtFranchiseeUserId.ClientID%>").focus();
                    return false;
                }
            }
            if (document.getElementById("<%=txtamount.ClientID%>").value == "") {
                alert('Enter Amount');
                document.getElementById("<%=txtamount.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="sv-page-loader">
                <div class="sv-page-loader__card">
                    <div class="sv-page-loader__spinner"></div>
                    <span class="sv-page-loader__text">Submitting deposit request...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-topup-page">
                <div class="sv-page-header sv-page-header--topup">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-building-columns"></i></div>
                        <div class="sv-page-header__text">
                            <h1>Deposit Request</h1>
                            <p>Submit bank deposit with payment proof</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Deposit / Deposit Request</span>
                    </div>
                </div>

                <nav class="sv-topup-tabs" aria-label="Deposit sections">
                    <a href="DepositRequstAdd.aspx" class="sv-topup-tabs__item sv-topup-tabs__item--active"><i class="fa-solid fa-file-invoice-dollar"></i> Deposit Request</a>
                    <a href="DepositRequestReport.aspx" class="sv-topup-tabs__item"><i class="fa-solid fa-list-check"></i> Deposit Report</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-money-bill-transfer"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Deposit Request Form</h3>
                            <p>Transfer to company account and upload payment slip</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row" style="display:none">
                            <div class="col-md-3">
                                <asp:RadioButton ID="RDBtnTRecharge" runat="server" Text="Main Wallet" GroupName="A" AutoPostBack="true" OnCheckedChanged="RDBtnTRecharge_CheckedChanged" />
                            </div>
                            <div class="col-md-3">
                                <asp:RadioButton ID="RdBtnUtility" runat="server" Text="Cash Wallet" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnUtility_CheckedChanged" />
                            </div>
                        </div>
                        <div class="row" style="display:none">
                            <div class="col-md-3">
                                <asp:RadioButton ID="RDBTNAdmin" runat="server" Text="Admin" GroupName="B" AutoPostBack="true" OnCheckedChanged="RDBTNAdmin_CheckedChanged" />
                            </div>
                            <div class="col-md-3">
                                <asp:RadioButton ID="RDBtnFranchisee" runat="server" Text="Franchisee" GroupName="B" AutoPostBack="true" OnCheckedChanged="RDBtnFranchisee_CheckedChanged" />
                            </div>
                        </div>

                        <asp:Panel runat="server" Visible="false" ID="Pnlfranchisee">
                            <div class="sv-topup-section">
                                <h4 class="sv-topup-section__title"><i class="fa-solid fa-store"></i> Franchisee Details</h4>
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="sv-field">
                                            <label class="sv-field__label">Franchisee ID</label>
                                            <asp:TextBox ID="TxtFranchiseeUserId" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="TxtFranchiseeUserId_TextChanged" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="sv-field">
                                            <label class="sv-field__label">Franchisee Name</label>
                                            <asp:TextBox ID="TxtFranchiseename" Enabled="false" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <asp:Panel runat="server" ID="Pnladmin">
                            <div class="sv-topup-section">
                                <h4 class="sv-topup-section__title"><i class="fa-solid fa-landmark"></i> Company Bank Account</h4>
                                <div class="row g-3 mb-3">
                                    <div class="col-md-12">
                                        <div class="sv-field">
                                            <label class="sv-field__label"><i class="fa-solid fa-building-columns"></i> Select Deposit Account</label>
                                            <asp:DropDownList ID="ddbankaccountno" AutoPostBack="true" OnSelectedIndexChanged="ddbankaccountno_SelectedIndexChanged" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Account No</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="sv-topup-bank-grid">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-hashtag"></i> Account Number</label>
                                        <asp:TextBox ID="txtdepositaccountno" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-landmark"></i> Bank Name</label>
                                        <asp:TextBox ID="txtdepositbank" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-barcode"></i> IFSC Code</label>
                                        <asp:TextBox ID="txtifsccode" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-user"></i> Account Holder</label>
                                        <asp:TextBox ID="txtaccountholdername" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-location-dot"></i> Branch</label>
                                        <asp:TextBox ID="txtbranchname" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="sv-topup-section">
                            <h4 class="sv-topup-section__title"><i class="fa-solid fa-user"></i> Member Details</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-id-badge"></i> User ID</label>
                                        <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
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
                                        <label class="sv-field__label"><i class="fa-solid fa-coins"></i> Account Balance</label>
                                        <asp:TextBox ID="txtbalance" Enabled="false" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control sv-topup-balance" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-topup-section">
                            <h4 class="sv-topup-section__title"><i class="fa-solid fa-receipt"></i> Payment Details</h4>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-credit-card"></i> Deposit Mode</label>
                                        <asp:DropDownList ID="ddmode" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="Select">Select </asp:ListItem>
                                            <asp:ListItem Value="Cheque">Cheque</asp:ListItem>
                                            <asp:ListItem Value="RTGS">RTGS</asp:ListItem>
                                            <asp:ListItem Value="NEFT">NEFT</asp:ListItem>
                                            <asp:ListItem Value="IMPS">IMPS</asp:ListItem>
                                            <asp:ListItem Value="IMPS">THIRD PARTY TRANSFER</asp:ListItem>
                                            <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-hashtag"></i> Transaction / Cheque No</label>
                                        <asp:TextBox ID="TxtTransactionId" runat="server" CssClass="form-control" placeholder="Enter transaction or cheque number" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field sv-topup-amount-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-indian-rupee-sign"></i> Enter Amount</label>
                                        <asp:TextBox ID="txtamount" runat="server" onkeypress="return isNumberKey(event);" CssClass="form-control" placeholder="Enter deposit amount" />
                                        <asp:Label ID="lblmssg" runat="server" CssClass="sv-topup-field-error"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="sv-field">
                                        <label class="sv-field__label"><i class="fa-solid fa-comment"></i> Narration</label>
                                        <asp:TextBox ID="TxtNarration" runat="server" CssClass="form-control" placeholder="Optional note" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-topup-section">
                            <h4 class="sv-topup-section__title"><i class="fa-solid fa-cloud-arrow-up"></i> Upload Payment Slip</h4>
                            <div class="sv-field">
                                <label class="sv-field__label">Payment Slip / Screenshot</label>
                                <div class="sv-kyc-upload">
                                    <label class="sv-kyc-upload__zone">
                                        <span class="sv-kyc-upload__icon"><i class="fa-solid fa-cloud-arrow-up"></i></span>
                                        <span class="sv-kyc-upload__title">Click to upload slip</span>
                                        <span class="sv-kyc-upload__hint">JPG, PNG or PDF supported</span>
                                        <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sv-kyc-upload__input" />
                                    </label>
                                    <div class="sv-kyc-upload__file">
                                        <i class="fa-solid fa-file-image"></i>
                                        <span class="sv-kyc-upload__name">No file selected</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sv-topup-actions">
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
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
    <script src="js/kyc-upload.js"></script>
</asp:Content>
