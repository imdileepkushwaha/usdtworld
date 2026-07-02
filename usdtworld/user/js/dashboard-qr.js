(function () {
    var qrInstance = null;
    var lastKnownQrSrc = '';
    var html5Scanner = null;
    var scannerStarting = false;
    var lastScannedAt = 0;
    var scanState = {
        toUserId: '',
        toUserName: ''
    };

    function byId(id) { return document.getElementById(id); }

    function getQrData() {
        var el = byId('hdnProfileQrData');
        return el ? el.value : '';
    }

    function getUserId() {
        var el = byId('hdnDashUserId');
        return el ? el.value.trim() : '';
    }

    function getUserName() {
        var el = byId('hdnDashUserName');
        return el ? el.value.trim() : '';
    }

    function getBalance() {
        var el = byId('hdnDashBalance');
        return el ? el.value.trim() : '0';
    }

    function getJq() {
        return window.jQuery || window.$;
    }

    function postWebMethod(method, data, onSuccess, onError) {
        var $jq = getJq();
        if (!$jq || !$jq.ajax) {
            var loadMsg = 'Page is still loading. Please wait a moment and try again.';
            if (onError) onError(loadMsg);
            else alert(loadMsg);
            return;
        }

        $jq.ajax({
            type: 'POST',
            url: 'Dashboard.aspx/' + method,
            data: JSON.stringify(data || {}),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            timeout: 25000,
            success: function (res) {
                if (onSuccess) onSuccess(normalizeApiResponse(res ? res.d : null));
            },
            error: function (xhr, status) {
                var msg = 'Request failed. Please try again.';
                if (status === 'timeout') {
                    msg = 'Server is taking too long. Please try again.';
                } else if (xhr.responseJSON && xhr.responseJSON.Message) {
                    msg = xhr.responseJSON.Message;
                } else if (xhr.responseText) {
                    var match = xhr.responseText.match(/"Message":"([^"]+)"/);
                    if (match) msg = match[1];
                }
                if (onError) onError(msg);
                else alert(msg);
            }
        });
    }

    function normalizeApiResponse(res) {
        if (!res) return { success: false, message: 'Empty server response.' };
        if (typeof res === 'string') {
            try { res = JSON.parse(res); } catch (e) {
                return { success: false, message: res };
            }
        }
        return {
            success: !!(res.success || res.Success),
            message: res.message || res.Message || '',
            userId: res.userId || res.UserId || '',
            userName: res.userName || res.UserName || '',
            needsOtp: !!(res.needsOtp || res.NeedsOtp),
            balance: res.balance || res.Balance || ''
        };
    }

    function setVerifyContinueEnabled(enabled) {
        var btn = byId('btnQrVerifyContinue');
        if (!btn) return;
        btn.disabled = !enabled;
        btn.setAttribute('aria-disabled', enabled ? 'false' : 'true');
    }

    function proceedToTxnStep(userId, userName, statusMsg) {
        scanState.toUserId = userId;
        scanState.toUserName = userName || '';

        if (byId('txtQrTxnUserId')) byId('txtQrTxnUserId').value = getUserId();
        if (byId('txtQrTxnPass')) byId('txtQrTxnPass').value = '';

        var badge = byId('svQrRecipientBadge');
        if (badge) {
            badge.innerHTML = '<i class="fa-solid fa-user-check"></i> Transfer to: <strong>' +
                userId + '</strong>' + (userName ? ' — ' + userName : '');
        }

        showScanStep(2);
        setScanMsg('', false);
        setMsg('svQrTxnMsg', statusMsg || '', false);
        setVerifyContinueEnabled(false);
    }

    function setMsg(elId, text, isError) {
        var el = byId(elId);
        if (!el) return;
        el.textContent = text || '';
        el.className = 'sv-qr-scan-msg' + (text ? (isError ? ' sv-qr-scan-msg--error' : ' sv-qr-scan-msg--ok') : '');
    }

    function setScanMsg(text, isError) {
        setMsg('svQrScanMsg', text, isError);
    }

    function isScanTabActive() {
        var panel = byId('svQrTabScan');
        return panel && panel.classList.contains('sv-qr-hub__panel--active');
    }

    function isScanStepVisible() {
        var step1 = byId('svQrScanStep1');
        return step1 && !step1.classList.contains('hidden');
    }

    function parseProfileQr(text) {
        if (!text) return null;

        var userId = null;
        var name = null;

        try {
            var json = JSON.parse(text);
            if (json.userId) userId = String(json.userId).trim();
            if (json.name) name = String(json.name).trim();
            if (userId) return { userId: userId, name: name || '' };
        } catch (e) { }

        var idMatch = text.match(/User ID:\s*([^\r\n]+)/i);
        var nameMatch = text.match(/Name:\s*([^\r\n]+)/i);
        if (idMatch) userId = idMatch[1].trim();
        if (nameMatch) name = nameMatch[1].trim();

        if (userId) {
            userId = userId.replace(/\s+/g, '');
        }

        if (!userId) return null;
        return { userId: userId, name: name || '' };
    }

    function getQrContainer() {
        return byId('dashProfileQrCanvas');
    }

    function clearDashQr() {
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
                SvQrShare.prebuild(getShareOptions());
            }
            return;
        }

        if (attempt < 25) {
            setTimeout(function () { captureRenderedQrSrc(attempt + 1); }, 120);
        }
    }

    function getShareOptions() {
        return {
            getDetails: getQrData,
            getUserId: getUserId,
            getQrElement: getQrContainer,
            getCachedSrc: function () { return lastKnownQrSrc; }
        };
    }

    function renderDashQr() {
        var data = getQrData();
        var container = getQrContainer();
        if (!container || !data || typeof QRCode === 'undefined') return;

        clearDashQr();
        qrInstance = new QRCode(container, {
            text: data,
            width: 200,
            height: 200,
            colorDark: '#0f172a',
            colorLight: '#ffffff',
            correctLevel: QRCode.CorrectLevel.M
        });

        var lbl = byId('lblQrUserId');
        if (lbl) lbl.textContent = getUserId() + (getUserName() ? ' — ' + getUserName() : '');

        setTimeout(function () { captureRenderedQrSrc(0); }, 150);
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

    function resetScannerElement() {
        var reader = byId('qrScannerReader');
        if (!reader) return;
        reader.innerHTML = '';
    }

    function stopQrScanner() {
        scannerStarting = false;
        var stopBtn = byId('btnStopScanner');
        if (stopBtn) stopBtn.style.display = 'none';

        if (!html5Scanner) {
            resetScannerElement();
            return Promise.resolve();
        }

        var scanner = html5Scanner;
        html5Scanner = null;

        return scanner.stop().then(function () {
            scanner.clear();
        }).catch(function () {
            try { scanner.clear(); } catch (e) { }
        }).finally(function () {
            resetScannerElement();
        });
    }

    function pickCameraId(cameras) {
        if (!cameras || !cameras.length) return null;
        var backCam = null;
        for (var i = 0; i < cameras.length; i++) {
            var label = (cameras[i].label || '').toLowerCase();
            if (label.indexOf('back') >= 0 || label.indexOf('rear') >= 0 || label.indexOf('environment') >= 0) {
                backCam = cameras[i].id;
                break;
            }
        }
        return backCam || cameras[cameras.length - 1].id || cameras[0].id;
    }

    function getScannerConfig() {
        return {
            fps: 12,
            qrbox: function (viewfinderWidth, viewfinderHeight) {
                var minEdge = Math.min(viewfinderWidth, viewfinderHeight);
                var size = Math.floor(minEdge * 0.72);
                return { width: size, height: size };
            },
            aspectRatio: 1.0,
            disableFlip: false
        };
    }

    function beginScanner(cameraConfig) {
        html5Scanner = new Html5Qrcode('qrScannerReader', { verbose: false });
        return html5Scanner.start(
            cameraConfig,
            getScannerConfig(),
            function (decodedText) {
                var now = Date.now();
                if (now - lastScannedAt < 1800) return;
                lastScannedAt = now;
                onQrScanned(decodedText);
            }
        );
    }

    window.startQrScanner = function () {
        if (html5Scanner || scannerStarting) return;
        if (!isScanTabActive() || !isScanStepVisible()) return;

        if (typeof Html5Qrcode === 'undefined') {
            setScanMsg('Scanner library not loaded. Please refresh the page.', true);
            return;
        }

        if (!window.isSecureContext && location.hostname !== 'localhost' && location.hostname !== '127.0.0.1') {
            setScanMsg('Camera needs HTTPS. Use Upload QR Image or open site on secure connection.', true);
            return;
        }

        scannerStarting = true;
        setScanMsg('Starting camera...', false);
        resetScannerElement();

        setTimeout(function () {
            if (!isScanTabActive() || !isScanStepVisible()) {
                scannerStarting = false;
                return;
            }

            Html5Qrcode.getCameras().then(function (cameras) {
                var cameraId = pickCameraId(cameras);
                if (cameraId) {
                    return beginScanner(cameraId);
                }
                return beginScanner({ facingMode: 'environment' });
            }).catch(function () {
                return beginScanner({ facingMode: 'environment' });
            }).then(function () {
                return null;
            }).catch(function () {
                return beginScanner({ facingMode: 'user' });
            }).then(function () {
                scannerStarting = false;
                setScanMsg('Align the profile QR inside the frame', false);
                var stopBtn = byId('btnStopScanner');
                if (stopBtn) stopBtn.style.display = 'inline-flex';
            }).catch(function (err) {
                scannerStarting = false;
                html5Scanner = null;
                resetScannerElement();
                var msg = (err && err.message) ? err.message : 'Camera access denied or unavailable.';
                setScanMsg(msg + ' Use Upload QR Image instead.', true);
            });
        }, 400);
    };

    window.scanQrFromFile = function (input) {
        var file = input && input.files && input.files[0];
        if (!file || typeof Html5Qrcode === 'undefined') return;

        setScanMsg('Reading QR from image...', false);
        stopQrScanner().then(function () {
            return Html5Qrcode.scanFile(file, false);
        }).then(function (decodedText) {
            input.value = '';
            onQrScanned(decodedText);
        }).catch(function () {
            input.value = '';
            setScanMsg('Could not read QR from this image. Try a clearer photo.', true);
            if (isScanTabActive() && isScanStepVisible()) {
                window.startQrScanner();
            }
        });
    };

    window.printDashQr = function () {
        if (window.SvQrShare && SvQrShare.print) {
            SvQrShare.print(getShareOptions());
            return;
        }

        alert('QR print is not available. Please refresh the page.');
    };

    window.shareDashQr = function () {
        if (window.SvQrShare && SvQrShare.share) {
            SvQrShare.share(getShareOptions());
            return;
        }

        var data = getQrData();
        if (!data) return;
        window.open('https://wa.me/?text=' + encodeURIComponent(data), '_blank');
    };

    function ensureQrModalPortal() {
        var modal = byId('svQrHubModal');
        if (modal && modal.parentNode !== document.body) {
            document.body.appendChild(modal);
        }
    }

    function lockPageScroll() {
        document.documentElement.style.overflow = 'hidden';
        document.body.style.overflow = 'hidden';
    }

    function unlockPageScroll() {
        document.documentElement.style.overflow = '';
        document.body.style.overflow = '';
    }

    window.openQrHubModal = function (tab) {
        ensureQrModalPortal();
        var modal = byId('svQrHubModal');
        if (!modal) return;

        modal.classList.remove('hidden');
        modal.setAttribute('aria-hidden', 'false');
        lockPageScroll();

        switchQrHubTab(tab || 'show');
        renderDashQr();
    };

    window.closeQrHubModal = function () {
        var modal = byId('svQrHubModal');
        if (!modal) return;

        stopQrScanner().then(function () {
            resetQrScanFlow(false);
        });

        modal.classList.add('hidden');
        modal.setAttribute('aria-hidden', 'true');
        unlockPageScroll();
    };

    window.switchQrHubTab = function (tab) {
        document.querySelectorAll('.sv-qr-hub__tab').forEach(function (btn) {
            btn.classList.toggle('sv-qr-hub__tab--active', btn.getAttribute('data-tab') === tab);
        });

        var showPanel = byId('svQrTabShow');
        var scanPanel = byId('svQrTabScan');
        if (showPanel) showPanel.classList.toggle('sv-qr-hub__panel--active', tab === 'show');
        if (scanPanel) scanPanel.classList.toggle('sv-qr-hub__panel--active', tab === 'scan');

        if (tab === 'show') {
            stopQrScanner();
            renderDashQr();
        } else if (tab === 'scan') {
            stopQrScanner().then(function () {
                resetQrScanFlow(true);
            });
        }
    };

    function showScanStep(step) {
        ['svQrScanStep1', 'svQrScanStep2', 'svQrScanStep3'].forEach(function (id, idx) {
            var el = byId(id);
            if (el) el.classList.toggle('hidden', step !== idx + 1);
        });
    }

    window.resetQrScanFlow = function (autoStart) {
        if (autoStart === undefined) autoStart = true;

        scanState.toUserId = '';
        scanState.toUserName = '';
        lastScannedAt = 0;

        if (byId('txtQrTxnPass')) byId('txtQrTxnPass').value = '';
        if (byId('txtQrTxnUserId')) byId('txtQrTxnUserId').value = '';
        if (byId('txtQrAmount')) byId('txtQrAmount').value = '';

        var badge = byId('svQrRecipientBadge');
        if (badge) badge.innerHTML = '';

        setMsg('svQrTxnMsg', '');
        setMsg('svQrTransferMsg', '');
        setScanMsg('', false);
        setVerifyContinueEnabled(true);

        showScanStep(1);

        if (autoStart && isScanTabActive()) {
            window.startQrScanner();
        }
    };

    function onQrScanned(decodedText) {
        var parsed = parseProfileQr(decodedText);
        if (!parsed || !parsed.userId) {
            setScanMsg('Invalid profile QR. Scan a USDTWorld member profile QR.', true);
            return;
        }

        var qrRecipient = {
            userId: parsed.userId,
            userName: parsed.name || ''
        };

        stopQrScanner().then(function () {
            proceedToTxnStep(
                qrRecipient.userId,
                qrRecipient.userName,
                'Recipient: ' + qrRecipient.userId + (qrRecipient.userName ? ' — ' + qrRecipient.userName : '')
            );

            if (qrRecipient.userId.toLowerCase() === getUserId().toLowerCase()) {
                setMsg('svQrTxnMsg', 'Cannot transfer to yourself.', true);
                setVerifyContinueEnabled(false);
                return;
            }

            postWebMethod('LookupQrRecipient', { userId: qrRecipient.userId }, function (res) {
                if (res && res.success) {
                    scanState.toUserId = res.userId;
                    scanState.toUserName = res.userName;
                    setMsg('svQrTxnMsg', 'Recipient: ' + res.userId + ' — ' + res.userName, false);
                    setVerifyContinueEnabled(true);
                    return;
                }
                if (res && res.message) {
                    setMsg('svQrTxnMsg', res.message, true);
                }
                setVerifyContinueEnabled(false);
            });
        });
    }

    window.verifyQrTxnPassword = function () {
        var btn = byId('btnQrVerifyContinue');
        if (btn && btn.disabled) return;

        var password = byId('txtQrTxnPass') ? byId('txtQrTxnPass').value : '';
        setMsg('svQrTxnMsg', '');

        if (!password) {
            setMsg('svQrTxnMsg', 'Enter transaction password.', true);
            return;
        }

        postWebMethod('ValidateQrTxnPassword', { password: password }, function (res) {
            if (!res || !res.success) {
                setMsg('svQrTxnMsg', res && res.message ? res.message : 'Verification failed.', true);
                return;
            }
            openTransferForm();
        });
    };

    function openTransferForm() {
        if (byId('txtQrBalance')) byId('txtQrBalance').value = getBalance();
        if (byId('txtQrAmount')) byId('txtQrAmount').value = '';

        showScanStep(3);
        setMsg('svQrTransferMsg', '');
    }

    window.submitQrTransfer = function () {
        var amount = byId('txtQrAmount') ? byId('txtQrAmount').value : '';
        setMsg('svQrTransferMsg', '');

        if (!amount || parseFloat(amount) <= 0) {
            setMsg('svQrTransferMsg', 'Enter a valid transfer amount.', true);
            return;
        }

        postWebMethod('SubmitQrTransfer', { toUserId: scanState.toUserId, amount: amount }, function (res) {
            if (!res || !res.success) {
                setMsg('svQrTransferMsg', res && res.message ? res.message : 'Transfer failed.', true);
                return;
            }

            if (res.balance && byId('hdnDashBalance')) {
                byId('hdnDashBalance').value = res.balance;
            }
            if (byId('txtQrBalance') && res.balance) {
                byId('txtQrBalance').value = res.balance;
            }

            alert(res.message || 'Transfer successful.');
            closeQrHubModal();
        });
    };

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') closeQrHubModal();
    });

    document.addEventListener('change', function (e) {
        if (e.target && e.target.id === 'qrScannerFile') {
            scanQrFromFile(e.target);
        }
    });

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function () {
            ensureQrModalPortal();
            renderDashQr();
        });
    } else {
        ensureQrModalPortal();
        renderDashQr();
    }
})();
