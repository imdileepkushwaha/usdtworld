(function () {
    'use strict';

    var MOBILE_MQ = window.matchMedia('(max-width: 1199px)');

    function isMobile() {
        return MOBILE_MQ.matches;
    }

    function isMemberPanel() {
        return document.body.classList.contains('sv-member-panel');
    }

    function getSidebar() {
        return document.querySelector('body.sv-member-panel .sidebar');
    }

    function getBackdrop() {
        return document.getElementById('svSidebarBackdrop');
    }

    function closeNav() {
        if (!isMemberPanel()) {
            return;
        }
        document.body.classList.remove('sv-mobile-nav-open', 'overlay-active');
        var sidebar = getSidebar();
        if (sidebar) {
            sidebar.classList.remove('sidebar-open');
        }
        var backdrop = getBackdrop();
        if (backdrop) {
            backdrop.setAttribute('aria-hidden', 'true');
        }
    }

    function openNav() {
        if (!isMemberPanel() || !isMobile()) {
            return;
        }
        document.body.classList.add('sv-mobile-nav-open', 'overlay-active');
        var sidebar = getSidebar();
        if (sidebar) {
            sidebar.classList.add('sidebar-open');
        }
        var backdrop = getBackdrop();
        if (backdrop) {
            backdrop.setAttribute('aria-hidden', 'false');
        }
    }

    function toggleNav() {
        if (document.body.classList.contains('sv-mobile-nav-open')) {
            closeNav();
        } else {
            openNav();
        }
    }

    function stripLegacyHandlers() {
        if (!window.jQuery) {
            return;
        }
        window.jQuery('.sidebar-mobile-toggle, .sidebar-close-btn').off('click');
    }

    function bindOnce(el, eventName, handler) {
        if (!el || el.getAttribute('data-sv-sidebar-bound') === '1') {
            return;
        }
        el.setAttribute('data-sv-sidebar-bound', '1');
        el.addEventListener(eventName, handler, true);
    }

    function initUserSidebar() {
        if (!isMemberPanel()) {
            return;
        }

        stripLegacyHandlers();
        closeNav();

        document.querySelectorAll('body.sv-member-panel .sidebar-mobile-toggle').forEach(function (btn) {
            bindOnce(btn, 'click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                e.stopImmediatePropagation();
                if (isMobile()) {
                    toggleNav();
                }
            });
        });

        document.querySelectorAll('body.sv-member-panel .sidebar-close-btn').forEach(function (btn) {
            bindOnce(btn, 'click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                e.stopImmediatePropagation();
                closeNav();
            });
        });

        var backdrop = getBackdrop();
        if (backdrop && backdrop.getAttribute('data-sv-sidebar-bound') !== '1') {
            backdrop.setAttribute('data-sv-sidebar-bound', '1');
            backdrop.addEventListener('click', function (e) {
                e.preventDefault();
                closeNav();
            });
        }

        var menu = document.getElementById('sidebar-menu');
        if (menu && menu.getAttribute('data-sv-sidebar-bound') !== '1') {
            menu.setAttribute('data-sv-sidebar-bound', '1');
            menu.addEventListener('click', function (e) {
                var link = e.target.closest('a');
                if (!link) {
                    return;
                }
                var href = (link.getAttribute('href') || '').trim();
                if (!href || href === '#' || /^javascript:/i.test(href)) {
                    return;
                }
                if (isMobile()) {
                    closeNav();
                }
            });
        }

        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape' && document.body.classList.contains('sv-mobile-nav-open')) {
                closeNav();
            }
        });

        if (!MOBILE_MQ._svBound) {
            MOBILE_MQ._svBound = true;
            MOBILE_MQ.addEventListener('change', function () {
                if (!isMobile()) {
                    closeNav();
                }
            });
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initUserSidebar);
    } else {
        initUserSidebar();
    }

    if (typeof Sys !== 'undefined' && Sys.Application) {
        Sys.Application.add_load(initUserSidebar);
    }
})();
