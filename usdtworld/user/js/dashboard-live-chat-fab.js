(function () {
    var STORAGE_KEY = 'sv_dash_chat_fab_hidden';

    function byId(id) { return document.getElementById(id); }

    function isHidden() {
        try {
            return sessionStorage.getItem(STORAGE_KEY) === '1';
        } catch (e) {
            return false;
        }
    }

    function hideFab() {
        var fab = byId('svDashChatFab');
        if (fab) fab.classList.add('is-hidden');
        try {
            sessionStorage.setItem(STORAGE_KEY, '1');
        } catch (e) { /* ignore */ }
    }

    function init() {
        var fab = byId('svDashChatFab');
        if (!fab) return;

        if (isHidden()) {
            fab.classList.add('is-hidden');
            return;
        }

        var closeBtn = fab.querySelector('.sv-dash-chat-fab__close');
        if (closeBtn) {
            closeBtn.addEventListener('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                hideFab();
            });
        }

        if (window.SvChatNotify && typeof window.SvChatNotify.refresh === 'function') {
            window.SvChatNotify.refresh();
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
