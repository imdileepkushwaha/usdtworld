(function () {
    var state = {
        peerId: '',
        peerName: '',
        peerMobile: '',
        peerActive: false,
        lastMessageId: 0,
        pollTimer: null,
        sending: false
    };

    var MAX_FILE_SIZE = 2 * 1024 * 1024;
    var ALLOWED_EXT = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.webp', '.pdf', '.doc', '.docx', '.txt'];
    var initialized = false;

    function byId(id) { return document.getElementById(id); }

    function getJq() { return window.jQuery || window.$; }

    function escHtml(text) {
        return String(text || '')
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;');
    }

    function initials(name) {
        var parts = String(name || '?').trim().split(/\s+/);
        if (!parts.length) return '?';
        if (parts.length === 1) return parts[0].charAt(0).toUpperCase();
        return (parts[0].charAt(0) + parts[1].charAt(0)).toUpperCase();
    }

    function shortTime(dateStr) {
        if (!dateStr) return '';
        var parts = dateStr.split(' ');
        return parts.length >= 2 ? parts[1] + ' ' + (parts[2] || '') : dateStr;
    }

    function postWebMethod(method, data, onSuccess, onError) {
        var $jq = getJq();
        if (!$jq || !$jq.ajax) {
            var msg = 'Page is still loading. Please wait and try again.';
            if (onError) onError(msg);
            else alert(msg);
            return;
        }

        $jq.ajax({
            type: 'POST',
            url: 'LiveChat.aspx/' + method,
            data: JSON.stringify(data || {}),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (res) {
                var payload = res && res.d ? res.d : res;
                if (onSuccess) onSuccess(payload || {});
            },
            error: function (xhr) {
                var msg = 'Request failed. Please try again.';
                if (xhr && xhr.responseText) {
                    try {
                        var parsed = JSON.parse(xhr.responseText);
                        if (parsed && parsed.Message) msg = parsed.Message;
                    } catch (e) { /* ignore */ }
                }
                if (onError) onError(msg);
            }
        });
    }

    function showSearchResult(html, typeClass) {
        var box = byId('searchResultBox');
        if (!box) return;
        box.className = 'sv-livechat-search-result is-visible ' + (typeClass || '');
        box.innerHTML = html;
    }

    function hideSearchResult() {
        var box = byId('searchResultBox');
        if (!box) return;
        box.className = 'sv-livechat-search-result';
        box.innerHTML = '';
    }

    function renderSearchResult(res) {
        if (!res) return;

        if (res.resultType === 'found' && res.user) {
            showSearchResult(
                '<div class="sv-livechat-search-result__row">' +
                    '<div class="sv-livechat-search-result__meta">' +
                        '<strong>' + escHtml(res.user.userName) + '</strong>' +
                        '<span>' + escHtml(res.user.mobile) + ' · ' + escHtml(res.user.userId) + '</span>' +
                    '</div>' +
                    '<button type="button" data-peer-id="' + escHtml(res.user.userId) + '" class="js-start-chat">Start Chat</button>' +
                '</div>',
                'sv-livechat-search-result--found'
            );
            return;
        }

        if (res.resultType === 'inactive' && res.user) {
            showSearchResult(
                '<div class="sv-livechat-search-result__meta">' +
                    '<strong>' + escHtml(res.user.userName) + ' — Not Active</strong>' +
                    '<span>' + escHtml(res.user.mobile) + ' · This member cannot receive messages right now.</span>' +
                '</div>',
                'sv-livechat-search-result--inactive'
            );
            return;
        }

        if (res.resultType === 'not_found') {
            showSearchResult(
                '<div class="sv-livechat-search-result__meta"><strong>No data found</strong><span>' + escHtml(res.message || 'No member exists with this mobile number.') + '</span></div>',
                'sv-livechat-search-result--notfound'
            );
            return;
        }

        showSearchResult(
            '<div class="sv-livechat-search-result__meta"><strong>Error</strong><span>' + escHtml(res.message || 'Search failed.') + '</span></div>',
            'sv-livechat-search-result--error'
        );
    }

    function renderConversations(items, activePeerId) {
        var list = byId('conversationList');
        if (!list) return;

        if (!items || !items.length) {
            list.innerHTML =
                '<div class="sv-livechat-list__empty">' +
                    '<i class="fa-solid fa-inbox"></i>' +
                    'No conversations yet. Search a mobile number to start chatting.' +
                '</div>';
            return;
        }

        var html = '';
        for (var i = 0; i < items.length; i++) {
            var c = items[i];
            var activeClass = (activePeerId && c.peerId === activePeerId) ? ' is-active' : '';
            var unreadClass = c.unreadCount > 0 ? ' has-unread' : '';
            var statusClass = (c.status || '').toLowerCase() === 'active' ? ' is-online' : '';
            var badge = c.unreadCount > 0
                ? '<span class="sv-livechat-item__badge">' + (c.unreadCount > 99 ? '99+' : c.unreadCount) + '</span>'
                : '';
            html +=
                '<button type="button" class="sv-livechat-item' + activeClass + unreadClass + '" data-peer-id="' + escHtml(c.peerId) + '">' +
                    '<div class="sv-livechat-item__avatar-wrap">' +
                        '<div class="sv-livechat-item__avatar' + statusClass + '">' + escHtml(initials(c.userName)) + '</div>' +
                    '</div>' +
                    '<div class="sv-livechat-item__body">' +
                        '<div class="sv-livechat-item__top">' +
                            '<span class="sv-livechat-item__name">' + escHtml(c.userName) + '</span>' +
                            '<span class="sv-livechat-item__meta">' +
                                '<span class="sv-livechat-item__time">' + escHtml(shortTime(c.lastDate)) + '</span>' +
                                badge +
                            '</span>' +
                        '</div>' +
                        '<div class="sv-livechat-item__mobile">' +
                            '<i class="fa-solid fa-phone" aria-hidden="true"></i>' +
                            '<span>' + escHtml(c.mobile) + '</span>' +
                        '</div>' +
                        '<div class="sv-livechat-item__preview">' + escHtml(c.lastMessage || 'No messages yet') + '</div>' +
                    '</div>' +
                '</button>';
        }
        list.innerHTML = html;
    }

    function loadConversations(selectPeerId) {
        postWebMethod('GetConversations', {}, function (res) {
            if (!res.success) return;
            renderConversations(res.conversations || [], selectPeerId);
            if (selectPeerId) {
                highlightConversation(selectPeerId);
            }
        });
    }

    function highlightConversation(peerId) {
        var items = document.querySelectorAll('.sv-livechat-item');
        for (var i = 0; i < items.length; i++) {
            items[i].classList.toggle('is-active', items[i].getAttribute('data-peer-id') === peerId);
        }
    }

    function showEmptyChat() {
        byId('chatHeader').style.display = 'none';
        byId('chatMessages').style.display = 'none';
        byId('chatCompose').style.display = 'none';
        byId('chatEmptyState').style.display = 'flex';
        byId('txtChatMessage').disabled = true;
        byId('btnSendMessage').disabled = true;
        if (byId('btnAttachFile')) byId('btnAttachFile').disabled = true;
        clearAttachmentSelection();
    }

    function showChatPanel(peer, canChat) {
        byId('chatEmptyState').style.display = 'none';
        byId('chatHeader').style.display = 'flex';
        byId('chatMessages').style.display = 'flex';
        byId('chatCompose').style.display = 'block';

        byId('chatPeerAvatar').textContent = initials(peer.userName);
        byId('chatPeerName').textContent = peer.userName || peer.userId;
        byId('chatPeerMobile').textContent = (peer.mobile || '—') + ' · ID: ' + (peer.userId || '');

        var statusEl = byId('chatPeerStatus');
        if (peer.isActive) {
            statusEl.className = 'sv-livechat-status sv-livechat-status--active';
            statusEl.innerHTML = '<span class="sv-livechat-status__dot"></span>Active';
        } else {
            statusEl.className = 'sv-livechat-status sv-livechat-status--inactive';
            statusEl.innerHTML = '<span class="sv-livechat-status__dot"></span>Not Active';
        }

        byId('txtChatMessage').disabled = !canChat;
        byId('btnSendMessage').disabled = !canChat;
        if (byId('btnAttachFile')) byId('btnAttachFile').disabled = !canChat;
        if (!canChat) clearAttachmentSelection();
    }

    function messageNodeExists(box, id) {
        if (!box || !id) return false;
        return !!box.querySelector('[data-msg-id="' + id + '"]');
    }

    function getFileExtension(name) {
        var idx = String(name || '').lastIndexOf('.');
        return idx >= 0 ? String(name).slice(idx).toLowerCase() : '';
    }

    function isAllowedFile(file) {
        if (!file) return false;
        return ALLOWED_EXT.indexOf(getFileExtension(file.name)) >= 0;
    }

    function formatFileSize(bytes) {
        if (bytes < 1024) return bytes + ' B';
        if (bytes < 1024 * 1024) return (bytes / 1024).toFixed(1) + ' KB';
        return (bytes / (1024 * 1024)).toFixed(2) + ' MB';
    }

    function clearAttachmentSelection() {
        var fileInput = byId('fileChatAttachment');
        var preview = byId('attachmentPreview');
        if (fileInput) fileInput.value = '';
        if (preview) preview.style.display = 'none';
    }

    function showAttachmentPreview(file) {
        var preview = byId('attachmentPreview');
        var nameEl = byId('attachmentPreviewName');
        if (!preview || !nameEl || !file) return;
        nameEl.textContent = file.name + ' (' + formatFileSize(file.size) + ')';
        preview.style.display = 'flex';
    }

    function buildAttachmentHtml(m) {
        if (!m.attachmentUrl) return '';

        if (m.isImage) {
            return '<a href="' + escHtml(m.attachmentUrl) + '" target="_blank" rel="noopener" class="sv-livechat-attach sv-livechat-attach--image">' +
                '<img src="' + escHtml(m.attachmentUrl) + '" alt="' + escHtml(m.attachmentName || 'Image') + '" />' +
            '</a>';
        }

        var icon = 'fa-file';
        if (m.attachmentType === 'pdf') icon = 'fa-file-pdf';
        else if (m.attachmentType === 'doc') icon = 'fa-file-word';
        else if (m.attachmentType === 'txt') icon = 'fa-file-lines';

        return '<a href="' + escHtml(m.attachmentUrl) + '" target="_blank" rel="noopener" class="sv-livechat-attach sv-livechat-attach--file">' +
            '<i class="fa-solid ' + icon + '"></i>' +
            '<span>' + escHtml(m.attachmentName || 'Download file') + '</span>' +
        '</a>';
    }

    function buildMessageHtml(m) {
        var cls = m.isMine ? 'sv-livechat-bubble sv-livechat-bubble--mine' : 'sv-livechat-bubble sv-livechat-bubble--theirs';
        var body = '';
        if (m.messageText) {
            body += '<div class="sv-livechat-bubble__text">' + escHtml(m.messageText) + '</div>';
        }
        body += buildAttachmentHtml(m);
        if (!body) body = '<div class="sv-livechat-bubble__text">Attachment</div>';

        return '<div class="' + cls + '" data-msg-id="' + m.id + '">' +
            body +
            '<span class="sv-livechat-bubble__time">' + escHtml(m.sentDate) + '</span>' +
        '</div>';
    }

    function appendMessage(m) {
        var box = byId('chatMessages');
        if (!box || !m || messageNodeExists(box, m.id)) return;

        if (m.id > state.lastMessageId) state.lastMessageId = m.id;

        var empty = box.querySelector('.sv-livechat-list__empty');
        if (empty) empty.remove();

        box.insertAdjacentHTML('beforeend', buildMessageHtml(m));
        box.scrollTop = box.scrollHeight;
    }
    function renderMessages(messages, appendOnly) {
        var box = byId('chatMessages');
        if (!box) return;

        if (!messages || !messages.length) {
            if (!appendOnly) {
                box.innerHTML = '<div class="sv-livechat-list__empty" style="margin:auto;"><i class="fa-solid fa-handshake"></i>Say hello to start the conversation.</div>';
            }
            return;
        }

        if (appendOnly) {
            for (var j = 0; j < messages.length; j++) {
                appendMessage(messages[j]);
            }
            return;
        }

        var html = '';
        for (var i = 0; i < messages.length; i++) {
            var m = messages[i];
            if (m.id > state.lastMessageId) state.lastMessageId = m.id;
            html += buildMessageHtml(m);
        }

        box.innerHTML = html;
        box.scrollTop = box.scrollHeight;
    }

    function openChat(peerId) {
        if (!peerId) return;

        state.peerId = peerId;
        state.lastMessageId = 0;
        highlightConversation(peerId);
        byId('chatMessages').innerHTML = '';

        postWebMethod('GetMessages', { peerUserId: peerId, afterId: 0 }, function (res) {
            if (!res.success) {
                alert(res.message || 'Unable to open chat.');
                return;
            }

            state.peerName = res.peer ? res.peer.userName : '';
            state.peerMobile = res.peer ? res.peer.mobile : '';
            state.peerActive = res.peer ? !!res.peer.isActive : false;

            showChatPanel(res.peer || { userId: peerId, isActive: false }, state.peerActive);
            renderMessages(res.messages || [], false);
            if (state.peerActive) {
                startPolling();
            } else {
                stopPolling();
            }
            loadConversations(peerId);
        });
    }

    function pollMessages() {
        if (!state.peerId || !state.peerActive) return;

        postWebMethod('GetMessages', { peerUserId: state.peerId, afterId: state.lastMessageId }, function (res) {
            if (!res.success) return;
            if (res.messages && res.messages.length) {
                renderMessages(res.messages, true);
                loadConversations(state.peerId);
                if (window.SvChatNotify && typeof window.SvChatNotify.refresh === 'function') {
                    window.SvChatNotify.refresh();
                }
            }
        });
    }

    function startPolling() {
        stopPolling();
        state.pollTimer = window.setInterval(pollMessages, 5000);
    }

    function stopPolling() {
        if (state.pollTimer) {
            window.clearInterval(state.pollTimer);
            state.pollTimer = null;
        }
    }

    function searchMobile() {
        var input = byId('txtSearchMobile');
        var mobile = input ? input.value.trim() : '';
        if (!mobile) {
            showSearchResult(
                '<div class="sv-livechat-search-result__meta"><strong>Enter mobile number</strong><span>Type a mobile number to search.</span></div>',
                'sv-livechat-search-result--error'
            );
            return;
        }

        postWebMethod('SearchByMobile', { mobile: mobile }, function (res) {
            renderSearchResult(res);
        }, function (err) {
            showSearchResult(
                '<div class="sv-livechat-search-result__meta"><strong>Error</strong><span>' + escHtml(err) + '</span></div>',
                'sv-livechat-search-result--error'
            );
        });
    }

    function mapSendResponseToMessage(res, textToSend) {
        return {
            id: res.messageId,
            messageText: textToSend || '',
            sentDate: res.sentDate,
            isMine: true,
            attachment: res.attachment || '',
            attachmentUrl: res.attachmentUrl || '',
            attachmentName: res.attachmentName || '',
            attachmentType: res.attachmentType || '',
            isImage: !!res.isImage
        };
    }

    function finishSendState(input, btnSend, btnAttach) {
        state.sending = false;
        if (input) input.disabled = !state.peerActive;
        if (btnSend) btnSend.disabled = !state.peerActive;
        if (btnAttach) btnAttach.disabled = !state.peerActive;
    }

    function handleAttachmentSendResult(res, textToSend, input) {
        if (!res) {
            if (input) input.value = textToSend;
            alert('Upload failed. Please try again.');
            return;
        }

        if (res.resultType === 'inactive') {
            state.peerActive = false;
            if (input) input.disabled = true;
            if (byId('btnAttachFile')) byId('btnAttachFile').disabled = true;
            alert('This member is not active.');
            return;
        }

        if (!res.success) {
            if (input) input.value = textToSend;
            alert(res.message || 'Attachment not sent.');
            return;
        }

        appendMessage(mapSendResponseToMessage(res, textToSend));
        loadConversations(state.peerId);
        if (window.SvChatNotify && typeof window.SvChatNotify.refresh === 'function') {
            window.SvChatNotify.refresh();
        }
    }

    function sendWithAttachment(file, textToSend) {
        var input = byId('txtChatMessage');
        var btnSend = byId('btnSendMessage');
        var btnAttach = byId('btnAttachFile');

        state.sending = true;
        if (input) {
            input.disabled = true;
            input.value = '';
        }
        if (btnSend) btnSend.disabled = true;
        if (btnAttach) btnAttach.disabled = true;

        var reader = new FileReader();
        reader.onload = function () {
            var result = reader.result || '';
            var base64 = result.indexOf(',') >= 0 ? result.split(',')[1] : result;

            postWebMethod('SendMessageWithAttachment', {
                peerUserId: state.peerId,
                messageText: textToSend || '',
                fileName: file.name,
                fileData: base64
            }, function (res) {
                finishSendState(input, btnSend, btnAttach);
                clearAttachmentSelection();
                handleAttachmentSendResult(res, textToSend, input);
            }, function (err) {
                finishSendState(input, btnSend, btnAttach);
                if (input) input.value = textToSend;
                alert(err);
            });
        };
        reader.onerror = function () {
            state.sending = false;
            finishSendState(input, btnSend, btnAttach);
            alert('Unable to read the selected file.');
        };
        reader.readAsDataURL(file);
    }

    function sendMessage() {
        if (state.sending || !state.peerId || !state.peerActive) return;

        var input = byId('txtChatMessage');
        var btnSend = byId('btnSendMessage');
        var btnAttach = byId('btnAttachFile');
        var fileInput = byId('fileChatAttachment');
        var file = fileInput && fileInput.files && fileInput.files[0] ? fileInput.files[0] : null;
        var text = input ? input.value.trim() : '';

        if (!text && !file) return;

        if (file) {
            if (!isAllowedFile(file)) {
                alert('Invalid file type. Allowed: images, PDF, DOC, DOCX, TXT.');
                return;
            }
            if (file.size > MAX_FILE_SIZE) {
                alert('File size must be 2 MB or less.');
                return;
            }
            sendWithAttachment(file, text);
            return;
        }

        var textToSend = text;
        state.sending = true;
        if (input) {
            input.value = '';
            input.disabled = true;
        }
        if (btnSend) btnSend.disabled = true;
        if (btnAttach) btnAttach.disabled = true;

        postWebMethod('SendMessage', { peerUserId: state.peerId, messageText: textToSend }, function (res) {
            finishSendState(input, btnSend, btnAttach);

            if (res.resultType === 'inactive') {
                state.peerActive = false;
                if (input) input.disabled = true;
                if (btnAttach) btnAttach.disabled = true;
                alert('This member is not active.');
                return;
            }

            if (!res.success) {
                if (input && !input.value) input.value = textToSend;
                alert(res.message || 'Message not sent.');
                return;
            }

            appendMessage(mapSendResponseToMessage(res, textToSend));
            loadConversations(state.peerId);
            if (window.SvChatNotify && typeof window.SvChatNotify.refresh === 'function') {
                window.SvChatNotify.refresh();
            }
        }, function (err) {
            finishSendState(input, btnSend, btnAttach);
            if (input) {
                if (!input.value) input.value = textToSend;
            }
            alert(err);
        });
    }

    function getQueryPeer() {
        var match = /[?&]peer=([^&]+)/i.exec(window.location.search || '');
        return match ? decodeURIComponent(match[1].replace(/\+/g, ' ')) : '';
    }

    function bindEvents() {
        var btnSearch = byId('btnSearchMobile');
        var btnSend = byId('btnSendMessage');
        var btnAttach = byId('btnAttachFile');
        var btnRemoveAttachment = byId('btnRemoveAttachment');
        var fileInput = byId('fileChatAttachment');
        var txtSearch = byId('txtSearchMobile');
        var txtMessage = byId('txtChatMessage');

        if (btnSearch) btnSearch.addEventListener('click', searchMobile);

        if (btnAttach && fileInput) {
            btnAttach.addEventListener('click', function () {
                if (!state.peerActive || state.sending) return;
                fileInput.click();
            });
        }

        if (fileInput) {
            fileInput.addEventListener('change', function () {
                var file = fileInput.files && fileInput.files[0];
                if (!file) {
                    clearAttachmentSelection();
                    return;
                }
                if (!isAllowedFile(file)) {
                    alert('Invalid file type. Allowed: images, PDF, DOC, DOCX, TXT.');
                    clearAttachmentSelection();
                    return;
                }
                if (file.size > MAX_FILE_SIZE) {
                    alert('File size must be 2 MB or less.');
                    clearAttachmentSelection();
                    return;
                }
                showAttachmentPreview(file);
            });
        }

        if (btnRemoveAttachment) {
            btnRemoveAttachment.addEventListener('click', clearAttachmentSelection);
        }

        if (txtSearch) {
            txtSearch.addEventListener('keydown', function (e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    searchMobile();
                }
            });
            txtSearch.addEventListener('input', function () {
                if (!txtSearch.value.trim()) hideSearchResult();
            });
        }

        if (btnSend) btnSend.addEventListener('click', sendMessage);

        if (txtMessage) {
            txtMessage.addEventListener('keydown', function (e) {
                if (e.key === 'Enter' && !e.shiftKey) {
                    e.preventDefault();
                    sendMessage();
                }
            });
        }

        document.addEventListener('click', function (e) {
            var startBtn = e.target.closest('.js-start-chat');
            if (startBtn) {
                openChat(startBtn.getAttribute('data-peer-id'));
                hideSearchResult();
                return;
            }

            var convBtn = e.target.closest('.sv-livechat-item');
            if (convBtn) {
                openChat(convBtn.getAttribute('data-peer-id'));
            }
        });

        window.addEventListener('beforeunload', stopPolling);
    }

    function init() {
        if (initialized) return;
        initialized = true;

        window.SvLiveChat = {
            isViewingPeer: function (peerId) {
                return !!peerId && state.peerId === peerId && state.peerActive;
            }
        };

        showEmptyChat();
        bindEvents();
        loadConversations();

        var qPeer = getQueryPeer();
        if (qPeer) {
            window.setTimeout(function () { openChat(qPeer); }, 350);
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
