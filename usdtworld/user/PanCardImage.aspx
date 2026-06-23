<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="PanCardImage.aspx.cs" Inherits="user_PanCardImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/dashboard-page.css" rel="stylesheet" />
    <link href="css/kyc-page.css" rel="stylesheet" />
    <script>
        function validate() {
            if (document.getElementById("<%=hdstatus.ClientID%>").value == "Active") {
                if (!confirm('You can upload your pan details once. Are you sure you want to update?')) {
                    return false;
                }
            }
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
                <div class="sv-dash-header__icon"><i class="fa-solid fa-id-card"></i></div>
                <div class="sv-dash-header__text">
                    <span class="sv-dash-header__eyebrow"><span class="sv-dash-header__pulse"></span>KYC Verification</span>
                    <h1>PAN Card Upload</h1>
                    <p>Submit your PAN card for identity verification</p>
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
            <a href="PanCardImage.aspx" class="sv-kyc-tabs__item sv-kyc-tabs__item--active"><i class="fa-solid fa-id-card"></i> PAN Card</a>
            <a href="CancelCheckForm.aspx" class="sv-kyc-tabs__item"><i class="fa-solid fa-money-check"></i> Cancel Cheque</a>
            <a href="AddressProof.aspx" class="sv-kyc-tabs__item"><i class="fa-solid fa-map-location-dot"></i> Address Proof</a>
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
                        <h6><i class="fa-solid fa-file-circle-check" style="margin-right:8px;color:#c4b5fd;"></i>PAN Card Details</h6>
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
                                <h4 class="sv-kyc-section__title"><i class="fa-solid fa-cloud-arrow-up"></i> Upload Document</h4>
                                <div class="sv-kyc-grid sv-kyc-grid--3">
                                    <div class="sv-kyc-field">
                                        <label>PAN Card Image</label>
                                        <div class="sv-kyc-upload">
                                            <label class="sv-kyc-upload__zone">
                                                <span class="sv-kyc-upload__icon"><i class="fa-solid fa-cloud-arrow-up"></i></span>
                                                <span class="sv-kyc-upload__title">Click to upload PAN</span>
                                                <span class="sv-kyc-upload__hint">JPG, PNG, PDF supported</span>
                                                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sv-kyc-upload__input" />
                                            </label>
                                            <div class="sv-kyc-upload__file">
                                                <i class="fa-solid fa-file-image"></i>
                                                <span class="sv-kyc-upload__name">No file selected</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>PAN Number</label>
                                        <asp:TextBox ID="txtPanNumber" runat="server" CssClass="sv-kyc-input form-control" placeholder="Enter PAN number" />
                                    </div>
                                    <div class="sv-kyc-field">
                                        <label>Uploaded Preview</label>
                                        <div class="sv-kyc-preview">
                                            <div class="sv-kyc-preview__frame">
                                                <asp:ImageButton ID="ImageShow" runat="server" CssClass="sv-kyc-preview__img" OnClick="ImageShow_Click" />
                                            </div>
                                            <span class="sv-kyc-preview__hint">Click image to view full size</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="div_update" runat="server" visible="false" class="sv-kyc-actions">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="sv-kyc-btn sv-kyc-btn--primary" runat="server" Text="Submit KYC" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="sv-kyc-btn sv-kyc-btn--danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                            <div id="div_noupdate" runat="server" visible="false" class="sv-kyc-alert">
                                <i class="fa-solid fa-circle-exclamation"></i>
                                <span>You cannot upload PAN details. Please contact admin.</span>
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
