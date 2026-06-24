<%@ Page Title="Inbox" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="InboxAdmin.aspx.cs" Inherits="Associate_Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/admin-dashboard-page.css" rel="stylesheet" />
    <link href="css/admin-messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="adm-msg-page">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="adm-page-head">
            <div>
                <h1 class="adm-page-head__title">Inbox</h1>
                <p class="mb-0 text-muted" style="font-size:0.85rem;">User support messages received by admin</p>
            </div>
            <ol class="adm-page-head__breadcrumb">
                <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                <li><span class="sep">/</span></li>
                <li>Customer Care</li>
                <li><span class="sep">/</span></li>
                <li class="active">Inbox</li>
            </ol>
        </div>

        <nav class="adm-msg-tabs" aria-label="Mail sections">
            <a href="InboxAdmin.aspx" class="adm-msg-tabs__item adm-msg-tabs__item--active"><i class="fa-solid fa-inbox"></i> Inbox</a>
            <a href="SentboxAdmin.aspx" class="adm-msg-tabs__item"><i class="fa-solid fa-paper-plane"></i> Sent Mail</a>
        </nav>

        <asp:Panel ID="pnllist" runat="server" Visible="false">
            <div class="adm-msg-card">
                <div class="adm-msg-card__head">
                    <div>
                        <h3><i class="fa-solid fa-envelope" style="color:#487fff;margin-right:8px;"></i>Received Messages</h3>
                        <p>User support requests and replies</p>
                    </div>
                </div>
                <div class="adm-msg-card__body">
                    <div class="adm-msg-table-wrap">
                        <div class="adm-msg-table-scroll">
                            <asp:GridView ID="GridView1" runat="server" CssClass="adm-msg-table table table-borderless" Width="100%"
                                AutoGenerateColumns="False" GridLines="None" OnRowDataBound="GridView1_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <span class="adm-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User ID">
                                        <ItemTemplate>
                                            <span class="adm-msg-user-id"><%# Eval("MentionBy") %></span>
                                            <asp:Label ID="lbluserid" runat="server" Visible="false" Text='<%# Eval("MentionBy") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <span class="adm-msg-user-name"><%# Eval("FromId") %></span>
                                            <asp:Label ID="lblfromid" runat="server" Visible="false" Text='<%# Eval("FromId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <ItemTemplate>
                                            <span class="adm-msg-title"><%# Eval("MessageTitle") %></span>
                                            <asp:Label ID="lblmessagetitle" runat="server" Visible="false" Text='<%# Eval("MessageTitle") %>'></asp:Label>
                                            <asp:Label ID="lblmessagedescription" Visible="false" runat="server" Text='<%# Eval("MessageDescription") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <span class="adm-msg-date"><%# Eval("mentiondate", "{0:dd/MM/yyyy hh:mm tt}") %></span>
                                            <asp:Label ID="lbldate" runat="server" Visible="false" Text='<%# Eval("mentiondate", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="File">
                                        <ItemStyle CssClass="text-center" />
                                        <HeaderStyle CssClass="text-center" />
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" ToolTip="Download Attachment"
                                                NavigateUrl='<%# Eval("Attachment", "~/ProductImage/{0}") %>' />
                                            <asp:Label Visible="false" ID="lblHyperLink" runat="server" Text='<%# Eval("Attachment") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemStyle CssClass="text-center" />
                                        <HeaderStyle CssClass="text-center" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnview" CommandName="ledger" OnClick="btnview_click" runat="server" CssClass="adm-msg-action">
                                                <i class="fa-solid fa-eye"></i> View
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="adm-msg-pager">
                        <asp:LinkButton ID="lbtnFirst" runat="server" CausesValidation="false" OnClick="lbtnFirst_Click">First</asp:LinkButton>
                        <asp:LinkButton ID="lbtnPrevious" runat="server" CausesValidation="false" OnClick="lbtnPrevious_Click">Prev</asp:LinkButton>
                        <asp:ListView ID="ListPaging" runat="server" OnItemCommand="ListView2_ItemCommand" OnItemDataBound="ListView2_ItemDataBound">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnPaging" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                    CommandName="Paging" Text='<%# Eval("PageText") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:LinkButton ID="lbtnNext" runat="server" CausesValidation="false" OnClick="lbtnNext_Click">Next</asp:LinkButton>
                        <asp:LinkButton ID="lbtnLast" runat="server" CausesValidation="false" OnClick="lbtnLast_Click">Last</asp:LinkButton>
                        <asp:Label ID="lblPageInfo" runat="server" CssClass="adm-msg-pager__info"></asp:Label>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="adm-msg-empty">
            <i class="fa-solid fa-inbox"></i>
            <h4>No messages in inbox</h4>
            <p>No user support messages have been received yet.</p>
        </asp:Panel>

        <asp:Button ID="btnYes" runat="server" Text="Yes!" Style="display: none;" />

        <asp:Panel ID="pnlModal" Visible="false" runat="server" CssClass="adm-msg-modal">
            <div class="adm-msg-modal__head">
                <h3><i class="fa-solid fa-envelope-open-text" style="color:#487fff;margin-right:8px;"></i>Message Detail</h3>
                <asp:LinkButton ID="btnClose" runat="server" CssClass="adm-msg-modal__close" ToolTip="Close" CausesValidation="false">
                    <i class="fa-solid fa-xmark"></i>
                </asp:LinkButton>
            </div>
            <div class="adm-msg-modal__body">
                <div class="adm-msg-detail">
                    <div class="adm-msg-detail__item">
                        <span class="adm-msg-detail__label">From</span>
                        <span class="adm-msg-detail__value"><asp:Label ID="lblfromid" runat="server"></asp:Label></span>
                    </div>
                    <div class="adm-msg-detail__item">
                        <span class="adm-msg-detail__label">Subject</span>
                        <span class="adm-msg-detail__value"><asp:Label ID="lbltitle" runat="server"></asp:Label></span>
                    </div>
                    <div class="adm-msg-detail__item">
                        <span class="adm-msg-detail__label">Message</span>
                        <span class="adm-msg-detail__value adm-msg-detail__message"><asp:Label ID="lbldescription" runat="server"></asp:Label></span>
                    </div>
                    <div class="adm-msg-detail__item">
                        <span class="adm-msg-detail__label">Date</span>
                        <span class="adm-msg-detail__value"><asp:Label ID="lbldate" runat="server"></asp:Label></span>
                    </div>
                </div>
            </div>
            <div class="adm-msg-modal__foot">
                <asp:LinkButton ID="btnCloseFoot" runat="server" CssClass="adm-msg-btn adm-msg-btn--primary" CausesValidation="false"
                    OnClientClick="$find('<%= pnlModal_ModalPopupExtender.ClientID %>').hide(); return false;">
                    <i class="fa-solid fa-check"></i> Close
                </asp:LinkButton>
            </div>
        </asp:Panel>

        <asp:ModalPopupExtender TargetControlID="btnYes" ID="pnlModal_ModalPopupExtender"
            runat="server" Enabled="True" BackgroundCssClass="modalBackground"
            PopupControlID="pnlModal" CancelControlID="btnClose" DropShadow="false">
        </asp:ModalPopupExtender>
    </div>
</asp:Content>
