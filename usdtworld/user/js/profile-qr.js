(function () {
    var qrInstance = null;

    function getQrData() {
        var el = document.getElementById('hdnProfileQrData');
        return el ? el.value : '';
    }

    function getUserId() {
        var el = document.getElementById('lblQrUserId');
        return el ? el.innerText.trim() : 'profile';
    }

    function clearQrContainer() {
        var container = document.getElementById('profileQrCanvas');
        if (!container) return;
        container.innerHTML = '';
        qrInstance = null;
    }

    function renderProfileQr() {
        var data = getQrData();
        var container = document.getElementById('profileQrCanvas');
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
    }

    function getQrImageElement() {
        var container = document.getElementById('profileQrCanvas');
        if (!container) return null;
        return container.querySelector('img') || container.querySelector('canvas');
    }

    function getQrImageSrc(size, callback) {
        var data = getQrData();
        if (!data || typeof QRCode === 'undefined') return;

        var tempDiv = document.createElement('div');
        tempDiv.style.cssText = 'position:absolute;left:-9999px;top:-9999px;';
        document.body.appendChild(tempDiv);

        new QRCode(tempDiv, {
            text: data,
            width: size,
            height: size,
            colorDark: '#0f172a',
            colorLight: '#ffffff',
            correctLevel: QRCode.CorrectLevel.M
        });

        setTimeout(function () {
            var qrEl = tempDiv.querySelector('img') || tempDiv.querySelector('canvas');
            var src = '';
            if (qrEl) {
                src = qrEl.tagName === 'CANVAS' ? qrEl.toDataURL('image/png') : qrEl.src;
            }
            document.body.removeChild(tempDiv);
            callback(src);
        }, 120);
    }

    window.printProfileQr = function () {
        if (!getQrData()) {
            alert('QR code is not ready yet. Please wait a moment.');
            return;
        }

        getQrImageSrc(420, function (src) {
            if (!src) {
                alert('Unable to generate QR for printing.');
                return;
            }

            var win = window.open('', '_blank');
            if (!win) {
                alert('Please allow pop-ups to print the QR code.');
                return;
            }

            win.document.write(
                '<!DOCTYPE html><html><head><title>Profile QR</title>' +
                '<style>' +
                '@page { margin: 12mm; size: auto; }' +
                'html, body { margin: 0; padding: 0; height: 100%; }' +
                'body { display: flex; align-items: center; justify-content: center; background: #fff; }' +
                'img { width: 340px; height: 340px; display: block; }' +
                '@media print { img { width: 300px; height: 300px; } }' +
                '</style></head><body>' +
                '<img src="' + src + '" alt="Profile QR Code" />' +
                '</body></html>'
            );
            win.document.close();
            win.onload = function () {
                win.focus();
                win.print();
                win.close();
            };
        });
    };

    window.downloadProfileQr = function () {
        var qrEl = getQrImageElement();
        if (!qrEl) {
            alert('QR code is not ready yet. Please wait a moment.');
            return;
        }

        var link = document.createElement('a');
        link.download = 'usdtworld-profile-' + getUserId() + '.png';
        if (qrEl.tagName === 'CANVAS') {
            link.href = qrEl.toDataURL('image/png');
        } else {
            link.href = qrEl.src;
        }
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
            SvQrShare.share({
                getDetails: getQrData,
                getUserId: getUserId
            });
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

    if (typeof Sys !== 'undefined' && Sys.WebForms && Sys.WebForms.PageRequestManager) {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            initProfileQr();
        });
    }
})();
