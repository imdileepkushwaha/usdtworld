<%@ Page Title="Bank Details" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="UserBankDetail.aspx.cs" Inherits="UserBankDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=hdstatus.ClientID%>").value == "1") {
                if (!confirm('You can update your bank details only once. Are you sure you want to update?')) {
                    return false;
                }
            }

            if (document.getElementById("<%=txtsponserid.ClientID%>").value == "") {
                alert('Enter Sponser Id');
                document.getElementById("<%=txtsponserid.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtname.ClientID%>").value == "") {
                alert('Enter Name');
                document.getElementById("<%=txtname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaccountholdername.ClientID%>").value == "") {
                alert('Enter Account holder Name');
                document.getElementById("<%=txtaccountholdername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaccountno.ClientID%>").value == "") {
                alert('Enter Account No');
                document.getElementById("<%=txtaccountno.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtifsccode.ClientID%>").value == "") {
                alert('Enter IFSC CODE');
                document.getElementById("<%=txtifsccode.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtbranchname.ClientID%>").value == "") {
                alert('Enter Branch Name');
                document.getElementById("<%=txtbranchname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddbank.ClientID%>").value == "0") {
                alert('Select Bank Name');
                document.getElementById("<%=ddbank.ClientID%>").focus();
                return false;
            }
            return true;
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
                    <span class="sv-page-loader__text">Saving bank details...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page">
                <div class="sv-page-header sv-page-header--bank">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-building-columns"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Bank Details</h1>
                            <p>Manage your linked bank account for withdrawals</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Account / Bank Details</span>
                    </div>
                </div>

                <div class="sv-bank-notice">
                    <i class="fa-solid fa-circle-info"></i>
                    <span>Bank details can be updated only once after registration. Please verify account holder name, IFSC, and account number before saving.</span>
                </div>

                <asp:HiddenField ID="hdstatus" runat="server" />

                <div style="display: none;">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <asp:TextBox ID="txtsponserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                <asp:ListItem Value="Female">Female</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-12">
                            <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                <asp:ListItem Value="0"> Select Country</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                <asp:ListItem Value="0"> Select State</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0"> Select City</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtnomineename" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtnomineerelation" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--wallet">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-building-columns"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Bank Account Information</h3>
                            <p>Enter your account details exactly as per your passbook</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-user"></i> Account Holder Name</label>
                                    <asp:TextBox ID="txtaccountholdername" CssClass="form-control" runat="server" placeholder="Name as per bank records"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-hashtag"></i> Account Number</label>
                                    <asp:TextBox ID="txtaccountno" CssClass="form-control" runat="server" placeholder="Enter account number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-barcode"></i> IFSC Code</label>
                                    <asp:TextBox ID="txtifsccode" CssClass="form-control" runat="server" placeholder="e.g. SBIN0001234"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-id-card"></i> PAN Number</label>
                                    <asp:TextBox ID="txtpan" CssClass="form-control" runat="server" placeholder="Enter PAN (optional)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-landmark"></i> Bank</label>
                                    <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-location-dot"></i> Branch</label>
                                    <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server" placeholder="Branch name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--actions">
                    <div class="sv-form-card__body">
                        <div id="div_update" runat="server" visible="false">
                            <div class="sv-form-actions sv-form-actions--end">
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="sv-btn-danger" runat="server" Text="Cancel" />
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-btn-primary" runat="server" Text="Save Bank Details" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                        <div id="div_noupdate" runat="server" visible="false" class="sv-profile-alert">
                            <i class="fa-solid fa-circle-exclamation"></i>
                            You cannot update bank details. Please contact admin.
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>
