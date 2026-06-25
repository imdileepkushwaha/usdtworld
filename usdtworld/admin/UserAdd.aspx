<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="UserAdd.aspx.cs" Inherits="admin_UserAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
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
            if (validatephonenumber(document.getElementById("<%=txtmobile.ClientID%>").value) == false) {
                alert('Invalid Mobile No');
                document.getElementById("<%=txtmobile.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddgender.ClientID%>").value == "0") {
                alert('Select Gender');
                document.getElementById("<%=ddgender.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtUserpassword.ClientID%>").value == "") {
                alert('Enter Password');
                document.getElementById("<%=txtUserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {
                alert('Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtUserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {
                alert('Password Not Match');
                document.getElementById("<%=txtUserpassword.ClientID%>").focus();
                return false;
            }
            return true;
        }

        function validatephonenumber(inputtxt) {
            var phoneno = /^([6-9]{1})([0-9]{9})$/;
            return inputtxt.match(phoneno) ? true : false;
        }

        function validateemail(inputtxt) {
            var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return inputtxt.match(email) ? true : false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Add User</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">User</a></li>
            <li class="active">Add User</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Creating user...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="row">
                    <div class="col-12">
                        <div class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add User</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-user-group" aria-hidden="true"></i>
                                        Sponsor Detail
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtsponserid.ClientID %>">Sponsor Id <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server" placeholder="Enter sponsor user id"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtsponsername.ClientID %>">Sponsor Name</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server" placeholder="Auto-filled from sponsor id"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnFree" runat="server" Text="Free Registration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnFree_CheckedChanged" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnEpin" runat="server" Text="E-Pin Registration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnEpin_CheckedChanged" />
                                        </div>
                                    </div>
                                </div>

                                <asp:Panel ID="pnlpin" runat="server" CssClass="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-ticket" aria-hidden="true"></i>
                                        Pin Detail
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= DDLstPlan.ClientID %>">Select Plan</label>
                                            <asp:DropDownList ID="DDLstPlan" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDLstPlan_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddepin.ClientID %>">Select E-Pin</label>
                                            <asp:DropDownList ID="ddepin" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtamount.ClientID %>">Amount</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-indian-rupee-sign adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtamount" Enabled="false" CssClass="form-control" runat="server" placeholder="Plan amount"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <div class="row" style="display: none">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnLeft" runat="server" Text="Left" GroupName="B" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RdBtnRight" runat="server" Text="Right" GroupName="B" />
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-address-card" aria-hidden="true"></i>
                                        Personal Information
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtname.ClientID %>">Full Name <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Enter full name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtmobile.ClientID %>">Mobile <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-mobile-screen adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtmobile" MaxLength="10" CssClass="form-control" runat="server" placeholder="10 digit mobile number"></asp:TextBox>
                                            </div>
                                            <span class="adm-field-hint">Do not use country code (+91) or leading zero.</span>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtemail.ClientID %>">Email</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-envelope adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="user@example.com"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddgender.ClientID %>">Gender <span class="adm-field-label__req">*</span></label>
                                            <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Date of Birth : Year-Month-Date</label>
                                            <fieldset>
                                                <div class="col-md-4" style="padding-left:0;padding-right:8px;">
                                                    <asp:DropDownList ID="ddlYear" CssClass="form-control" ToolTip="Year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                                <div class="col-md-4" style="padding-left:0;padding-right:8px;">
                                                    <asp:DropDownList ID="ddlMonth" CssClass="form-control" ToolTip="Month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                                <div class="col-md-4" style="padding-left:0;padding-right:8px;">
                                                    <asp:DropDownList ID="ddlDay" CssClass="form-control" ToolTip="Day" runat="server"></asp:DropDownList>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display: none;">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Address :</label>
                                            <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select Country :</label>
                                            <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select State</label>
                                            <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select State</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Select City :</label>
                                            <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddcity_SelectedIndexChanged">
                                                <asp:ListItem Value="0"> Select City</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Area</label>
                                            <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <asp:Panel ID="otherPnl" runat="server" Visible="false">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Other City :</label>
                                                <asp:TextBox ID="TxtOtherCity" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <div class="row" style="display: none;">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Pincode :</label>
                                            <asp:TextBox ID="txtpincode" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-lock" aria-hidden="true"></i>
                                        Password Information
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtUserpassword.ClientID %>">Password <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-key adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtUserpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtconfirmpassword.ClientID %>">Confirm Password <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-key adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Re-enter password"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div style="display: none;">
                                    <h4><b>PAN Card Details</b></h4>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>PanCard from :</label>
                                                <asp:FileUpload ID="panUpload" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>PanCard Number :</label>
                                                <asp:TextBox ID="txtPanNumber" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Create User" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="Div_FDetails" class="modal fade adm-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <i class="fa-solid fa-shield-halved" aria-hidden="true"></i>
                                Verify User
                            </h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="row g-3" id="divmob" runat="server">
                                <div class="col-md-8">
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtmobotp.ClientID %>">Mobile OTP</label>
                                        <asp:TextBox ID="txtmobotp" CssClass="form-control" runat="server" placeholder="Enter OTP sent on mobile"></asp:TextBox>
                                        <div class="d-flex flex-wrap align-items-center gap-2 mt-2">
                                            <asp:Button ID="btnresendmobotp" CssClass="btn btn-outline-secondary btn-sm" runat="server" Text="Resend OTP" OnClick="btnresendmobotp_Click" />
                                            <asp:Label ID="lblmobstatus" runat="server" CssClass="adm-field-hint mb-0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 d-flex align-items-end">
                                    <asp:Button ID="btnverifymob" CssClass="btn btn-primary w-100" runat="server" Text="Verify Mobile" OnClick="btnverifymob_Click" />
                                </div>
                            </div>
                            <div class="row g-3 mt-1" id="divemail" runat="server">
                                <div class="col-md-8">
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtemailotp.ClientID %>">Email OTP</label>
                                        <asp:TextBox ID="txtemailotp" CssClass="form-control" runat="server" placeholder="Enter OTP sent on email"></asp:TextBox>
                                        <div class="d-flex flex-wrap align-items-center gap-2 mt-2">
                                            <asp:Button ID="btnresendemailotp" CssClass="btn btn-outline-secondary btn-sm" runat="server" Text="Resend OTP" OnClick="btnresendemailotpClick" />
                                            <asp:Label ID="lblemailstatus" runat="server" CssClass="adm-field-hint mb-0"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 d-flex align-items-end">
                                    <asp:Button ID="btnverifyemail" CssClass="btn btn-primary w-100" runat="server" Text="Verify Email" OnClick="btnverifyemail_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
