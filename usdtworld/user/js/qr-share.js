(function (global) {
    function generateQrImageSrc(text, size, callback) {
        if (!text || typeof QRCode === 'undefined') {
            callback(null);
            return;
        }

        var tempDiv = document.createElement('div');
        tempDiv.style.cssText = 'position:absolute;left:-9999px;top:-9999px;';
        document.body.appendChild(tempDiv);

        new QRCode(tempDiv, {
            text: text,
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
        }, 150);
    }

    function dataUrlToBlob(dataUrl) {
        var parts = dataUrl.split(',');
        var mimeMatch = parts[0].match(/:(.*?);/);
        var mime = mimeMatch ? mimeMatch[1] : 'image/png';
        var bstr = atob(parts[1]);
        var n = bstr.length;
        var u8arr = new Uint8Array(n);
        while (n--) u8arr[n] = bstr.charCodeAt(n);
        return new Blob([u8arr], { type: mime });
    }

    function downloadImage(dataUrl, fileName) {
        var link = document.createElement('a');
        link.download = fileName;
        link.href = dataUrl;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

    function buildShareCardImage(qrSrc, details, callback) {
        var qrImg = new Image();
        qrImg.onload = function () {
            var qrSize = 380;
            var padding = 36;
            var headerH = 62;
            var lines = details.split('\n').filter(function (line) {
                var t = line.trim();
                return t && t.indexOf('---') !== 0;
            });
            var lineH = 24;
            var detailsH = Math.max(lines.length * lineH + 20, 80);
            var w = qrSize + padding * 2;
            var h = headerH + qrSize + padding + detailsH + padding;

            var canvas = document.createElement('canvas');
            canvas.width = w;
            canvas.height = h;
            var ctx = canvas.getContext('2d');

            ctx.fillStyle = '#ffffff';
            ctx.fillRect(0, 0, w, h);

            var grad = ctx.createLinearGradient(0, 0, w, 0);
            grad.addColorStop(0, '#6c63ff');
            grad.addColorStop(0.5, '#5b52e8');
            grad.addColorStop(1, '#00d4ff');
            ctx.fillStyle = grad;
            ctx.fillRect(0, 0, w, headerH);

            ctx.fillStyle = '#ffffff';
            ctx.font = 'bold 22px Segoe UI, Arial, sans-serif';
            ctx.textAlign = 'center';
            ctx.fillText('USDTWorld Member Profile', w / 2, 40);

            var qrX = padding;
            var qrY = headerH + padding;

            ctx.fillStyle = '#f8fafc';
            ctx.fillRect(qrX - 10, qrY - 10, qrSize + 20, qrSize + 20);
            ctx.strokeStyle = '#c7d2fe';
            ctx.lineWidth = 3;
            ctx.strokeRect(qrX - 10, qrY - 10, qrSize + 20, qrSize + 20);
            ctx.drawImage(qrImg, qrX, qrY, qrSize, qrSize);

            ctx.textAlign = 'left';
            ctx.fillStyle = '#1e293b';
            ctx.font = '15px Segoe UI, Arial, sans-serif';
            var y = qrY + qrSize + 32;
            lines.forEach(function (line) {
                var text = line.trim();
                if (/^USDTWORLD MEMBER PROFILE/i.test(text)) return;
                ctx.fillText(text, padding, y);
                y += lineH;
            });

            ctx.fillStyle = '#64748b';
            ctx.font = '12px Segoe UI, Arial, sans-serif';
            ctx.textAlign = 'center';
            ctx.fillText('Scan QR to view full profile', w / 2, h - 16);

            callback(canvas.toDataURL('image/png'));
        };
        qrImg.onerror = function () { callback(null); };
        qrImg.src = qrSrc;
    }

    function fallbackShare(cardSrc, details, fileName) {
        downloadImage(cardSrc, fileName);

        if (/Android|iPhone|iPad|iPod/i.test(navigator.userAgent)) {
            window.open('https://wa.me/?text=' + encodeURIComponent(
                details + '\n\n📎 Profile QR card image has been saved to your device — please attach it in chat.'
            ), '_blank');
            return;
        }

        if (navigator.clipboard && navigator.clipboard.writeText) {
            navigator.clipboard.writeText(details).catch(function () { });
        }

        alert('Profile QR card downloaded.\n\nShare the image file along with the profile details via WhatsApp or any app.');
    }

    function shareQrWithDetails(options) {
        var details = typeof options.getDetails === 'function' ? options.getDetails() : '';
        var userId = typeof options.getUserId === 'function' ? options.getUserId() : 'profile';

        if (!details) {
            alert('Profile details are not ready yet. Please wait a moment.');
            return;
        }

        generateQrImageSrc(details, 512, function (qrSrc) {
            if (!qrSrc) {
                alert('Unable to generate QR code for sharing.');
                return;
            }

            buildShareCardImage(qrSrc, details, function (cardSrc) {
                if (!cardSrc) {
                    alert('Unable to prepare share image.');
                    return;
                }

                var fileName = 'usdtworld-profile-' + userId + '.png';
                var blob = dataUrlToBlob(cardSrc);
                var file = new File([blob], fileName, { type: 'image/png' });
                var title = 'USDTWorld Profile — ' + userId;

                if (navigator.share) {
                    var payload = { title: title, text: details, files: [file] };
                    if (navigator.canShare && navigator.canShare({ files: [file] })) {
                        navigator.share(payload).catch(function (err) {
                            if (err && err.name !== 'AbortError') {
                                fallbackShare(cardSrc, details, fileName);
                            }
                        });
                        return;
                    }

                    navigator.share({ title: title, text: details }).catch(function (err) {
                        if (err && err.name !== 'AbortError') {
                            fallbackShare(cardSrc, details, fileName);
                        }
                    });
                    return;
                }

                fallbackShare(cardSrc, details, fileName);
            });
        });
    }

    global.SvQrShare = {
        share: shareQrWithDetails
    };
})(window);
