(function () {
    'use strict';

    function getModalEl(modalId) {
        return document.getElementById(modalId || 'myModal');
    }

    window.showModal = function (modalId) {
        var preview = document.getElementById('qrPreviewEdit');
        if (preview) {
            var img = preview.querySelector('.adm-upload-preview__img');
            if (img && img.getAttribute('src')) {
                preview.classList.add('has-image');
            }
        }
        var el = getModalEl(modalId);
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el, { backdrop: 'static', keyboard: false }).show();
        }
    };

    window.Closepopup = function (modalId) {
        var el = getModalEl(modalId);
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el).hide();
        }
    };

    window.showFranchiseeModal = function () {
        var el = document.getElementById('Div_FDetails');
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el, { backdrop: 'static', keyboard: false }).show();
        }
    };

    window.ClosesFranchiseepopup = function () {
        var el = document.getElementById('Div_FDetails');
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el).hide();
        }
    };

    window.showModal1 = function (modalId) {
        var el = document.getElementById(modalId || 'DivPhotolarge');
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el, { backdrop: 'static', keyboard: false }).show();
        }
    };

    window.showModal2 = function (modalId) {
        var el = document.getElementById(modalId || 'DivGSTLarge');
        if (el && window.bootstrap) {
            bootstrap.Modal.getOrCreateInstance(el, { backdrop: 'static', keyboard: false }).show();
        }
    };

    /* Bootstrap 3 legacy: data-dismiss="modal" */
    document.addEventListener('click', function (e) {
        var btn = e.target.closest('[data-dismiss="modal"], [data-bs-dismiss="modal"]');
        if (!btn) return;
        var modal = btn.closest('.modal');
        if (modal) Closepopup(modal.id);
    });
})();
