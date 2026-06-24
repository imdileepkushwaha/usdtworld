<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmRegistration.aspx.cs" Inherits="user_ConfirmRegistration" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= clsUtility.ProjectName %> – Registration Successful</title>
    <link rel="icon" href="img/favicon.png" type="image/x-icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link href="css/auth.css" rel="stylesheet" />
    <link href="css/auth-overrides.css" rel="stylesheet" />
    <link href="css/confirm-registration.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-bg">
            <div class="bg-orb bg-orb--1"></div>
            <div class="bg-orb bg-orb--2"></div>
            <div class="bg-orb bg-orb--3"></div>
            <div class="bg-orb bg-orb--4"></div>
            <div class="bg-orb bg-orb--5"></div>
        </div>
        <div class="grid-overlay"></div>

        <div class="auth-wrapper confirm-page">
            <div class="sv-confirm-card">
                <div class="sv-confirm-card__glow"></div>

                <div class="sv-confirm-card__success" aria-hidden="true">
                    <i class="fa-solid fa-circle-check"></i>
                </div>

                <img src="../img/usdtw.png" alt="<%= clsUtility.ProjectName %>" class="sv-confirm-card__logo" onerror="this.onerror=null;this.src='../img/usdtw.png';" />

                <h1 class="sv-confirm-card__title">Registration Successful!</h1>
                <p class="sv-confirm-card__subtitle">
                    Welcome to <strong><%= clsUtility.ProjectName %></strong> — your account has been created. Save your credentials below before logging in.
                </p>

                <div class="sv-confirm-credentials">
                    <div class="sv-confirm-cred">
                        <span class="sv-confirm-cred__label">
                            <i class="fa-solid fa-id-badge"></i> Trading ID
                        </span>
                        <div class="sv-confirm-cred__right">
                            <span class="sv-confirm-cred__value" id="valLoginId"><asp:Label ID="LblLoginId" runat="server"></asp:Label></span>
                            <button type="button" class="sv-confirm-copy" data-copy-target="valLoginId" aria-label="Copy Trading ID" title="Copy">
                                <i class="fa-regular fa-copy"></i>
                            </button>
                        </div>
                    </div>
                    <div class="sv-confirm-cred">
                        <span class="sv-confirm-cred__label">
                            <i class="fa-solid fa-lock"></i> Password
                        </span>
                        <div class="sv-confirm-cred__right">
                            <span class="sv-confirm-cred__value" id="valPassword"><asp:Label ID="LblPassword" runat="server"></asp:Label></span>
                            <button type="button" class="sv-confirm-copy" data-copy-target="valPassword" aria-label="Copy Password" title="Copy">
                                <i class="fa-regular fa-copy"></i>
                            </button>
                        </div>
                    </div>
                    <div class="sv-confirm-cred">
                        <span class="sv-confirm-cred__label">
                            <i class="fa-solid fa-key"></i> Transaction Password
                        </span>
                        <div class="sv-confirm-cred__right">
                            <span class="sv-confirm-cred__value" id="valTransPassword"><asp:Label ID="LblCOnfirmPassword" runat="server"></asp:Label></span>
                            <button type="button" class="sv-confirm-copy" data-copy-target="valTransPassword" aria-label="Copy Transaction Password" title="Copy">
                                <i class="fa-regular fa-copy"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <p class="sv-confirm-note">
                    <i class="fa-solid fa-triangle-exclamation"></i>
                    Please log in and change your password for security. Happy trading!
                </p>

                <a href="index.aspx" class="btn-login">
                    <span class="btn-text">
                        Login Now
                        <i class="fa-solid fa-arrow-right"></i>
                    </span>
                </a>

                <asp:Label ID="LblSponsorName" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="LblSponsorId" runat="server" style="display:none"></asp:Label>
            </div>
        </div>
    </form>

    <script>
        (function () {
            function copyText(text, btn) {
                if (!text) return;

                function showCopied() {
                    btn.classList.add('sv-confirm-copy--done');
                    var icon = btn.querySelector('i');
                    if (icon) {
                        icon.classList.remove('fa-copy', 'fa-regular');
                        icon.classList.add('fa-check', 'fa-solid');
                    }
                    setTimeout(function () {
                        btn.classList.remove('sv-confirm-copy--done');
                        if (icon) {
                            icon.classList.remove('fa-check', 'fa-solid');
                            icon.classList.add('fa-copy', 'fa-regular');
                        }
                    }, 1600);
                }

                if (navigator.clipboard && navigator.clipboard.writeText) {
                    navigator.clipboard.writeText(text).then(showCopied).catch(fallbackCopy);
                } else {
                    fallbackCopy();
                }

                function fallbackCopy() {
                    var ta = document.createElement('textarea');
                    ta.value = text;
                    ta.style.position = 'fixed';
                    ta.style.left = '-9999px';
                    document.body.appendChild(ta);
                    ta.select();
                    try {
                        document.execCommand('copy');
                        showCopied();
                    } catch (e) { }
                    document.body.removeChild(ta);
                }
            }

            document.querySelectorAll('.sv-confirm-copy').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    var targetId = btn.getAttribute('data-copy-target');
                    var el = document.getElementById(targetId);
                    if (!el) return;
                    copyText((el.textContent || '').trim(), btn);
                });
            });
        })();
    </script>
</body>
</html>
