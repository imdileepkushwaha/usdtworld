<%@ Page Title="Edit User Details" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
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
            if (document.getElementById("<%=txtmobile.ClientID%>").value == "") {

                alert('Enter Mobile');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtemail.ClientID%>").value == "") {

                alert('Enter Email');
                document.getElementById("<%=txtemail.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaddress.ClientID%>").value == "") {

                alert('Enter Address');
                document.getElementById("<%=txtaddress.ClientID%>").focus();
                return false;
            }

            if (document.getElementById("<%=ddcountry.ClientID%>").value == "0") {

                alert('Select Country');
                document.getElementById("<%=ddcountry.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddstate.ClientID%>").value == "0") {

                alert('Select State');
                document.getElementById("<%=ddstate.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddcity.ClientID%>").value == "0") {

                alert('Select City');
                document.getElementById("<%=ddcity.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtareaname.ClientID%>").value == "") {

                alert('Enter Area');
                document.getElementById("<%=txtareaname.ClientID%>").focus();
                return false;
            }
        }

        function fnprint() {

            $("#btnprint").hide();
            //Get the HTML of div
            var divElements = document.getElementById("div_print").innerHTML;
            //Get the HTML of whole page
            var oldPage = document.body.innerHTML;

            //Reset the page's HTML with div's HTML only
            document.body.innerHTML =
                "<html><head><title></title></head><body>" +
                divElements + "</body>";

            //Print Page
            window.print();

            //Restore orignal HTML
            document.body.innerHTML = oldPage;

            window.location = "UserProfile.aspx";


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
                    <span class="sv-page-loader__text">Loading profile...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="sv-account-page">
                <div class="sv-page-header sv-page-header--profile">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-user-circle"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>My Profile</h1>
                            <p>View your sponsor, personal &amp; wallet details</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Profile / View Profile</span>
                    </div>
                </div>

                <nav class="sv-msg-tabs" aria-label="Profile sections">
                    <a href="UserProfile.aspx" class="sv-msg-tabs__item sv-msg-tabs__item--active">
                        <i class="fa-solid fa-user"></i> View Profile
                    </a>
                    <a href="UserEdit.aspx" class="sv-msg-tabs__item">
                        <i class="fa-solid fa-user-pen"></i> Edit Profile
                    </a>
                    <a href="CHangePassword.aspx" class="sv-msg-tabs__item">
                        <i class="fa-solid fa-lock"></i> Change Password
                    </a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-users"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Sponsor Details</h3>
                            <p>Your upline and personal information</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-id-badge"></i> Sponsor Id</label>
                                    <asp:TextBox ID="txtsponserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-user"></i> Sponsor Name</label>
                                    <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-signature"></i> Name</label>
                                    <asp:TextBox ID="txtname" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-mobile-screen"></i> Mobile</label>
                                    <asp:TextBox ID="txtmobile" Enabled="false" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-envelope"></i> Email</label>
                                    <asp:TextBox ID="txtemail" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-venus-mars"></i> Gender</label>
                                    <asp:DropDownList ID="ddgender" Enabled="false" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-location-dot"></i> Address</label>
                                    <asp:TextBox ID="txtaddress" Enabled="false" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="sv-field">
                                    <label class="sv-field__label">Select Country</label>
                                    <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                        <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-map"></i> State</label>
                                    <asp:DropDownList ID="ddstate" AutoPostBack="true" Enabled="false" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                        <asp:ListItem Value="0"> Select State</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-city"></i> City</label>
                                    <asp:DropDownList ID="ddcity" Enabled="false" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0"> Select City</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="sv-field">
                                    <label class="sv-field__label">Area Name</label>
                                    <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row g-3" style="display: none">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Pincode</label>
                                    <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="sv-field">
                                    <label class="sv-field__label">Date of Birth</label>
                                    <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--nominee">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-user-group"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Nominee Details</h3>
                            <p>Emergency beneficiary information</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-user"></i> Nominee Name</label>
                                    <asp:TextBox ID="txtnomineename" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-heart"></i> Nominee Relation</label>
                                    <asp:TextBox ID="txtnomineerelation" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--wallet">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-wallet"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Trust Wallet Details</h3>
                            <p>Your linked crypto wallet information</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-coins"></i> Wallet Type</label>
                                    <asp:TextBox ID="Txtwallettype" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-link"></i> Trust Wallet Address</label>
                                    <asp:TextBox ID="TxtWalletAdd" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card" style="display:none">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-building-columns"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Bank Details</h3>
                            <p>Withdrawal and banking information</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">A/c Holder Name</label>
                                    <asp:TextBox ID="txtaccountholdername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Withdrawal Wallet Address</label>
                                    <asp:TextBox ID="txtaccountno" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">IFSC Code</label>
                                    <asp:TextBox ID="txtifsccode" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">PAN Number</label>
                                    <asp:TextBox ID="txtpan" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Bank</label>
                                    <asp:DropDownList ID="ddbank" CssClass="form-control" Enabled="false" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6" style="display: none">
                                <div class="sv-field">
                                    <label class="sv-field__label">Branch</label>
                                    <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="sv-form-actions">
                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" Visible="false" />
                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="sv-btn-danger" runat="server" Text="Cancel" Visible="false" />
                        </div>
                    </div>
                </div>
            </div>




        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/mm/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
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