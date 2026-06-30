(function ($) {
    'use strict';

    function updateUploadState(input) {
        var $upload = $(input).closest('.sv-kyc-upload');
        if (!$upload.length) return;

        var fileName = input.files && input.files[0] ? input.files[0].name : 'No file selected';
        $upload.find('.sv-kyc-upload__name').text(fileName);
        $upload.toggleClass('sv-kyc-upload--selected', !!(input.files && input.files[0]));
    }

    function bindKycUploads() {
        $(document).off('change.kycUpload', '.sv-kyc-upload__input');
        $(document).on('change.kycUpload', '.sv-kyc-upload__input', function () {
            updateUploadState(this);
        });

        $('.sv-kyc-upload__input').each(function () {
            updateUploadState(this);
        });
    }

    $(function () {
        bindKycUploads();
    });

    if (typeof Sys !== 'undefined' && Sys.Application) {
        Sys.Application.add_load(bindKycUploads);
    }
})(jQuery);
