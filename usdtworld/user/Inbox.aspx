<%@ Page Title="Inbox" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Associate_Details" %>

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
                    <i class="fa-solid fa-inbox"></i>
                </div>
                <div class="sv-dash-header__text">
                    <span class="sv-dash-header__eyebrow">
                        <span class="sv-dash-header__pulse"></span>
                        Customer Care
                    </span>
                    <h1>Inbox</h1>
                    <p>Messages received from support and admin</p>
                </div>
            </div>

            <div class="sv-dash-header__actions">
                <a href="NewMessage.aspx" class="sv-dash-breadcrumb">
                    <i class="fa-solid fa-pen-to-square"></i>
                    Compose
                </a>
            </div>
        </div>

        <nav class="sv-msg-tabs" aria-label="Message sections">
            <a href="NewMessage.aspx" class="sv-msg-tabs__item">
                <i class="fa-solid fa-pen-to-square"></i> Compose
            </a>
            <a href="Inbox.aspx" class="sv-msg-tabs__item sv-msg-tabs__item--active">
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

        <asp:Panel ID="pnllist" runat="server" Visible="false">
            <div class="sv-panel">
                <div class="sv-panel__head">
                    <h6><i class="fa-solid fa-envelope" style="margin-right:8px;color:#67e8f9;"></i>Received Messages</h6>
                    <span>Inbox</span>
                </div>
                <div class="sv-panel__body">
                    <div class="sv-msg-table-wrap">
                        <div class="sv-msg-table-scroll">
                        <asp:GridView ID="GridView1" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" GridLines="None">
                            <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="From">
                                    <ItemTemplate>
                                        <span class="sv-msg-from"><%# Eval("FromId") %></span>
                                        <asp:Label ID="lblfromid" runat="server" Visible="false" Text='<%# Eval("FromId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject">
                                    <ItemTemplate>
                                        <span class="sv-msg-title"><%# Eval("MessageTitle") %></span>
                                        <asp:Label ID="lblmessagetitle" runat="server" Visible="false" Text='<%# Eval("MessageTitle") %>'></asp:Label>
                                        <asp:Label ID="lblmessagedescription" Visible="false" runat="server" Text='<%# Eval("MessageDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <span class="sv-msg-date"><%# Eval("mentiondate", "{0:dd/MM/yyyy hh:mm tt}") %></span>
                                        <asp:Label ID="lbldate" runat="server" Visible="false" Text='<%# Eval("mentiondate", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="File">
                                    <ItemStyle CssClass="sv-msg-col-file" />
                                    <HeaderStyle CssClass="sv-msg-col-file" />
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" ToolTip="Download Attachment" NavigateUrl='<%# Eval("Attachment", "~/ProductImage/{0}") %>' />
                                        <asp:Label Visible="false" ID="lblHyperLink" runat="server" Text='<%# Eval("Attachment") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnview" CommandName="ledger" OnClick="btnview_click" runat="server" CssClass="sv-msg-action">
                                            <i class="fa-solid fa-eye"></i> View
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </div>
                    </div>

                    <div class="sv-msg-pager">
                        <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                        <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Prev</asp:LinkButton>
                        <asp:ListView ID="ListPaging" runat="server" OnItemCommand="ListView2_ItemCommand" OnItemDataBound="ListView2_ItemDataBound">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>' CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:LinkButton ID="lbtnNext" runat="server" CausesValidation="false" OnClick="lbtnNext_Click">Next</asp:LinkButton>
                        <asp:LinkButton ID="lbtnLast" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton>
                        <asp:Label ID="lblPageInfo" runat="server" CssClass="sv-msg-pager__info"></asp:Label>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="sv-msg-empty">
            <i class="fa-solid fa-inbox"></i>
            <h4>No messages in inbox</h4>
            <p>You have not received any messages yet. Compose a new message to contact support.</p>
            <a href="NewMessage.aspx" class="sv-msg-btn sv-msg-btn--primary">Compose Message</a>
        </asp:Panel>

        <asp:Button ID="btnYes" runat="server" Text="Yes!" Style="display: none;" />

        <asp:Panel ID="pnlModal" Visible="false" runat="server" CssClass="sv-msg-modal">
            <div class="sv-msg-modal__glow"></div>
            <div class="sv-msg-modal__accent"></div>

            <div class="sv-msg-modal__head">
                <div class="sv-msg-modal__head-main">
                    <span class="sv-msg-modal__icon"><i class="fa-solid fa-envelope-open-text"></i></span>
                    <div>
                        <span class="sv-msg-modal__eyebrow">Customer Care</span>
                        <h3>Message Detail</h3>
                    </div>
                </div>
                <asp:Button ID="btnClose" CssClass="sv-msg-modal__close" runat="server" Text="×" ToolTip="Close" />
            </div>

            <div class="sv-msg-modal__body">
                <div class="sv-msg-detail">
                    <div class="sv-msg-detail__item">
                        <span class="sv-msg-detail__icon"><i class="fa-solid fa-user"></i></span>
                        <div class="sv-msg-detail__content">
                            <span class="sv-msg-detail__label">From</span>
                            <span class="sv-msg-detail__value"><asp:Label ID="lblfromid" runat="server"></asp:Label></span>
                        </div>
                    </div>
                    <div class="sv-msg-detail__item">
                        <span class="sv-msg-detail__icon"><i class="fa-solid fa-tag"></i></span>
                        <div class="sv-msg-detail__content">
                            <span class="sv-msg-detail__label">Subject</span>
                            <span class="sv-msg-detail__value sv-msg-detail__value--title"><asp:Label ID="lbltitle" runat="server"></asp:Label></span>
                        </div>
                    </div>
                    <div class="sv-msg-detail__item sv-msg-detail__item--message">
                        <span class="sv-msg-detail__icon"><i class="fa-solid fa-align-left"></i></span>
                        <div class="sv-msg-detail__content">
                            <span class="sv-msg-detail__label">Message</span>
                            <div class="sv-msg-detail__message-box">
                                <asp:Label ID="lbldescription" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="sv-msg-detail__item">
                        <span class="sv-msg-detail__icon"><i class="fa-solid fa-calendar-days"></i></span>
                        <div class="sv-msg-detail__content">
                            <span class="sv-msg-detail__label">Date</span>
                            <span class="sv-msg-detail__value"><asp:Label ID="lbldate" runat="server"></asp:Label></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="sv-msg-modal__foot">
                <asp:Button ID="btnCloseFoot" CssClass="sv-msg-btn sv-msg-btn--primary sv-msg-modal__done" runat="server" Text="Got it" OnClientClick="$find('<%= pnlModal_ModalPopupExtender.ClientID %>').hide(); return false;" />
            </div>
        </asp:Panel>

        <asp:ModalPopupExtender TargetControlID="btnYes" ID="pnlModal_ModalPopupExtender"
            runat="server" Enabled="True" BackgroundCssClass="modalBackground"
            PopupControlID="pnlModal" CancelControlID="btnClose" DropShadow="false">
        </asp:ModalPopupExtender>
    </div>
</asp:Content>
