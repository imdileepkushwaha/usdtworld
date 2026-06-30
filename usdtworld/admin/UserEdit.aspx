<%@ Page Title="Edit User Details" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="UserEdit.aspx.cs" Inherits="admin_UserEdit" %>

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
            return true;
        }

        function isNumber(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Saving member details...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="adm-page-head">
                    <div>
                        <h1 class="adm-page-head__title">Edit User</h1>
                        <p class="mb-0 text-muted" style="font-size:0.85rem;">Update member profile, KYC and nominee information</p>
                    </div>
                    <ol class="adm-page-head__breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                        <li><span class="sep">/</span></li>
                        <li><a href="UserReport.aspx">Member</a></li>
                        <li><span class="sep">/</span></li>
                        <li class="active">Edit User</li>
                    </ol>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Edit User Details</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-form-section" style="display:none;">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-building-columns" aria-hidden="true"></i>
                                        Bank Details
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtaccountholdername.ClientID %>">A/c Holder Name</label>
                                            <asp:TextBox ID="txtaccountholdername" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtaccountno.ClientID %>">A/c No</label>
                                            <asp:TextBox ID="txtaccountno" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtifsccode.ClientID %>">IFSC Code</label>
                                            <asp:TextBox ID="txtifsccode" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddbank.ClientID %>">Bank</label>
                                            <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtbranchname.ClientID %>">Branch</label>
                                            <asp:TextBox ID="txtbranchname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-id-card" aria-hidden="true"></i>
                                        KYC Details
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtpan.ClientID %>">PAN Number</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-badge adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtpan" CssClass="form-control" runat="server" placeholder="PAN number"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-user-group" aria-hidden="true"></i>
                                        Sponsor Detail
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtsponserid.ClientID %>">Sponsor Id</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtsponserid" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtsponsername.ClientID %>">Sponsor Name</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
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
                                            <label class="adm-field-label" for="<%= txtname.ClientID %>">Name <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Full name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtmobile.ClientID %>">Mobile <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-mobile-screen adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="Mobile number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtemail.ClientID %>">Email <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-envelope adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="user@example.com"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= Txtadhar.ClientID %>">Aadhar</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-fingerprint adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="Txtadhar" CssClass="form-control" runat="server" placeholder="Aadhar number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddgender.ClientID %>">Gender</label>
                                            <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field adm-form-grid--full">
                                            <label class="adm-field-label" for="<%= txtaddress.ClientID %>">Address <span class="adm-field-label__req">*</span></label>
                                            <asp:TextBox ID="txtaddress" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server" placeholder="Full address"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-location-dot" aria-hidden="true"></i>
                                        Location
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddcountry.ClientID %>">Country <span class="adm-field-label__req">*</span></label>
                                            <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddstate.ClientID %>">State <span class="adm-field-label__req">*</span></label>
                                            <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select State</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddcity.ClientID %>">City <span class="adm-field-label__req">*</span></label>
                                            <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtareaname.ClientID %>">Other / Area <span class="adm-field-label__req">*</span></label>
                                            <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server" placeholder="Area or locality"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtpincode.ClientID %>">Pincode</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-map-pin adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="Pin code"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtdateofbirth.ClientID %>">Date of Birth</label>
                                            <asp:TextBox ID="txtdateofbirth" CssClass="form-control form_date" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-people-roof" aria-hidden="true"></i>
                                        Nominee Details
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtnomineename.ClientID %>">Nominee Name</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtnomineename" CssClass="form-control" runat="server" placeholder="Nominee full name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtnomineerelation.ClientID %>">Nominee Relation</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-heart adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtnomineerelation" CssClass="form-control" runat="server" placeholder="Relation with member"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
