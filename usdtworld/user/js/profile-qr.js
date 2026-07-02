(function () {
    var qrInstance = null;
    var lastKnownQrSrc = '';

    function getQrData() {
        var el = document.getElementById('hdnProfileQrData');
        return el ? el.value : '';
    }

    function getUserId() {
        var el = document.getElementById('lblQrUserId');
        return el ? el.innerText.trim() : 'profile';
    }

    function getQrContainer() {
        return document.getElementById('profileQrCanvas');
    }

    function clearQrContainer() {
        var container = getQrContainer();
        if (!container) return;
        container.innerHTML = '';
        qrInstance = null;
        lastKnownQrSrc = '';
    }

    function captureRenderedQrSrc(attempt) {
        var container = getQrContainer();
        if (!container) return;

        var src = '';
        if (window.SvQrShare && SvQrShare.readElementSrc) {
            src = SvQrShare.readElementSrc(container);
        } else {
            var canvas = container.querySelector('canvas');
            var img = container.querySelector('img');
            if (canvas && canvas.width > 0) {
                try { src = canvas.toDataURL('image/png'); } catch (e) { }
            } else if (img && img.src) {
                src = img.src;
            }
        }

        if (src) {
            lastKnownQrSrc = src;
            if (window.SvQrShare && SvQrShare.prebuild) {
                SvQrShare.prebuild({
                    getDetails: getQrData,
                    getUserId: getUserId,
                    getQrElement: getQrContainer,
                    getCachedSrc: function () { return lastKnownQrSrc; }
                });
            }
            return;
        }

        if (attempt < 25) {
            setTimeout(function () { captureRenderedQrSrc(attempt + 1); }, 120);
        }
    }

    function renderProfileQr() {
        var data = getQrData();
        var container = getQrContainer();
        if (!container || !data || typeof QRCode === 'undefined') return;

        clearQrContainer();
        qrInstance = new QRCode(container, {
            text: data,
            width: 200,
            height: 200,
            colorDark: '#0f172a',
            colorLight: '#ffffff',
            correctLevel: QRCode.CorrectLevel.M
        });

        setTimeout(function () { captureRenderedQrSrc(0); }, 150);
    }

    function getShareOptions() {
        return {
            getDetails: getQrData,
            getUserId: getUserId,
            getQrElement: getQrContainer,
            getCachedSrc: function () { return lastKnownQrSrc; }
        };
    }

    window.printProfileQr = function () {
        if (window.SvQrShare && SvQrShare.print) {
            SvQrShare.print(getShareOptions());
            return;
        }
        alert('QR print is not available. Please refresh the page.');
    };

    window.downloadProfileQr = function () {
        var container = getQrContainer();
        if (!container) {
            alert('QR code is not ready yet. Please wait a moment.');
            return;
        }

        var src = lastKnownQrSrc;
        if (!src && window.SvQrShare && SvQrShare.readElementSrc) {
            src = SvQrShare.readElementSrc(container);
        }

        if (!src) {
            alert('QR code is not ready yet. Please wait a moment.');
            return;
        }

        var link = document.createElement('a');
        link.download = 'usdtworld-profile-' + getUserId() + '.png';
        link.href = src;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    window.copyProfileText = function () {
        var data = getQrData();
        if (!data) return;

        if (navigator.clipboard && navigator.clipboard.writeText) {
            navigator.clipboard.writeText(data).then(function () {
                alert('Profile details copied to clipboard.');
            }).catch(function () {
                fallbackCopy(data);
            });
        } else {
            fallbackCopy(data);
        }
    };

    function fallbackCopy(text) {
        var ta = document.createElement('textarea');
        ta.value = text;
        document.body.appendChild(ta);
        ta.select();
        try {
            document.execCommand('copy');
            alert('Profile details copied to clipboard.');
        } catch (e) {
            alert('Unable to copy. Please copy manually.');
        }
        document.body.removeChild(ta);
    }

    window.shareProfileQr = function () {
        if (window.SvQrShare && SvQrShare.share) {
            SvQrShare.share(getShareOptions());
            return;
        }

        var data = getQrData();
        if (!data) return;
        window.open('https://wa.me/?text=' + encodeURIComponent(data), '_blank');
    };

    function initProfileQr() {
        if (getQrData()) {
            renderProfileQr();
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initProfileQr);
    } else {
        initProfileQr();
    }

    if (typeof Sys !== 'undefined' && Sys.Application) {
        Sys.Application.add_load(function () {
            initProfileQr();
        });
    }

    if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            initProfileQr();
        });
    }
})();
