<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="BankAccountAdd.aspx.cs" Inherits="admin_BankAccountAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtaccountholdername.ClientID%>").value == "") {
                alert('Enter Acc Holder Name');
                document.getElementById("<%=txtaccountholdername.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositaccountno.ClientID%>").value == "") {
                alert('Enter Account No');
                document.getElementById("<%=txtdepositaccountno.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositbank.ClientID%>").value == "") {
                alert('Enter Bank Name');
                document.getElementById("<%=txtdepositbank.ClientID%>").focus();
                return false;
            }
            return true;
        }

        function validate2() {
            if (document.getElementById("<%=txtaccholdernameedit.ClientID%>").value == "") {
                alert('Enter Account Holder Name');
                document.getElementById("<%=txtaccholdernameedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaccountnoedit.ClientID%>").value == "") {
                alert('Enter Account No');
                document.getElementById("<%=txtaccountnoedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtdepositbankedit.ClientID%>").value == "") {
                alert('Enter Bank Name');
                document.getElementById("<%=txtdepositbankedit.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Saving bank account...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="adm-page-head">
                    <div>
                        <h1 class="adm-page-head__title">Bank Account Add</h1>
                        <p class="mb-0 text-muted" style="font-size:0.85rem;">Manage deposit bank accounts and QR codes</p>
                    </div>
                    <ol class="adm-page-head__breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                        <li><span class="sep">/</span></li>
                        <li>Utility Management</li>
                        <li><span class="sep">/</span></li>
                        <li class="active">Bank Account Add</li>
                    </ol>
                </div>

                <nav class="adm-util-tabs" aria-label="Utility management">
                    <a href="CountryAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-globe"></i> Country</a>
                    <a href="StateAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-map"></i> State</a>
                    <a href="CityAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-city"></i> City</a>
                    <a href="BankAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-building-columns"></i> Bank</a>
                    <a href="BankAccountAdd.aspx" class="adm-util-tabs__item adm-util-tabs__item--active"><i class="fa-solid fa-wallet"></i> Bank Account</a>
                    <a href="deductioncharge.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-percent"></i> Deduction</a>
                    <a href="NewsAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-newspaper"></i> News</a>
                </nav>

                <div class="row">
                    <div class="col-12">
                        <div class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Add Bank Account</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-form-grid adm-form-grid--bank">
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtdepositbank.ClientID %>">Bank Name <span class="adm-field-label__req">*</span></label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-building-columns adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtdepositbank" runat="server" CssClass="form-control" placeholder="Enter bank name" />
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtdepositaccountno.ClientID %>">Account Number <span class="adm-field-label__req">*</span></label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-hashtag adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtdepositaccountno" runat="server" CssClass="form-control" placeholder="Enter account number" />
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtifsccode.ClientID %>">IFSC Code</label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-barcode adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtifsccode" runat="server" CssClass="form-control" placeholder="e.g. SBIN0001234" />
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtaccountholdername.ClientID %>">Account Holder <span class="adm-field-label__req">*</span></label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtaccountholdername" runat="server" CssClass="form-control" placeholder="Enter holder name" />
                                        </div>
                                    </div>

                                    <div class="adm-field adm-form-grid--full adm-upload-field">
                                        <label class="adm-field-label">QR Code Image</label>
                                        <div class="adm-upload-layout">
                                            <div class="adm-upload-preview" id="qrPreviewAdd">
                                                <asp:Image ID="ImageShow" runat="server" CssClass="adm-upload-preview__img" />
                                                <div class="adm-upload-preview__placeholder">
                                                    <i class="fa-solid fa-qrcode" aria-hidden="true"></i>
                                                    <span>QR preview will appear here</span>
                                                </div>
                                            </div>
                                            <div class="adm-upload-dropzone" data-preview="qrPreviewAdd" data-filename="qrFilenameAdd">
                                                <div class="adm-upload-dropzone__icon">
                                                    <i class="fa-solid fa-cloud-arrow-up" aria-hidden="true"></i>
                                                </div>
                                                <p class="adm-upload-dropzone__title">Drag &amp; drop QR image here</p>
                                                <p class="adm-upload-dropzone__hint">PNG, JPG or WEBP — recommended square image</p>
                                                <span class="adm-upload-dropzone__filename" id="qrFilenameAdd">No file chosen</span>
                                                <asp:FileUpload ID="ProductImageUpload" runat="server" CssClass="adm-upload-input" accept="image/*" />
                                                <span class="btn btn-outline-secondary btn-sm adm-upload-browse">Browse files</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Save Account" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="box box-primary adm-table-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Bank Accounts</h3>
                            </div>
                            <div class="box-body box-body--flush">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover mb-0" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <span class="adm-table__index"><%# Container.DataItemIndex + 1 %></span>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Account No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblaccountno" runat="server" Text='<%# Eval("accountno") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Holder Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblaccountholdername" runat="server" Text='<%# Eval("accountholdername") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblbankname" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="IFSC">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblimage" runat="server" Text='<%# Eval("IFSCCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="QR">
                                                <ItemTemplate>
                                                    <asp:Image ID="lblbranchname" runat="server" CssClass="adm-qr-thumb" ImageUrl='<%# "../ProductImage/" + Eval("BranchName") %>' AlternateText="QR Code" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CssClass="adm-action-btn" ToolTip="Edit">
                                                        <i class="fa-solid fa-pen" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkDel" runat="server" CommandName="del" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CssClass="adm-action-btn adm-action-btn--danger" ToolTip="Delete account" OnClientClick="return confirm('Delete this bank account?');">
                                                        <i class="fa-solid fa-trash" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="myModal" class="modal fade adm-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <i class="fa-solid fa-pen-to-square" aria-hidden="true"></i>
                                Edit Bank Account
                            </h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblbankaccountid" runat="server" Visible="false" Text="0"></asp:Label>
                            <div class="adm-form-grid adm-form-grid--bank">
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtaccountnoedit.ClientID %>">Account Number</label>
                                    <div class="adm-input-wrap">
                                        <i class="fa-solid fa-hashtag adm-input-wrap__icon" aria-hidden="true"></i>
                                        <asp:TextBox ID="txtaccountnoedit" runat="server" CssClass="form-control" placeholder="Account number" />
                                    </div>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtaccholdernameedit.ClientID %>">Account Holder</label>
                                    <div class="adm-input-wrap">
                                        <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                        <asp:TextBox ID="txtaccholdernameedit" runat="server" CssClass="form-control" placeholder="Holder name" />
                                    </div>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtdepositbankedit.ClientID %>">Bank Name</label>
                                    <div class="adm-input-wrap">
                                        <i class="fa-solid fa-building-columns adm-input-wrap__icon" aria-hidden="true"></i>
                                        <asp:TextBox ID="txtdepositbankedit" runat="server" CssClass="form-control" placeholder="Bank name" />
                                    </div>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtifsccodeedit.ClientID %>">IFSC Code</label>
                                    <div class="adm-input-wrap">
                                        <i class="fa-solid fa-barcode adm-input-wrap__icon" aria-hidden="true"></i>
                                        <asp:TextBox ID="txtifsccodeedit" runat="server" CssClass="form-control" placeholder="IFSC code" />
                                    </div>
                                </div>
                                <div class="adm-field adm-form-grid--full adm-upload-field">
                                    <label class="adm-field-label">QR Code Image</label>
                                    <div class="adm-upload-layout">
                                        <div class="adm-upload-preview" id="qrPreviewEdit">
                                            <asp:Image ID="ImageButton1" runat="server" CssClass="adm-upload-preview__img" />
                                            <div class="adm-upload-preview__placeholder">
                                                <i class="fa-solid fa-qrcode" aria-hidden="true"></i>
                                                <span>Current QR image</span>
                                            </div>
                                        </div>
                                        <div class="adm-upload-dropzone" data-preview="qrPreviewEdit" data-filename="qrFilenameEdit">
                                            <div class="adm-upload-dropzone__icon">
                                                <i class="fa-solid fa-cloud-arrow-up" aria-hidden="true"></i>
                                            </div>
                                            <p class="adm-upload-dropzone__title">Upload new QR image</p>
                                            <p class="adm-upload-dropzone__hint">Leave empty to keep existing image</p>
                                            <span class="adm-upload-dropzone__filename" id="qrFilenameEdit">No file chosen</span>
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="adm-upload-input" accept="image/*" />
                                            <span class="btn btn-outline-secondary btn-sm adm-upload-browse">Browse files</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
            <asp:PostBackTrigger ControlID="btnUpdate" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
    <script src="js/adm-bank-upload.js"></script>
</asp:Content>
