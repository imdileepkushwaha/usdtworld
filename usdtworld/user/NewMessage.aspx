<%@ Page Title="New Message" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="NewMessage.aspx.cs" Inherits="Associate_Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/dashboard-page.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="sv-dashboard-page sv-messages-page">

        <div class="sv-dash-header">
            <div class="sv-dash-header__glow sv-dash-header__glow--1"></div>
            <div class="sv-dash-header__glow sv-dash-header__glow--2"></div>
            <div class="sv-dash-header__grid"></div>

            <div class="sv-dash-header__main">
                <div class="sv-dash-header__icon">
                    <i class="fa-solid fa-headset"></i>
                </div>
                <div class="sv-dash-header__text">
                    <span class="sv-dash-header__eyebrow">
                        <span class="sv-dash-header__pulse"></span>
                        Customer Care
                    </span>
                    <h1>Compose Message</h1>
                    <p>Send a support request to our admin team</p>
                </div>
            </div>

            <div class="sv-dash-header__actions">
                <a href="Dashboard.aspx" class="sv-dash-breadcrumb">
                    <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                    Dashboard
                </a>
            </div>
        </div>

        <nav class="sv-msg-tabs" aria-label="Message sections">
            <a href="NewMessage.aspx" class="sv-msg-tabs__item sv-msg-tabs__item--active">
                <i class="fa-solid fa-pen-to-square"></i> Compose
            </a>
            <a href="Inbox.aspx" class="sv-msg-tabs__item">
                <i class="fa-solid fa-inbox"></i> Inbox
            </a>
            <a href="Sentbox.aspx" class="sv-msg-tabs__item">
                <i class="fa-solid fa-paper-plane"></i> Sent
            </a>
        </nav>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="sv-dashboard-page sv-messages-page">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="sv-panel">
            <div class="sv-panel__head">
                <h6><i class="fa-solid fa-envelope-open-text" style="margin-right:8px;color:#c4b5fd;"></i>New Support Ticket</h6>
                <span>To Admin</span>
            </div>
            <div class="sv-panel__body">
                <div class="sv-msg-form">
                    <div class="row" style="display:none;">
                        <div class="col-md-6">
                            <asp:TextBox ID="txttoid" CssClass="sv-msg-input form-control" runat="server" OnTextChanged="txttoid_TextChanged" AutoPostBack="true" Text="admin"></asp:TextBox>
                            <asp:Label ID="lblUserName" runat="server" Text="User"></asp:Label>
                            <asp:Label ID="lbluserid" runat="server" Text="User"></asp:Label>
                        </div>
                    </div>

                    <div class="sv-msg-form__group">
                        <label for="<%= txtmessagetitle.ClientID %>">Subject</label>
                        <asp:TextBox ID="txtmessagetitle" CssClass="sv-msg-input form-control" runat="server" placeholder="Enter message subject"></asp:TextBox>
                    </div>

                    <div class="sv-msg-form__group">
                        <label for="<%= fupAttachment.ClientID %>">Attachment</label>
                        <asp:FileUpload ID="fupAttachment" runat="server" CssClass="sv-msg-input form-control" />
                        <span class="sv-msg-form__hint">Supported: images, PDF, DOC, XLS, TXT</span>
                    </div>

                    <div class="sv-msg-form__group">
                        <label for="<%= txtdescription.ClientID %>">Message</label>
                        <asp:TextBox ID="txtdescription" CssClass="sv-msg-input sv-msg-input--textarea form-control" TextMode="MultiLine" runat="server" placeholder="Write your message here..."></asp:TextBox>
                    </div>

                    <div class="sv-msg-form__actions">
                        <asp:Button ID="btnSubmit" CssClass="sv-msg-btn sv-msg-btn--primary" Text="Send Message" runat="server" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btncancel" CssClass="sv-msg-btn sv-msg-btn--ghost" Text="Cancel" runat="server" OnClick="btncancel_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
