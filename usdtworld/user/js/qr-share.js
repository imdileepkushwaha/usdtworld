(function (global) {
    var shareCache = {};

    function isMobileDevice() {
        return /Android|iPhone|iPad|iPod|Mobile/i.test(navigator.userAgent);
    }

    function isSecureContext() {
        return global.isSecureContext === true;
    }

    function cacheKey(details, userId) {
        return String(userId || '') + '|' + String(details || '').length;
    }

    function readElementSrc(el) {
        if (!el) return '';

        var canvas = el.tagName === 'CANVAS' ? el : (el.querySelector ? el.querySelector('canvas') : null);
        var img = el.tagName === 'IMG' ? el : (el.querySelector ? el.querySelector('img') : null);

        if (canvas && canvas.width > 0 && canvas.height > 0) {
            try {
                var canvasUrl = canvas.toDataURL('image/png');
                if (canvasUrl && canvasUrl.length > 50) return canvasUrl;
            } catch (e) { }
        }

        if (img) {
            var imgSrc = img.src || img.getAttribute('src') || '';
            if (imgSrc && imgSrc.length > 10) return imgSrc;
        }

        return '';
    }

    function waitForQrElement(container, callback) {
        var deadline = Date.now() + 3000;
        var cleaned = false;

        function finish(src) {
            if (cleaned) return;
            cleaned = true;
            if (container.parentNode) {
                container.parentNode.removeChild(container);
            }
            callback(src || '');
        }

        function check() {
            var src = readElementSrc(container);
            if (src) {
                finish(src);
                return;
            }
            if (Date.now() < deadline) {
                setTimeout(check, 80);
            } else {
                finish('');
            }
        }

        check();
    }

    function generateQrImageSrc(text, size, callback) {
        if (!text || typeof QRCode === 'undefined') {
            callback('');
            return;
        }

        var tempDiv = document.createElement('div');
        tempDiv.style.cssText =
            'position:fixed;left:-10000px;top:0;width:' + size + 'px;height:' + size + 'px;' +
            'opacity:0;pointer-events:none;overflow:hidden;';
        document.body.appendChild(tempDiv);

        try {
            new QRCode(tempDiv, {
                text: text,
                width: size,
                height: size,
                colorDark: '#0f172a',
                colorLight: '#ffffff',
                correctLevel: QRCode.CorrectLevel.M
            });
        } catch (e) {
            if (tempDiv.parentNode) tempDiv.parentNode.removeChild(tempDiv);
            callback('');
            return;
        }

        waitForQrElement(tempDiv, callback);
    }

    function resolveQrSrc(options, callback) {
        var cached = options.getCachedSrc && options.getCachedSrc();
        if (cached) {
            callback(cached);
            return;
        }

        var container = options.getQrElement && options.getQrElement();
        var src = readElementSrc(container);
        if (src) {
            callback(src);
            return;
        }

        var details = typeof options.getDetails === 'function' ? options.getDetails() : '';
        var attempts = 0;

        function retryRead() {
            attempts += 1;
            src = readElementSrc(container);
            if (src) {
                callback(src);
                return;
            }
            if (attempts < 12) {
                setTimeout(retryRead, 100);
                return;
            }
            generateQrImageSrc(details, 420, callback);
        }

        retryRead();
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
        try {
            var blob = dataUrlToBlob(dataUrl);
            var url = URL.createObjectURL(blob);
            var link = document.createElement('a');
            link.download = fileName;
            link.href = url;
            link.style.display = 'none';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            setTimeout(function () { URL.revokeObjectURL(url); }, 3000);
            return true;
        } catch (e) {
            return false;
        }
    }

    function buildShareCardImage(qrSrc, details, callback) {
        if (!qrSrc) {
            callback('');
            return;
        }

        var qrImg = new Image();
        qrImg.onload = function () {
            try {
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
            } catch (e) {
                callback('');
            }
        };
        qrImg.onerror = function () { callback(''); };
        qrImg.src = qrSrc;
    }

    function showImageSaveOverlay(dataUrl, title, hint) {
        var existing = document.getElementById('svQrSaveOverlay');
        if (existing) existing.parentNode.removeChild(existing);

        var overlay = document.createElement('div');
        overlay.id = 'svQrSaveOverlay';
        overlay.style.cssText =
            'position:fixed;inset:0;z-index:100000;background:rgba(15,23,42,0.94);' +
            'display:flex;flex-direction:column;align-items:center;justify-content:center;' +
            'padding:20px;box-sizing:border-box;overflow:auto;';

        var safeTitle = title || 'Profile QR';
        var safeHint = hint || 'Long-press the image, then tap Save Image or Share.';

        overlay.innerHTML =
            '<div style="max-width:380px;width:100%;text-align:center;color:#fff;font-family:Segoe UI,Arial,sans-serif;">' +
            '<p style="margin:0 0 8px;font-size:17px;font-weight:700;">' + safeTitle + '</p>' +
            '<p style="margin:0 0 14px;font-size:14px;line-height:1.5;opacity:0.92;">' + safeHint + '</p>' +
            '<img src="' + dataUrl + '" alt="Profile QR" style="width:min(300px,82vw);height:auto;border-radius:12px;background:#fff;padding:12px;" />' +
            '<div style="display:flex;gap:10px;justify-content:center;flex-wrap:wrap;margin-top:16px;">' +
            '<button type="button" id="svQrSaveOverlayDownload" style="padding:10px 16px;border:none;border-radius:8px;background:#22c55e;color:#fff;font-size:14px;">Download</button>' +
            '<button type="button" id="svQrSaveOverlayClose" style="padding:10px 16px;border:none;border-radius:8px;background:#6c63ff;color:#fff;font-size:14px;">Close</button>' +
            '</div></div>';

        document.body.appendChild(overlay);
        overlay.querySelector('#svQrSaveOverlayClose').onclick = function () {
            overlay.parentNode.removeChild(overlay);
        };
        overlay.querySelector('#svQrSaveOverlayDownload').onclick = function () {
            downloadImage(dataUrl, 'usdtworld-profile-qr.png');
        };
    }

    function shareImageNow(cardSrc, details, fileName, title) {
        if (!navigator.share || !isSecureContext()) {
            return Promise.reject(new Error('share-not-supported'));
        }

        var blob = dataUrlToBlob(cardSrc);
        var file = new File([blob], fileName, { type: 'image/png' });
        var withFiles = { title: title, text: details, files: [file] };

        if (!navigator.canShare || navigator.canShare({ files: [file] })) {
            return navigator.share(withFiles).catch(function (err) {
                if (err && err.name === 'AbortError') return;
                throw err;
            });
        }

        return navigator.share({ title: title, text: details }).catch(function (err) {
            if (err && err.name === 'AbortError') return;
            throw err;
        });
    }

    function mobileDeliverImage(src, details, fileName, title, actionLabel) {
        if (!src) {
            alert('Unable to ' + actionLabel + ' QR. Please wait for the QR to load and try again.');
            return;
        }

        if (isSecureContext() && navigator.share) {
            shareImageNow(src, details, fileName, title).catch(function (err) {
                if (err && err.name === 'AbortError') return;
                downloadImage(src, fileName);
                showImageSaveOverlay(
                    src,
                    title,
                    'Share did not open. Long-press the image to save or share, or tap Download.'
                );
            });
            return;
        }

        downloadImage(src, fileName);
        showImageSaveOverlay(
            src,
            title,
            'Long-press the image to save or share it via WhatsApp, Telegram, or any app.'
        );
    }

    function prebuildShareCard(options) {
        var details = typeof options.getDetails === 'function' ? options.getDetails() : '';
        var userId = typeof options.getUserId === 'function' ? options.getUserId() : 'profile';
        if (!details) return;

        var key = cacheKey(details, userId);
        if (shareCache[key] && shareCache[key].ready) return;

        shareCache[key] = { ready: false, details: details, userId: userId, qrSrc: '', cardSrc: '' };

        function storeCard(qrSrc, cardSrc) {
            shareCache[key] = {
                ready: !!(qrSrc || cardSrc),
                details: details,
                userId: userId,
                qrSrc: qrSrc || '',
                cardSrc: cardSrc || qrSrc || ''
            };
        }

        resolveQrSrc(options, function (qrSrc) {
            if (!qrSrc) {
                shareCache[key].ready = false;
                return;
            }
            buildShareCardImage(qrSrc, details, function (cardSrc) {
                storeCard(qrSrc, cardSrc || qrSrc);
            });
        });
    }

    function shareQrWithDetails(options) {
        var details = typeof options.getDetails === 'function' ? options.getDetails() : '';
        var userId = typeof options.getUserId === 'function' ? options.getUserId() : 'profile';

        if (!details) {
            alert('Profile details are not ready yet. Please wait a moment.');
            return;
        }

        var key = cacheKey(details, userId);
        var cached = shareCache[key];
        var fileName = 'usdtworld-profile-' + userId + '.png';
        var title = 'USDTWorld Profile — ' + userId;

        function deliver(cardSrc) {
            if (!cardSrc) {
                alert('Unable to share QR. Please wait for the QR to load and try again.');
                return;
            }

            if (isMobileDevice()) {
                mobileDeliverImage(cardSrc, details, fileName, title, 'share');
                return;
            }

            shareImageNow(cardSrc, details, fileName, title).catch(function (err) {
                if (err && err.name === 'AbortError') return;
                downloadImage(cardSrc, fileName);
                alert('Profile QR card downloaded. Share the image file via WhatsApp or any app.');
            });
        }

        if (cached && cached.cardSrc) {
            deliver(cached.cardSrc);
            return;
        }

        resolveQrSrc(options, function (qrSrc) {
            if (!qrSrc) {
                alert('Unable to share QR. Please wait for the QR to load and try again.');
                return;
            }

            if (isMobileDevice()) {
                deliver(qrSrc);
                buildShareCardImage(qrSrc, details, function (cardSrc) {
                    if (cardSrc) {
                        shareCache[key] = {
                            ready: true,
                            details: details,
                            userId: userId,
                            qrSrc: qrSrc,
                            cardSrc: cardSrc
                        };
                    }
                });
                return;
            }

            buildShareCardImage(qrSrc, details, function (cardSrc) {
                deliver(cardSrc || qrSrc);
            });
        });
    }

    function printQrImage(options) {
        var details = typeof options.getDetails === 'function' ? options.getDetails() : '';
        var userId = typeof options.getUserId === 'function' ? options.getUserId() : 'profile';

        if (!details) {
            alert('QR code is not ready yet. Please wait a moment.');
            return;
        }

        var fileName = 'usdtworld-profile-' + userId + '.png';
        var title = 'USDTWorld Profile QR';
        var printWindow = !isMobileDevice() ? window.open('about:blank', '_blank') : null;

        function openPrintWindow(src) {
            if (!src) {
                if (printWindow) printWindow.close();
                alert('Unable to print QR. Please wait for the QR to load and try again.');
                return;
            }

            if (isMobileDevice()) {
                mobileDeliverImage(src, details, fileName, title, 'print');
                return;
            }

            if (!printWindow) {
                alert('Please allow pop-ups to print the QR code.');
                return;
            }

            printWindow.document.open();
            printWindow.document.write(
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
            printWindow.document.close();
            printWindow.onload = function () {
                printWindow.focus();
                printWindow.print();
            };
        }

        resolveQrSrc(options, openPrintWindow);
    }

    global.SvQrShare = {
        share: shareQrWithDetails,
        print: printQrImage,
        prebuild: prebuildShareCard,
        readElementSrc: readElementSrc,
        generateQrImageSrc: generateQrImageSrc,
        resolveQrSrc: resolveQrSrc
    };
})(window);
