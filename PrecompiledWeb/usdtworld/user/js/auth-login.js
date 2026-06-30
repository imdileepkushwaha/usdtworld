(function () {
    'use strict';

    function initAuthLogin() {
        var toggleBtn = document.getElementById('btnTogglePass');
        var passInput = document.querySelector('[id$="txtpassword"]');

        if (toggleBtn && passInput) {
            toggleBtn.onclick = function () {
                var icon = this.querySelector('i');
                if (passInput.type === 'password') {
                    passInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    passInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
                passInput.focus();
            };
        }

        document.querySelectorAll('.modal-overlay').forEach(function (overlay) {
            overlay.addEventListener('click', function (e) {
                if (e.target === overlay && !overlay.classList.contains('modal-overlay--static')) {
                    overlay.classList.add('hidden');
                }
            });
        });

        document.querySelectorAll('[data-close-modal]').forEach(function (btn) {
            btn.addEventListener('click', function () {
                var target = this.getAttribute('data-close-modal');
                var modal = document.getElementById(target);
                if (modal) modal.classList.add('hidden');
            });
        });

        var forgotLink = document.getElementById('forgotLink');
        if (forgotLink) {
            forgotLink.addEventListener('click', function (e) {
                e.preventDefault();
                showModal();
            });
        }

        document.querySelectorAll('.input-group__field, .modal-card .input-group__field').forEach(function (field) {
            field.addEventListener('keydown', function (e) {
                if (e.key === 'Enter' && field.closest('#loginForm')) {
                    var loginBtn = document.querySelector('[id$="btnLogin"]');
                    if (loginBtn) loginBtn.click();
                }
            });
        });
    }

    window.shakeInput = function (el) {
        if (!el) return;
        el.style.animation = 'none';
        el.offsetHeight;
        el.style.animation = 'inputShake 0.5s ease';
        var field = el.querySelector('.input-group__field');
        if (field) {
            field.style.borderColor = 'var(--primary)';
            setTimeout(function () {
                field.style.borderColor = '';
            }, 1500);
        }
    };

    if (!document.getElementById('authShakeStyle')) {
        var shakeStyle = document.createElement('style');
        shakeStyle.id = 'authShakeStyle';
        shakeStyle.textContent = '@keyframes inputShake{0%,100%{transform:translateX(0)}15%{transform:translateX(-6px)}30%{transform:translateX(5px)}45%{transform:translateX(-4px)}60%{transform:translateX(3px)}75%{transform:translateX(-2px)}90%{transform:translateX(1px)}}';
        document.head.appendChild(shakeStyle);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initAuthLogin);
    } else {
        initAuthLogin();
    }

    if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(initAuthLogin);
    }
})();

function showModal() {
    var modal = document.getElementById('myModal');
    if (modal) modal.classList.remove('hidden');
}

function Closepopup() {
    var modal = document.getElementById('myModal');
    if (modal) modal.classList.add('hidden');
}

function showModal12() {
    var modal = document.getElementById('Divotp');
    if (modal) modal.classList.remove('hidden');
}

function Closepopup1() {
    var modal = document.getElementById('Divotp');
    if (modal) modal.classList.add('hidden');
}

function showModal13() {
    var modal = document.getElementById('Divreset');
    if (modal) modal.classList.remove('hidden');
}

function Closepopup2() {
    var modal = document.getElementById('Divreset');
    if (modal) modal.classList.add('hidden');
}

function Toggle1() {
    togglePasswordField('[id$="TxtNewPassword"]', 'toggleNewPasswordIcon');
}

function Toggle2() {
    togglePasswordField('[id$="TxtConfirmpassword"]', 'toggleConfirmPasswordIcon');
}

function togglePasswordField(selector, iconId) {
    var input = document.querySelector(selector);
    var icon = document.getElementById(iconId);
    if (!input) return;
    if (input.type === 'password') {
        input.type = 'text';
        if (icon) { icon.classList.remove('fa-eye'); icon.classList.add('fa-eye-slash'); }
    } else {
        input.type = 'password';
        if (icon) { icon.classList.remove('fa-eye-slash'); icon.classList.add('fa-eye'); }
    }
}
