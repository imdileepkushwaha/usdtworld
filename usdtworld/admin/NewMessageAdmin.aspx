<%@ Page Title="Compose Mail" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="NewMessageAdmin.aspx.cs" Inherits="Associate_Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
    <link href="css/admin-messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="adm-msg-page">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="adm-page-head">
            <div>
                <h1 class="adm-page-head__title">Compose Mail</h1>
                <p class="mb-0 text-muted" style="font-size:0.85rem;">Send a message to a user from admin panel</p>
            </div>
            <ol class="adm-page-head__breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                <li><span class="sep">/</span></li>
                <li>Customer Care</li>
                <li><span class="sep">/</span></li>
                <li class="active">Compose Mail</li>
            </ol>
        </div>

        <nav class="adm-msg-tabs" aria-label="Mail sections">
            <a href="InboxAdmin.aspx" class="adm-msg-tabs__item"><i class="fa-solid fa-inbox"></i> Inbox</a>
            <a href="SentboxAdmin.aspx" class="adm-msg-tabs__item"><i class="fa-solid fa-paper-plane"></i> Sent Mail</a>
            <a href="NewMessageAdmin.aspx" class="adm-msg-tabs__item adm-msg-tabs__item--active"><i class="fa-solid fa-pen-to-square"></i> Compose</a>
        </nav>

        <div class="adm-msg-card">
            <div class="adm-msg-card__head">
                <div>
                    <h3><i class="fa-solid fa-envelope-open-text" style="color:#487fff;margin-right:8px;"></i>New Message</h3>
                    <p>Fill in the details below to send mail to a user</p>
                </div>
            </div>
            <div class="adm-msg-card__body">
                <div class="adm-msg-compose">
                    <div class="row" style="display:none;">
                        <div class="col-md-6">
                            <asp:TextBox ID="txttoid" CssClass="form-control" runat="server" OnTextChanged="txttoid_TextChanged" AutoPostBack="true" Text="IC000001"></asp:TextBox>
                            <asp:Label ID="lblUserName" runat="server" Text="User"></asp:Label>
                        </div>
                    </div>

                    <div class="adm-msg-compose__grid">
                        <div class="adm-field adm-msg-compose__field--full">
                            <label class="adm-field-label" for="<%= txtmessagetitle.ClientID %>">Subject <span class="adm-field-label__req">*</span></label>
                            <div class="adm-input-wrap">
                                <i class="fa-solid fa-heading adm-input-wrap__icon" aria-hidden="true"></i>
                                <asp:TextBox ID="txtmessagetitle" CssClass="form-control" runat="server" placeholder="Enter message subject"></asp:TextBox>
                            </div>
                        </div>

                        <div class="adm-field adm-msg-compose__field--full">
                            <label class="adm-field-label" for="<%= fupAttachment.ClientID %>">Attachment</label>
                            <div class="adm-msg-file-wrap">
                                <i class="fa-solid fa-paperclip adm-msg-file-wrap__icon" aria-hidden="true"></i>
                                <asp:FileUpload ID="fupAttachment" runat="server" CssClass="form-control adm-msg-file-input" />
                            </div>
                            <span class="adm-field-hint">Supported: BMP, GIF, PNG, JPG, DOC, DOCX, XLS, XLSX, TXT, PDF</span>
                        </div>

                        <div class="adm-field adm-msg-compose__field--full">
                            <label class="adm-field-label" for="<%= txtdescription.ClientID %>">Message <span class="adm-field-label__req">*</span></label>
                            <asp:TextBox ID="txtdescription" CssClass="form-control adm-msg-compose-textarea" TextMode="MultiLine" Rows="7" runat="server" placeholder="Write your message here..."></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="adm-msg-card__foot">
                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" Text="Send Message" runat="server" OnClick="btnSubmit_Click" />
                <asp:Button ID="btncancel" CssClass="btn btn-outline-secondary" Text="Cancel" runat="server" OnClick="btncancel_Click" />
            </div>
        </div>
    </div>
</asp:Content>
