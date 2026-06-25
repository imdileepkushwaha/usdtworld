(function () {
    'use strict';

    function getModalEl(modalId) {
        return document.getElementById(modalId || 'myModal');
    }

    window.showModal = function (modalId) {
        var el = getModalEl(modalId);
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el, { backdrop: 'static', keyboard: false }).show();
        }
    };

    window.showModal1 = function () {
        var photo = document.getElementById('DivPhotolarge');
        if (photo) {
            showModal('DivPhotolarge');
            return;
        }
        showModal('Div1');
    };

    window.Closepopup = function (modalId) {
        var el = getModalEl(modalId);
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el).hide();
        }
    };

    window.Closepopup1 = function () {
        Closepopup('Div1');
    };

    window.showSearchModal = function () {
        showModal('DivSearch');
    };

    window.Closesearchpopup = function () {
        Closepopup('DivSearch');
    };

    window.showFranchiseeModal = function () {
        showModal('Div_FDetails');
    };

    window.ClosesFranchiseepopup = function () {
        Closepopup('Div_FDetails');
    };

    document.addEventListener('click', function (e) {
        var btn = e.target.closest('[data-dismiss="modal"], [data-bs-dismiss="modal"]');
        if (!btn) return;
        var modal = btn.closest('.modal');
        if (modal) Closepopup(modal.id);
    });
})();
