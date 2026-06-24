(function () {
    'use strict';

    function initUploadZone(zone) {
        var input = zone.querySelector('input[type="file"]');
        if (!input) return;

        var previewId = zone.getAttribute('data-preview');
        var filenameId = zone.getAttribute('data-filename');
        var preview = previewId ? document.getElementById(previewId) : null;
        var filenameEl = filenameId ? document.getElementById(filenameId) : zone.querySelector('.adm-upload-dropzone__filename');
        var previewImg = preview ? preview.querySelector('.adm-upload-preview__img') : null;

        function setPreview(file) {
            if (!file || !file.type || file.type.indexOf('image/') !== 0) return;

            var reader = new FileReader();
            reader.onload = function (e) {
                if (previewImg) {
                    previewImg.src = e.target.result;
                    previewImg.style.display = 'block';
                }
                if (preview) preview.classList.add('has-image');
            };
            reader.readAsDataURL(file);
        }

        function setFilename(name) {
            if (!filenameEl) return;
            filenameEl.textContent = name || 'No file chosen';
            filenameEl.classList.toggle('has-file', !!name);
        }

        input.addEventListener('change', function () {
            var file = input.files && input.files[0];
            setFilename(file ? file.name : '');
            if (file) setPreview(file);
        });

        zone.addEventListener('dragover', function (e) {
            e.preventDefault();
            zone.classList.add('is-dragover');
        });

        zone.addEventListener('dragleave', function () {
            zone.classList.remove('is-dragover');
        });

        zone.addEventListener('drop', function (e) {
            e.preventDefault();
            zone.classList.remove('is-dragover');
            var file = e.dataTransfer && e.dataTransfer.files && e.dataTransfer.files[0];
            if (!file) return;

            try {
                var dt = new DataTransfer();
                dt.items.add(file);
                input.files = dt.files;
            } catch (err) {
                /* older browsers — change event may not fire */
            }

            input.dispatchEvent(new Event('change', { bubbles: true }));
        });

        if (previewImg && previewImg.src && previewImg.src.indexOf('data:') !== 0 && previewImg.getAttribute('src')) {
            preview.classList.add('has-image');
        }
    }

    function initAll() {
        document.querySelectorAll('.adm-upload-dropzone').forEach(initUploadZone);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initAll);
    } else {
        initAll();
    }

    if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(initAll);
    }
})();
