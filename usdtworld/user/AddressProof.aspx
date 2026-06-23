<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="AddressProof.aspx.cs" Inherits="user_AddressProof" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/dashboard-page.css" rel="stylesheet" />
    <link href="css/kyc-page.css" rel="stylesheet" />
    <script>
        function validate() {
            if (document.getElementById("<%=hdstatus.ClientID%>").value == "Active") {
                if (!confirm('You can upload your address details once. Are you sure you want to update?')) {
                    return false;
                }
            }
        }
        function isNumber(evt) {
            evt = evt || window.event;
            var charCode = evt.which || evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="sv-dashboard-page sv-kyc-page">
        <div class="sv-dash-header">
            <div class="sv-dash-header__glow sv-dash-header__glow--1"></div>
            <div class="sv-dash-header__glow sv-dash-header__glow--2"></div>
            <div class="sv-dash-header__grid"></div>
            <div class="sv-dash-header__main">
                <div class="sv-dash-header__icon"><i class="fa-solid fa-map-location-dot"></i></div>
                <div class="sv-dash-header__text">
                    <span class="sv-dash-header__eyebrow"><span class="sv-dash-header__pulse"></span>KYC Verification</span>
                    <h1>Address Proof / Aadhar</h1>
                    <p>Upload Aadhar and complete your address details</p>
                </div>
            </div>
            <div class="sv-dash-header__actions">
                <a href="Dashboard.aspx" class="sv-dash-breadcrumb">
                    <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                    Dashboard
                </a>
            </div>
        </div>
        <nav class="sv-kyc-tabs" aria-label="KYC sections">
            <a href="PanCardImage.aspx" class="sv-kyc-tabs__item"><i class="fa-solid fa-id-card"></i> PAN Card</a>
            <a href="CancelCheckForm.aspx" class="sv-kyc-tabs__item"><i class="fa-solid fa-money-check"></i> Cancel Cheque</a>
            <a href="AddressProof.aspx" class="sv-kyc-tabs__item sv-kyc-tabs__item--active"><i class="fa-solid fa-map-location-dot"></i> Address Proof</a>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="sv-dashboard-page sv-kyc-page">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
            <ProgressTemplate>
                <div class="modal2"><div class="center2"><img alt="" src="loader.gif" /></div></div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hdstatus" runat="server" />
                <div class="sv-panel">
                    <div class="sv-panel__head">
                        <h6><i class="fa-solid fa-house-chimney" style="margin-right:8px;color:#a5b4fc;"></i>Address Verification</h6>
                        <span>KYC</span>
                    </div>
                    <div class="sv-panel__body">
                        <div class="sv-kyc-form">
                            <div class="sv-kyc-section">
                                <h4 class="sv-kyc-section__title"><i class="fa-solid fa-user"></i> Member Information</h4>
                                <div class="sv-kyc-grid">
                                    <div class="sv-kyc-field">
                                        <label>User ID</label>
                                        <asp:TextBox ID="txtuserid" AutoPostBack="true" runat="server" CssClass="sv-kyc-input form-control" />
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>User Name</label>
                                        <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="sv-kyc-input form-control" />
                                    </div>
                                    <div class="sv-kyc-field" id="divStatus" runat="server" visible="false">
                                        <label>Approval Status</label>
                                        <div class="sv-kyc-status-row">
                                            <asp:Label ID="lblApprovalStatus" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="sv-kyc-section">
                                <h4 class="sv-kyc-section__title"><i class="fa-solid fa-cloud-arrow-up"></i> Upload Aadhar</h4>
                                <div class="sv-kyc-grid">
                                    <div class="sv-kyc-field">
                                        <label>Aadhar Front Side</label>
                                        <div class="sv-kyc-upload">
                                            <label class="sv-kyc-upload__zone">
                                                <span class="sv-kyc-upload__icon"><i class="fa-solid fa-cloud-arrow-up"></i></span>
                                                <span class="sv-kyc-upload__title">Upload front side</span>
                                                <span class="sv-kyc-upload__hint">JPG, PNG clear photo</span>
                                                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sv-kyc-upload__input" />
                                            </label>
                                            <div class="sv-kyc-upload__file">
                                                <i class="fa-solid fa-file-image"></i>
                                                <span class="sv-kyc-upload__name">No file selected</span>
                                            </div>
                                        </div>
                                        <div class="sv-kyc-preview" style="margin-top:12px;">
                                            <span class="sv-kyc-preview__label">Front Preview</span>
                                            <div class="sv-kyc-preview__frame">
                                                <asp:ImageButton ID="ImageShow" runat="server" CssClass="sv-kyc-preview__img" OnClick="ImageShow_Click" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>Aadhar Back Side</label>
                                        <div class="sv-kyc-upload">
                                            <label class="sv-kyc-upload__zone">
                                                <span class="sv-kyc-upload__icon"><i class="fa-solid fa-cloud-arrow-up"></i></span>
                                                <span class="sv-kyc-upload__title">Upload back side</span>
                                                <span class="sv-kyc-upload__hint">JPG, PNG clear photo</span>
                                                <asp:FileUpload ID="ImageUpload2" runat="server" CssClass="sv-kyc-upload__input" />
                                            </label>
                                            <div class="sv-kyc-upload__file">
                                                <i class="fa-solid fa-file-image"></i>
                                                <span class="sv-kyc-upload__name">No file selected</span>
                                            </div>
                                        </div>
                                        <div class="sv-kyc-preview" style="margin-top:12px;">
                                            <span class="sv-kyc-preview__label">Back Preview</span>
                                            <div class="sv-kyc-preview__frame">
                                                <asp:ImageButton ID="ImageShow2" runat="server" CssClass="sv-kyc-preview__img" OnClick="ImageShow2_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="sv-kyc-section">
                                <h4 class="sv-kyc-section__title"><i class="fa-solid fa-location-dot"></i> Address Details</h4>
                                <div class="sv-kyc-grid">
                                    <div class="sv-kyc-field">
                                        <label>Aadhar Number</label>
                                        <asp:TextBox ID="txtAdharnumber" runat="server" CssClass="sv-kyc-input form-control" placeholder="12-digit Aadhar number" />
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>Pincode</label>
                                        <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="sv-kyc-input form-control" runat="server" placeholder="Enter pincode" />
                                    </div>
                                </div>
                                <div class="sv-kyc-field" style="margin-top:16px;">
                                    <label>Full Address</label>
                                    <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="sv-kyc-input sv-kyc-input--textarea form-control" runat="server" placeholder="House no, street, landmark..."></asp:TextBox>
                                </div>
                                <div class="sv-kyc-grid" style="margin-top:16px;">
                                    <div class="sv-kyc-field">
                                        <label>Country</label>
                                        <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="sv-kyc-input form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select Country</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>State</label>
                                        <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="sv-kyc-input form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select State</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>City</label>
                                        <asp:DropDownList ID="ddcity" CssClass="sv-kyc-input form-control" runat="server">
                                            <asp:ListItem Value="0">Select City</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>Other Area</label>
                                        <asp:TextBox ID="txtareaname" CssClass="sv-kyc-input form-control" runat="server" placeholder="If city not listed" />
                                    </div>
                                </div>
                            </div>

                            <div id="div_update" runat="server" visible="false" class="sv-kyc-actions">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-kyc-btn sv-kyc-btn--primary" runat="server" Text="Submit KYC" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="sv-kyc-btn sv-kyc-btn--danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                            <div id="div_noupdate" runat="server" visible="false" class="sv-kyc-alert">
                                <i class="fa-solid fa-circle-exclamation"></i>
                                <span>You cannot upload address details. Please contact admin.</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="DivPhotolarge" class="modal fade sv-kyc-modal">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title"><i class="fa-solid fa-image" style="margin-right:8px;color:#c4b5fd;"></i>Document Preview</h5>
                                <button type="button" class="btn-close btn-close-white" data-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:Image ID="ImageLarge" runat="server" CssClass="img-fluid" />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSubmit" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="js/kyc-upload.js"></script>
    <script type="text/javascript">
        function showModal1() {
            $('#DivPhotolarge').modal({ backdrop: 'static', keyboard: false });
        }
        function Closepopup() {
            $('#DivPhotolarge').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>
</asp:Content>
