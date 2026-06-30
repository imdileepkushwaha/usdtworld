(function (window, $) {
    'use strict';

    if (!$) return;

    var defaultOptions = {
        format: 'dd/mm/yyyy',
        autoclose: true,
        todayHighlight: true,
        clearBtn: true,
        orientation: 'auto',
        container: 'body',
        templates: {
            leftArrow: '<i class="fa-solid fa-chevron-left" aria-hidden="true"></i>',
            rightArrow: '<i class="fa-solid fa-chevron-right" aria-hidden="true"></i>'
        }
    };

    function ensurePlugin(callback) {
        if ($.fn.datepicker) {
            callback();
            return;
        }

        var script = document.createElement('script');
        script.src = '../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js';
        script.onload = callback;
        document.body.appendChild(script);
    }

    function initAdminDatePickers(root) {
        var $scope = root ? $(root) : $(document);
        $scope.find('.form_date').addBack('.form_date').each(function () {
            var $el = $(this);
            if ($el.data('datepicker')) return;

            $el.addClass('adm-date-input');

            $el.datepicker(defaultOptions).on('changeDate', function () {
                $(this).datepicker('hide');
            });

            $el.on('click focus', function () {
                if ($(this).data('datepicker')) {
                    $(this).datepicker('show');
                }
            });
        });
    }

    function bindGlobalInit() {
        initAdminDatePickers();

        if (window.Sys && Sys.Application) {
            Sys.Application.add_load(function () {
                initAdminDatePickers();
            });
        }

        if (window.Sys && Sys.WebForms && Sys.WebForms.PageRequestManager) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (prm && !prm._admDatePickerHooked) {
                prm._admDatePickerHooked = true;
                prm.add_endRequest(function () {
                    initAdminDatePickers();
                });
            }
        }
    }

    $(function () {
        ensurePlugin(bindGlobalInit);
    });
}(window, window.jQuery));
