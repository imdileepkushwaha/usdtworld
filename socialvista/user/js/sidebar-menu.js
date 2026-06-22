(function ($) {
    'use strict';

    function fileNameFromUrl(url) {
        if (!url) return '';
        var clean = String(url).split('?')[0].split('#')[0];
        var name = clean.split('/').pop() || '';
        try {
            name = decodeURIComponent(name);
        } catch (e) { /* ignore */ }
        return name.toLowerCase();
    }

    function getCurrentPage() {
        var fromBody = document.body && document.body.getAttribute('data-nav-page');
        if (fromBody) {
            return fileNameFromUrl(fromBody);
        }
        return fileNameFromUrl(window.location.pathname);
    }

    function isNavLink(anchor) {
        if (!anchor || !anchor.getAttribute) return false;
        var href = (anchor.getAttribute('href') || '').trim();
        if (!href || href === '#' || /^javascript:/i.test(href)) return false;
        return true;
    }

    function linkMatchesPage(anchor, currentPage) {
        if (!isNavLink(anchor) || !currentPage) return false;

        var linkFile = fileNameFromUrl(anchor.href);
        if (linkFile && linkFile === currentPage) return true;

        var hrefAttr = (anchor.getAttribute('href') || '').trim();
        return fileNameFromUrl(hrefAttr) === currentPage;
    }

    function initSidebarDropdown() {
        $('.sidebar-menu .dropdown').off('click.svSidebar');

        $('.sidebar-menu .dropdown > a').off('click.svSidebar').on('click.svSidebar', function (e) {
            e.preventDefault();
            e.stopPropagation();

            var $item = $(this).parent('.dropdown');
            var isOpen = $item.hasClass('dropdown-open') || $item.hasClass('open');

            $item.siblings('.dropdown').children('.sidebar-submenu').slideUp(180);
            $item.siblings('.dropdown').removeClass('dropdown-open open');

            if (isOpen) {
                $item.children('.sidebar-submenu').slideUp(180);
                $item.removeClass('dropdown-open open');
            } else {
                $item.children('.sidebar-submenu').slideDown(180);
                $item.addClass('dropdown-open open');
            }
        });

        $('.sidebar-menu .sidebar-submenu a').off('click.svSidebar').on('click.svSidebar', function (e) {
            e.stopPropagation();
        });
    }

    function clearActiveMenu() {
        var $menu = $('ul#sidebar-menu');
        $menu.find('a').removeClass('active-page');
        $menu.find('li').removeClass('active-page show');
        $menu.find('.sidebar-submenu').removeClass('show');
    }

    function setActiveMenu() {
        var currentPage = getCurrentPage();
        var $menu = $('ul#sidebar-menu');

        if (!$menu.length) return;

        clearActiveMenu();

        if (!currentPage) return;

        var $activeLink = null;

        $menu.find('a').each(function () {
            if (linkMatchesPage(this, currentPage)) {
                $activeLink = $(this);
                return false;
            }
        });

        if (!$activeLink || !$activeLink.length) return;

        $activeLink.addClass('active-page');

        var $item = $activeLink.parent('li');
        $item.addClass('active-page');

        var $dropdown = $activeLink.closest('li.dropdown');
        if ($dropdown.length && !$activeLink.parent().hasClass('dropdown')) {
            $dropdown.addClass('open dropdown-open');
            $dropdown.children('.sidebar-submenu').show();
        }
    }

    function bootSidebarMenu() {
        initSidebarDropdown();
        clearActiveMenu();
        setActiveMenu();
    }

    $(function () {
        bootSidebarMenu();
        // Run again after legacy app.js menu handler on the same ready queue
        setTimeout(bootSidebarMenu, 0);
    });

    $(window).on('load', bootSidebarMenu);

    if (typeof Sys !== 'undefined' && Sys.Application) {
        Sys.Application.add_load(bootSidebarMenu);
    }
})(jQuery);
