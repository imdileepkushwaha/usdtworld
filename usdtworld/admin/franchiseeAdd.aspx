<%@ Page Title="Add Franchisee" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="franchiseeAdd.aspx.cs" Inherits="franchiseeAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
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
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value == "") {
                alert('Enter Password');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtconfirmpassword.ClientID%>").value == "") {
                alert('Enter Confirm Password');
                document.getElementById("<%=txtconfirmpassword.ClientID%>").focus();
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
            if (document.getElementById("<%=ddlsttehsil.ClientID%>").value == "0") {
                alert('Select tehsil');
                document.getElementById("<%=ddlsttehsil.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddlstmarket.ClientID%>").value == "0") {
                alert('Select Market');
                document.getElementById("<%=ddlstmarket.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtareaname.ClientID%>").value == "") {
                alert('Enter Area');
                document.getElementById("<%=txtareaname.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtuserpassword.ClientID%>").value != document.getElementById("<%=txtconfirmpassword.ClientID%>").value) {
                alert('Password Not Match');
                document.getElementById("<%=txtuserpassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtOutletName.ClientID%>").value == "") {
                alert('Enter Outlet Name');
                document.getElementById("<%=txtOutletName.ClientID%>").focus();
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
    <section class="content-header">
        <h1>Add Franchisee</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Franchisee</a></li>
            <li class="active">Add Franchisee</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Processing...</span>
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
                                <h3 class="box-title">Add Franchisee</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-user-group" aria-hidden="true"></i>
                                        Sponsor &amp; Personal Information
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtSponsorId.ClientID %>">Sponsor Id</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtSponsorId" CssClass="form-control" runat="server" AutoPostBack="True" OnTextChanged="txtSponsorId_TextChanged" placeholder="Enter sponsor id"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtSponsorName.ClientID %>">Sponsor Name</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtSponsorName" Enabled="false" CssClass="form-control" runat="server" placeholder="Auto-filled"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtname.ClientID %>">User Name <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Full name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtmobile.ClientID %>">Mobile No <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-mobile-screen adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="10 digit mobile"></asp:TextBox>
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
                                            <label class="adm-field-label" for="<%= ddgender.ClientID %>">Gender</label>
                                            <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= DDLstFranchiseeType.ClientID %>">Franchisee Type</label>
                                            <asp:DropDownList ID="DDLstFranchiseeType" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtOutletName.ClientID %>">Outlet Name <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-store adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtOutletName" runat="server" CssClass="form-control" placeholder="Outlet / shop name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="display:none;">
                                    <div class="col-md-6">
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

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-file-invoice" aria-hidden="true"></i>
                                        PAN Details
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtPANNo.ClientID %>">PAN No.</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtPANNo" runat="server" CssClass="form-control" placeholder="PAN number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field adm-form-grid--full">
                                            <label class="adm-field-label">PAN Document</label>
                                            <div class="adm-upload-layout">
                                                <div class="adm-upload-preview" id="panPreviewAdd">
                                                    <asp:ImageButton ID="imgPAN" runat="server" CssClass="adm-upload-preview__img adm-kyc-thumb" Width="120" Height="120" OnClick="imgPAN_Click" />
                                                    <div class="adm-upload-preview__placeholder">
                                                        <i class="fa-solid fa-image" aria-hidden="true"></i>
                                                        <span>Click preview after upload</span>
                                                    </div>
                                                </div>
                                                <div class="adm-upload-dropzone">
                                                    <div class="adm-upload-dropzone__icon"><i class="fa-solid fa-cloud-arrow-up" aria-hidden="true"></i></div>
                                                    <p class="adm-upload-dropzone__title">Upload PAN image</p>
                                                    <p class="adm-upload-dropzone__hint">PNG, JPG or PDF scan</p>
                                                    <asp:FileUpload ID="filePAN" runat="server" CssClass="adm-upload-input" accept="image/*" />
                                                    <asp:Button ID="btnPANUPload" runat="server" Text="Upload PAN" OnClick="btnPANUPload_Click" CssClass="btn btn-outline-secondary btn-sm mt-2" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-receipt" aria-hidden="true"></i>
                                        GST Details
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtGSTNo.ClientID %>">GST No.</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-barcode adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtGSTNo" runat="server" CssClass="form-control" placeholder="GST number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field adm-form-grid--full">
                                            <label class="adm-field-label">GST Document</label>
                                            <div class="adm-upload-layout">
                                                <div class="adm-upload-preview" id="gstPreviewAdd">
                                                    <asp:ImageButton ID="imgGST" runat="server" CssClass="adm-upload-preview__img adm-kyc-thumb" Width="120" Height="120" OnClick="imgGST_Click" />
                                                    <div class="adm-upload-preview__placeholder">
                                                        <i class="fa-solid fa-image" aria-hidden="true"></i>
                                                        <span>Click preview after upload</span>
                                                    </div>
                                                </div>
                                                <div class="adm-upload-dropzone">
                                                    <div class="adm-upload-dropzone__icon"><i class="fa-solid fa-cloud-arrow-up" aria-hidden="true"></i></div>
                                                    <p class="adm-upload-dropzone__title">Upload GST image</p>
                                                    <p class="adm-upload-dropzone__hint">PNG, JPG or PDF scan</p>
                                                    <asp:FileUpload ID="fileGST" runat="server" CssClass="adm-upload-input" accept="image/*" />
                                                    <asp:Button ID="btnGSTUpload" runat="server" Text="Upload GST" OnClick="btnGSTUpload_Click" CssClass="btn btn-outline-secondary btn-sm mt-2" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-location-dot" aria-hidden="true"></i>
                                        Communication Information
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field adm-form-grid--full">
                                            <label class="adm-field-label" for="<%= txtaddress.ClientID %>">Address <span class="adm-field-label__req">*</span></label>
                                            <asp:TextBox ID="txtaddress" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server" placeholder="Full address"></asp:TextBox>
                                        </div>
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
                                            <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddcity_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddlsttehsil.ClientID %>">Tehsil <span class="adm-field-label__req">*</span></label>
                                            <asp:DropDownList ID="ddlsttehsil" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlsttehsil_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select Tehsil</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddlstmarket.ClientID %>">Market <span class="adm-field-label__req">*</span></label>
                                            <asp:DropDownList ID="ddlstmarket" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlstmarket_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select Market</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtpincode.ClientID %>">Pincode</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-map-pin adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="Pincode"></asp:TextBox>
                                            </div>
                                        </div>
                                        <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server" Visible="false" Text="A"></asp:TextBox>
                                    </div>
                                </div>

                                <asp:Panel ID="otherPnl" runat="server" Visible="false">
                                    <div class="adm-form-section">
                                        <div class="adm-form-section__grid">
                                            <div class="adm-field">
                                                <label class="adm-field-label" for="<%= TxtOtherCity.ClientID %>">Other City</label>
                                                <asp:TextBox ID="TxtOtherCity" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-lock" aria-hidden="true"></i>
                                        Password Information
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtuserpassword.ClientID %>">Password <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-key adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Enter password"></asp:TextBox>
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
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Create Franchisee" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="DivPANlarge" class="modal fade adm-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><i class="fa-solid fa-image" aria-hidden="true"></i> PAN Preview</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <asp:Image ID="ImagePANLarge" runat="server" CssClass="img-fluid rounded" />
                        </div>
                    </div>
                </div>
            </div>

            <div id="DivGSTLarge" class="modal fade adm-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><i class="fa-solid fa-image" aria-hidden="true"></i> GST Preview</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <asp:Image ID="ImageGSTLarge" runat="server" CssClass="img-fluid rounded" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnPANUPload" />
            <asp:PostBackTrigger ControlID="btnGSTUpload" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
