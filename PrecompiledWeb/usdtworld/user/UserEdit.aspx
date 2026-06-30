<%@ page language="C#" masterpagefile="~/user/MasterPage.master" autoeventwireup="true" inherits="admin_UserEdit, App_Web_ta5weiye" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            //if (document.getElementById("<%=hdstatus.ClientID%>").value == "1") {
            //  if (!confirm('You can update your profile only once.Are you sure want to update?')) {
            //    return false;
            //}
            //}

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
            if (document.getElementById("<%=Txtwallettype.ClientID%>").value == "") {
                alert('Enter wallet Type');
                document.getElementById("<%=Txtwallettype.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtWalletAdd.ClientID%>").value == "") {
                alert('Enter wallet Address');
                document.getElementById("<%=TxtWalletAdd.ClientID%>").focus();
                return false;
            }
            //if (document.getElementById("<%=txtareaname.ClientID%>").value == "") {
            //alert('Enter Area');
            //document.getElementById("<%=txtareaname.ClientID%>").focus();
            //return false;
            // }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <%--<section class="content-header">
        <h1 style="color:white;">User Edit    
        </h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home > </a></li>
        <li><a href="#">My Profile > </a></li>
          <li class="active">Edit Profile</li>
        </ol>
    </section>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="sv-page-loader">
                <div class="sv-page-loader__card">
                    <div class="sv-page-loader__spinner"></div>
                    <span class="sv-page-loader__text">Saving changes...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page">
                <div class="sv-page-header sv-page-header--edit">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-user-pen"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Edit Profile</h1>
                            <p>Update your personal and wallet information</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Profile / Edit Profile</span>
                    </div>
                </div>

                <asp:HiddenField ID="hdstatus" runat="server" />

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-id-card"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Personal Details</h3>
                            <p>Update your contact and profile information</p>
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
                                    <asp:TextBox ID="txtname" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-mobile-screen"></i> Mobile</label>
                                    <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-envelope"></i> Email</label>
                                    <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-venus-mars"></i> Gender</label>
                                    <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-cake-candles"></i> Date of Birth</label>
                                    <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row g-3" style="display: none;">
                            <div class="col-md-12">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-location-dot"></i> Address</label>
                                    <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Select Country</label>
                                    <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                        <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Select State</label>
                                    <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                        <asp:ListItem Value="0"> Select State</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Select City</label>
                                    <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0"> Select City</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Other</label>
                                    <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Pincode</label>
                                    <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
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
                            <p>Update your linked crypto wallet</p>
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

                        <div class="row g-3" style="display:none">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">A/c Holder Name</label>
                                    <asp:TextBox ID="txtaccountholdername" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Account Number</label>
                                    <asp:TextBox ID="txtaccountno" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">IFSC</label>
                                    <asp:TextBox ID="txtifsccode" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">PAN Number</label>
                                    <asp:TextBox ID="txtpan" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Bank</label>
                                    <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Branch</label>
                                    <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--nominee" style="display:none">
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
                                    <label class="sv-field__label">Nominee Name</label>
                                    <asp:TextBox ID="txtnomineename" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label">Nominee Relation</label>
                                    <asp:TextBox ID="txtnomineerelation" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--actions">
                    <div class="sv-form-card__body">
                        <div id="div_update" runat="server" visible="true">
                            <div class="sv-form-actions sv-form-actions--end">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-btn-primary" runat="server" Text="Save Changes" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="sv-btn-danger" runat="server" Text="Cancel" />
                            </div>
                        </div>
                        <div id="div_noupdate" runat="server" visible="false" class="sv-profile-alert">
                            <i class="fa-solid fa-circle-exclamation"></i>
                            You cannot update profile. Please contact admin.
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