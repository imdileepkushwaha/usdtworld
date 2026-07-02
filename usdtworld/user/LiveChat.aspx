<%@ Page Title="Live Chat" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="LiveChat.aspx.cs" Inherits="LiveChatPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/dashboard-page.css" rel="stylesheet" />
    <link href="css/live-chat.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <div class="sv-dashboard-page sv-livechat-page">

        <div class="sv-dash-header">
            <div class="sv-dash-header__glow sv-dash-header__glow--1"></div>
            <div class="sv-dash-header__glow sv-dash-header__glow--2"></div>
            <div class="sv-dash-header__grid"></div>

            <div class="sv-dash-header__main">
                <div class="sv-dash-header__icon">
                    <i class="fa-solid fa-comments"></i>
                </div>
                <div class="sv-dash-header__text">
                    <span class="sv-dash-header__eyebrow">
                        <span class="sv-dash-header__pulse"></span>
                        Member Connect
                    </span>
                    <h1>Live Chat</h1>
                    <p>Search by mobile number or user ID and chat in real time</p>
                </div>
            </div>

            <div class="sv-dash-header__actions">
                <span class="sv-dash-breadcrumb">
                    <i class="fa-solid fa-circle" style="color:#34d399;font-size:0.45rem;margin-right:6px;"></i>
                    Online messaging
                </span>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <div class="sv-dashboard-page sv-livechat-page">
        <asp:HiddenField ID="hdnCurrentUserId" runat="server" />
        <asp:HiddenField ID="hdnCurrentUserName" runat="server" />

        <div class="sv-livechat-shell">
            <aside class="sv-livechat-sidebar" aria-label="Chat contacts">
                <div class="sv-livechat-sidebar__head">
                    <h3>Find Member</h3>
                    <p>Search by mobile number or user ID</p>
                    <div class="sv-livechat-search">
                        <div class="sv-livechat-search__input-wrap">
                            <i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
                            <input type="text" id="txtSearchMobile" maxlength="30" placeholder="Mobile number or User ID" autocomplete="off" />
                        </div>
                        <button type="button" id="btnSearchMobile">Search</button>
                    </div>
                    <div id="searchResultBox" class="sv-livechat-search-result" role="status" aria-live="polite"></div>
                </div>

                <div class="sv-livechat-list-head">Recent Chats</div>
                <div id="conversationList" class="sv-livechat-list">
                    <div class="sv-livechat-list__empty">
                        <i class="fa-solid fa-message"></i>
                        Loading conversations...
                    </div>
                </div>
            </aside>

            <section class="sv-livechat-main" aria-label="Chat window">
                <div id="chatHeader" class="sv-livechat-main__head" style="display:none;">
                    <div class="sv-livechat-main__peer">
                        <div id="chatPeerAvatar" class="sv-livechat-main__avatar">?</div>
                        <div>
                            <h4 id="chatPeerName">Member</h4>
                            <p id="chatPeerMobile">—</p>
                        </div>
                    </div>
                    <span id="chatPeerStatus" class="sv-livechat-status sv-livechat-status--active">
                        <span class="sv-livechat-status__dot"></span>
                        Active
                    </span>
                </div>

                <div id="chatEmptyState" class="sv-livechat-empty-main">
                    <div class="sv-livechat-empty-main__icon">
                        <i class="fa-solid fa-comments"></i>
                    </div>
                    <h4>Select a conversation</h4>
                    <p>Search a member by mobile number or user ID, or pick someone from your recent chats to start messaging.</p>
                </div>

                <div id="chatMessages" class="sv-livechat-messages" style="display:none;"></div>

                <div id="chatCompose" class="sv-livechat-compose" style="display:none;">
                    <div id="attachmentPreview" class="sv-livechat-attach-preview" style="display:none;">
                        <div class="sv-livechat-attach-preview__info">
                            <i class="fa-solid fa-paperclip" aria-hidden="true"></i>
                            <span id="attachmentPreviewName">file.pdf</span>
                            <small>Max 2 MB &middot; Images, PDF, DOC, TXT</small>
                        </div>
                        <button type="button" id="btnRemoveAttachment" class="sv-livechat-attach-preview__remove" title="Remove attachment">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="sv-livechat-compose__row">
                        <button type="button" id="btnAttachFile" class="sv-livechat-compose__attach" title="Attach file" disabled>
                            <i class="fa-solid fa-paperclip"></i>
                        </button>
                        <input type="file" id="fileChatAttachment" class="sv-livechat-file-input" accept=".jpg,.jpeg,.png,.gif,.bmp,.webp,.pdf,.doc,.docx,.txt,image/*" />
                        <textarea id="txtChatMessage" rows="1" maxlength="2000" placeholder="Type your message..." disabled></textarea>
                        <button type="button" id="btnSendMessage" title="Send message" disabled>
                            <i class="fa-solid fa-paper-plane"></i>
                        </button>
                    </div>
                    <p class="sv-livechat-compose__hint">Press Enter to send. Shift+Enter for new line. Attach images, PDF or DOC up to 2 MB.</p>
                </div>
            </section>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="js/live-chat.js?v=2"></script>
</asp:Content>
