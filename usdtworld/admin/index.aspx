<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= clsUtility.ProjectName %> – Admin Login</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.4/dist/aos.css" />
    <link href="../user/css/auth.css" rel="stylesheet" />
    <link href="../user/css/auth-overrides.css" rel="stylesheet" />
    <link href="css/admin-auth.css" rel="stylesheet" />
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

        <div class="auth-wrapper login-page admin-login-page">
            <a href="../index.aspx" class="back-home-btn" data-aos="fade-right" data-aos-duration="600">
                <i class="fa-solid fa-arrow-left"></i>
                <span>Back to Home</span>
            </a>

            <div class="auth-card" data-aos="fade-up" data-aos-duration="900" data-aos-easing="ease-out-cubic">
                <div class="auth-brand">
                    <div class="brand-orb brand-orb--1"></div>
                    <div class="brand-orb brand-orb--2"></div>
                    <div class="brand-orb brand-orb--3"></div>

                    <div class="particle particle--1"></div>
                    <div class="particle particle--2"></div>
                    <div class="particle particle--3"></div>
                    <div class="particle particle--4"></div>
                    <div class="particle particle--5"></div>

                    <div class="geo-deco geo-deco--ring"></div>
                    <div class="geo-deco geo-deco--diamond"></div>
                    <div class="geo-deco geo-deco--triangle"></div>
                    <div class="geo-deco geo-deco--dots">
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                        <span></span><span></span><span></span>
                    </div>

                    <div class="brand-content">
                        <div class="logo-wrapper">
                            <img src="../img/usdtw.png" alt="<%= clsUtility.ProjectName %>" class="auth-brand-logo__img" onerror="this.onerror=null;this.src='../user/img/logo.png';" />
                        </div>
                        <p class="brand-tagline">Secure control center for platform operations,<br />reports, and member management.</p>

                        <ul class="brand-features">
                            <li class="brand-feature">
                                <div class="feature-icon feature-icon--admin">
                                    <i class="fa-solid fa-gauge-high"></i>
                                </div>
                                <div class="feature-text">
                                    <h4>Control Center</h4>
                                    <p>Manage users, wallets, top-ups &amp; payouts</p>
                                </div>
                            </li>
                            <li class="brand-feature">
                                <div class="feature-icon feature-icon--cyan">
                                    <i class="fa-solid fa-chart-pie"></i>
                                </div>
                                <div class="feature-text">
                                    <h4>Analytics &amp; Reports</h4>
                                    <p>Real-time business and transaction insights</p>
                                </div>
                            </li>
                            <li class="brand-feature">
                                <div class="feature-icon feature-icon--gold">
                                    <i class="fa-solid fa-user-shield"></i>
                                </div>
                                <div class="feature-text">
                                    <h4>Role-Based Access</h4>
                                    <p>Protected admin authentication layer</p>
                                </div>
                            </li>
                            <li class="brand-feature">
                                <div class="feature-icon feature-icon--green">
                                    <i class="fa-solid fa-sliders"></i>
                                </div>
                                <div class="feature-text">
                                    <h4>System Settings</h4>
                                    <p>Configure packages, bonuses &amp; policies</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="auth-form-panel">
                    <div class="form-header" data-aos="fade-left" data-aos-delay="200">
                        <div class="admin-role-badge">
                            <i class="fa-solid fa-shield-halved" aria-hidden="true"></i>
                            <span>Administrator</span>
                        </div>
                        <h2>Admin Portal</h2>
                        <p>Sign in with your administrator credentials</p>
                    </div>

                    <div id="loginForm" data-aos="fade-left" data-aos-delay="300">
                        <div class="input-group">
                            <i class="fa-solid fa-user-tie input-group__icon"></i>
                            <asp:TextBox ID="txtusername" runat="server" CssClass="input-group__field" placeholder="Username" autocomplete="username"></asp:TextBox>
                            <label for="<%= txtusername.ClientID %>" class="input-group__label">Username</label>
                        </div>

                        <div class="input-group">
                            <i class="fa-solid fa-lock input-group__icon"></i>
                            <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="input-group__field" placeholder="Password" autocomplete="current-password"></asp:TextBox>
                            <label for="<%= txtpassword.ClientID %>" class="input-group__label">Password</label>
                            <button type="button" class="input-group__toggle" id="btnTogglePass" aria-label="Toggle password visibility">
                                <i class="fa-regular fa-eye"></i>
                            </button>
                        </div>

                        <asp:LinkButton runat="server" ID="btnLogin" CssClass="btn-login" OnClick="btnLogin_Click">
                            <span class="btn-text">
                                Sign In to Dashboard
                                <i class="fa-solid fa-arrow-right"></i>
                            </span>
                        </asp:LinkButton>
                    </div>

                    <div class="auth-footer" data-aos="fade-left" data-aos-delay="400">
                        <p>Member login? <a href="../user/index.aspx">Go to user portal &rarr;</a></p>
                    </div>

                    <div class="security-badge" data-aos="fade-up" data-aos-delay="500">
                        <i class="fa-solid fa-lock"></i>
                        <span>Restricted area — authorized personnel only</span>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 700, once: true, offset: 60, easing: 'ease-out-cubic', disable: 'mobile' });
    </script>
    <script src="../user/js/auth-login.js"></script>
</body>
</html>
