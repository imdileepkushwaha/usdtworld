(function () {
    var POLL_MS = 12000;
    var TOAST_MS = 6000;

    var state = {
        initialized: false,
        lastNotifiedId: 0,
        timer: null,
        toastWrap: null
    };

    function getJq() { return window.jQuery || window.$; }

    function escHtml(text) {
        return String(text || '')
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;');
    }

    function loadLastNotifiedId() {
        var raw = sessionStorage.getItem('sv_chat_last_notified_id');
        state.lastNotifiedId = raw ? parseInt(raw, 10) || 0 : 0;
    }

    function saveLastNotifiedId(id) {
        state.lastNotifiedId = id || 0;
        sessionStorage.setItem('sv_chat_last_notified_id', String(state.lastNotifiedId));
    }

    function postNotify(method, onSuccess) {
        var $jq = getJq();
        if (!$jq || !$jq.ajax) return;

        $jq.ajax({
            type: 'POST',
            url: 'LiveChat.aspx/' + method,
            data: '{}',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (res) {
                var payload = res && res.d ? res.d : res;
                if (onSuccess) onSuccess(payload || {});
            }
        });
    }

    function updateBadges(count) {
        var n = count > 0 ? (count > 99 ? '99+' : String(count)) : '';
        var menuBadge = document.getElementById('svLiveChatMenuBadge');
        var navBadge = document.getElementById('svChatNavBadge');
        var fabBadge = document.getElementById('svDashChatFabBadge');
        var fab = document.getElementById('svDashChatFab');

        [menuBadge, navBadge].forEach(function (el) {
            if (!el) return;
            if (n) {
                el.textContent = n;
                el.classList.add('is-visible');
            } else {
                el.textContent = '';
                el.classList.remove('is-visible');
            }
        });

        if (fabBadge && fab) {
            if (n) {
                fabBadge.textContent = n;
                fabBadge.classList.add('is-visible');
                fab.classList.add('has-unread');
            } else {
                fabBadge.textContent = '';
                fabBadge.classList.remove('is-visible');
                fab.classList.remove('has-unread');
            }
        }
    }

    function shouldSuppressToast(peerId) {
        if (!peerId) return false;
        if (window.SvLiveChat && typeof window.SvLiveChat.isViewingPeer === 'function') {
            return window.SvLiveChat.isViewingPeer(peerId);
        }
        return false;
    }

    function ensureToastWrap() {
        if (state.toastWrap) return state.toastWrap;
        var wrap = document.createElement('div');
        wrap.className = 'sv-chat-toast-wrap';
        wrap.id = 'svChatToastWrap';
        wrap.setAttribute('aria-live', 'polite');
        document.body.appendChild(wrap);
        state.toastWrap = wrap;
        return wrap;
    }

    function showToast(data) {
        var wrap = ensureToastWrap();
        var peerId = data.latestPeerId || '';
        var title = data.latestSenderName || 'New message';
        var preview = data.latestPreview || 'You have a new chat message';
        var time = data.latestSentDate || 'Just now';

        var toast = document.createElement('div');
        toast.className = 'sv-chat-toast';
        toast.innerHTML =
            '<div class="sv-chat-toast__icon"><i class="fa-solid fa-comment-dots"></i></div>' +
            '<div class="sv-chat-toast__body">' +
                '<p class="sv-chat-toast__title">' + escHtml(title) + '</p>' +
                '<p class="sv-chat-toast__text">' + escHtml(preview) + '</p>' +
                '<span class="sv-chat-toast__time">' + escHtml(time) + '</span>' +
            '</div>' +
            '<button type="button" class="sv-chat-toast__close" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>';

        function openChat() {
            var url = 'LiveChat.aspx' + (peerId ? '?peer=' + encodeURIComponent(peerId) : '');
            window.location.href = url;
        }

        function removeToast() {
            toast.classList.add('is-leaving');
            setTimeout(function () {
                if (toast.parentNode) toast.parentNode.removeChild(toast);
            }, 280);
        }

        toast.addEventListener('click', function (e) {
            if (e.target.closest('.sv-chat-toast__close')) {
                e.stopPropagation();
                removeToast();
                return;
            }
            openChat();
        });

        wrap.appendChild(toast);

        while (wrap.children.length > 3) {
            wrap.removeChild(wrap.firstChild);
        }

        setTimeout(removeToast, TOAST_MS);

        if (document.hidden && window.Notification && Notification.permission === 'granted') {
            try {
                var n = new Notification(title, {
                    body: preview,
                    icon: 'img/usdt.png'
                });
                n.onclick = function () {
                    window.focus();
                    openChat();
                };
            } catch (e) { /* ignore */ }
        }
    }

    function requestBrowserPermission() {
        if (!window.Notification || Notification.permission !== 'default') return;
        try {
            Notification.requestPermission();
        } catch (e) { /* ignore */ }
    }

    function handleNotificationResponse(res) {
        if (!res || !res.success) return;

        var totalUnread = res.totalUnread || 0;
        var latestId = res.latestUnreadId || 0;

        updateBadges(totalUnread);

        if (!state.initialized) {
            saveLastNotifiedId(latestId);
            state.initialized = true;
            return;
        }

        if (latestId > state.lastNotifiedId && totalUnread > 0) {
            if (!shouldSuppressToast(res.latestPeerId)) {
                showToast(res);
            }
            saveLastNotifiedId(latestId);
        } else if (latestId > 0 && latestId > state.lastNotifiedId) {
            saveLastNotifiedId(latestId);
        }
    }

    function pollNotifications() {
        postNotify('GetChatNotifications', handleNotificationResponse);
    }

    function startPolling() {
        stopPolling();
        pollNotifications();
        state.timer = window.setInterval(pollNotifications, POLL_MS);
    }

    function stopPolling() {
        if (state.timer) {
            window.clearInterval(state.timer);
            state.timer = null;
        }
    }

    function init() {
        loadLastNotifiedId();
        startPolling();

        document.addEventListener('click', function once() {
            requestBrowserPermission();
            document.removeEventListener('click', once);
        }, { once: true });
    }

    window.SvChatNotify = {
        refresh: pollNotifications,
        updateBadges: updateBadges
    };

    window.addEventListener('beforeunload', stopPolling);

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
