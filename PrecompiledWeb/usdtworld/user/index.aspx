<%@ page language="C#" autoeventwireup="true" inherits="admin_index, App_Web_syyoiqwe" %>


<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= clsUtility.ProjectName %> – Login</title>
    <link rel="icon" href="img/favicon.png" type="image/x-icon" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.4/dist/aos.css" />
    <link href="css/auth.css" rel="stylesheet" />
    <link href="css/auth-overrides.css" rel="stylesheet" />
    <script>
        function validate2() {
            if (document.getElementById("<%=TxtOtp.ClientID%>").value == "") {
                alert('Enter OTP');
                document.getElementById("<%=TxtOtp.ClientID%>").focus();
                return false;
            }
        }
        function validate3() {
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                alert('Enter User Id');
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }
        }
        function validate5() {
            if (document.getElementById("<%=TxtResetotp.ClientID%>").value == "") {
                alert('Enter OTP');
                document.getElementById("<%=TxtResetotp.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtNewPassword.ClientID%>").value == "") {
                alert('Enter New Password');
                document.getElementById("<%=TxtNewPassword.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtConfirmpassword.ClientID%>").value == "") {
                alert('Enter Confirm Password');
                document.getElementById("<%=TxtConfirmpassword.ClientID%>").focus();
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="uplMaster" DisplayAfter="150">
            <ProgressTemplate>
                <div class="auth-loader-overlay" role="status" aria-live="polite" aria-label="Loading">
                    <div class="auth-loader-card">
                        <div class="auth-loader-spinner" aria-hidden="true">
                            <span class="auth-loader-ring auth-loader-ring--outer"></span>
                            <span class="auth-loader-ring auth-loader-ring--inner"></span>
                            <span class="auth-loader-core">
                                <i class="fa-solid fa-chart-line"></i>
                            </span>
                        </div>
                        <p class="auth-loader-title">Please wait</p>
                        <p class="auth-loader-text">Signing you in<span class="auth-loader-dots"><span>.</span><span>.</span><span>.</span></span></p>
                        <div class="auth-loader-bar" aria-hidden="true"><span></span></div>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel runat="server" ID="uplMaster">
            <ContentTemplate>

                <!-- Animated Background -->
                <div class="auth-bg">
                    <div class="bg-orb bg-orb--1"></div>
                    <div class="bg-orb bg-orb--2"></div>
                    <div class="bg-orb bg-orb--3"></div>
                    <div class="bg-orb bg-orb--4"></div>
                    <div class="bg-orb bg-orb--5"></div>
                </div>
                <div class="grid-overlay"></div>

                <!-- Auth Wrapper -->
                <div class="auth-wrapper login-page">
                    <a href="../index.html" class="back-home-btn" data-aos="fade-right" data-aos-duration="600">
                        <i class="fa-solid fa-arrow-left"></i>
                        <span>Back to Home</span>
                    </a>

                    <div class="auth-card" data-aos="fade-up" data-aos-duration="900" data-aos-easing="ease-out-cubic">

                        <!-- Left Branding Panel -->
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
                                    <div class="brand-logo"><%= clsUtility.ProjectName %></div>
                                </div>
                                <p class="brand-tagline">Your premium social trading platform.<br />Smarter insights. Bigger returns.</p>

                                <ul class="brand-features">
                                    <li class="brand-feature">
                                        <div class="feature-icon">
                                            <i class="fa-solid fa-chart-line"></i>
                                        </div>
                                        <div class="feature-text">
                                            <h4>Real-Time Analytics</h4>
                                            <p>Live market data with AI-powered signals</p>
                                        </div>
                                    </li>
                                    <li class="brand-feature">
                                        <div class="feature-icon feature-icon--cyan">
                                            <i class="fa-solid fa-users-gear"></i>
                                        </div>
                                        <div class="feature-text">
                                            <h4>Copy Trading</h4>
                                            <p>Follow top traders and mirror their moves</p>
                                        </div>
                                    </li>
                                    <li class="brand-feature">
                                        <div class="feature-icon feature-icon--gold">
                                            <i class="fa-solid fa-shield-halved"></i>
                                        </div>
                                        <div class="feature-text">
                                            <h4>Bank-Grade Security</h4>
                                            <p>256-bit encryption &amp; 2FA authentication</p>
                                        </div>
                                    </li>
                                    <li class="brand-feature">
                                        <div class="feature-icon feature-icon--green">
                                            <i class="fa-solid fa-bolt"></i>
                                        </div>
                                        <div class="feature-text">
                                            <h4>Lightning Execution</h4>
                                            <p>Sub-millisecond order execution speed</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- Right Form Panel -->
                        <div class="auth-form-panel">
                            <div class="form-header" data-aos="fade-left" data-aos-delay="200">
                                <h2>Welcome back</h2>
                                <p>Sign in to your trading account</p>
                            </div>

                            <div id="loginForm" data-aos="fade-left" data-aos-delay="300">
                                <div class="input-group">
                                    <i class="fa-regular fa-envelope input-group__icon"></i>
                                    <asp:TextBox ID="txtusername" runat="server" CssClass="input-group__field" placeholder="Trade ID" autocomplete="username"></asp:TextBox>
                                    <label for="<%= txtusername.ClientID %>" class="input-group__label">Trade ID</label>
                                </div>

                                <div class="input-group">
                                    <i class="fa-solid fa-lock input-group__icon"></i>
                                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="input-group__field" placeholder="Password" autocomplete="current-password"></asp:TextBox>
                                    <label for="<%= txtpassword.ClientID %>" class="input-group__label">Password</label>
                                    <button type="button" class="input-group__toggle" id="btnTogglePass" aria-label="Toggle password visibility">
                                        <i class="fa-regular fa-eye"></i>
                                    </button>
                                </div>

                                <div class="form-row">
                                    <label class="custom-checkbox">
                                        <input type="checkbox" id="chkRemember" />
                                        <div class="checkbox-visual"></div>
                                        <span>Remember me</span>
                                    </label>
                                    <a href="javascript:void(0)" id="forgotLink" class="forgot-link">Forgot password?</a>
                                </div>

                                <asp:LinkButton runat="server" ID="btnLogin" CssClass="btn-login" OnClick="btnLogin_Click">
                                    <span class="btn-text">
                                        Sign In
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </span>
                                </asp:LinkButton>
                            </div>

                            <div class="auth-footer" data-aos="fade-left" data-aos-delay="400">
                                <p>Don't have an account? <a href="../Register.aspx">Create one free &rarr;</a></p>
                            </div>

                            <div class="security-badge" data-aos="fade-up" data-aos-delay="500">
                                <i class="fa-solid fa-lock"></i>
                                <span>Secured with 256-bit SSL encryption</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Forgot Password Modal -->
                <div id="myModal" class="modal-overlay hidden modal-overlay--static">
                    <div class="modal-card">
                        <button type="button" class="modal-close" data-close-modal="myModal" aria-label="Close forgot password dialog">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                        <div class="modal-header">
                            <h3>Forgot your password?</h3>
                            <p>Enter your registered email or user ID. We will send password recovery instructions to your email.</p>
                        </div>
                        <div class="input-group">
                            <i class="fa-regular fa-user input-group__icon"></i>
                            <asp:TextBox ID="txtuserid" runat="server" CssClass="input-group__field" placeholder="Email or User ID"></asp:TextBox>
                            <label for="<%= txtuserid.ClientID %>" class="input-group__label">Email or User ID</label>
                        </div>
                        <div id="divsuccess" runat="server" visible="false" class="alert-success">
                            <strong>Success!</strong> <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>
                        </div>
                        <asp:Button ID="btnSend" runat="server" Text="Confirm &amp; Send Email" OnClientClick="return validate3();" CssClass="btn-login" OnClick="btnSend_Click" />
                    </div>
                </div>

                <!-- OTP Confirmation Modal -->
                <div id="Divotp" class="modal-overlay hidden modal-overlay--static">
                    <div class="modal-card">
                        <button type="button" class="modal-close" data-close-modal="Divotp" aria-label="Close OTP dialog">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                        <div class="modal-header">
                            <h3>OTP Confirmation</h3>
                            <p>Enter the OTP sent to your registered mobile number.</p>
                        </div>
                        <div class="input-group">
                            <i class="fa-solid fa-key input-group__icon"></i>
                            <asp:TextBox ID="TxtOtp" runat="server" CssClass="input-group__field" placeholder="Enter OTP"></asp:TextBox>
                            <label for="<%= TxtOtp.ClientID %>" class="input-group__label">OTP</label>
                        </div>
                        <asp:Label ID="LblMessages" runat="server" Text="Invalid OTP please enter valid OTP...!" CssClass="bg-red-active" Visible="false"></asp:Label>
                        <div id="div2" runat="server" visible="false" class="alert-success">
                            <strong>Success!</strong> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </div>
                        <div class="form-row-actions">
                            <asp:Button ID="BtnConfirm" runat="server" Text="Submit OTP" OnClientClick="return validate2();" CssClass="btn-login" OnClick="BtnConfirm_Click" />
                            <asp:Button ID="BtnResend" runat="server" Text="Resend OTP" CssClass="btn-secondary-modal" OnClick="BtnResend_Click" />
                        </div>
                    </div>
                </div>

                <!-- Reset Password Modal -->
                <div id="Divreset" class="modal-overlay hidden modal-overlay--static">
                    <div class="modal-card">
                        <button type="button" class="modal-close" data-close-modal="Divreset" aria-label="Close reset password dialog">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                        <div class="modal-header">
                            <h3>Reset Password</h3>
                            <p>Enter OTP and set your new password.</p>
                        </div>
                        <div class="input-group">
                            <i class="fa-solid fa-key input-group__icon"></i>
                            <asp:TextBox ID="TxtResetotp" runat="server" CssClass="input-group__field" placeholder="Enter OTP"></asp:TextBox>
                            <label for="<%= TxtResetotp.ClientID %>" class="input-group__label">OTP</label>
                        </div>
                        <asp:Label ID="Label2" runat="server" Text="Invalid OTP please enter valid OTP...!" CssClass="bg-red-active" Visible="false"></asp:Label>
                        <div class="input-group">
                            <i class="fa-solid fa-lock input-group__icon"></i>
                            <asp:TextBox ID="TxtNewPassword" runat="server" TextMode="Password" CssClass="input-group__field" placeholder="New password"></asp:TextBox>
                            <label for="<%= TxtNewPassword.ClientID %>" class="input-group__label">New Password</label>
                            <button type="button" class="input-group__toggle" onclick="Toggle1()" aria-label="Show password">
                                <i id="toggleNewPasswordIcon" class="fa-regular fa-eye"></i>
                            </button>
                        </div>
                        <div class="input-group">
                            <i class="fa-solid fa-lock input-group__icon"></i>
                            <asp:TextBox ID="TxtConfirmpassword" runat="server" TextMode="Password" CssClass="input-group__field" placeholder="Confirm password"></asp:TextBox>
                            <label for="<%= TxtConfirmpassword.ClientID %>" class="input-group__label">Confirm Password</label>
                            <button type="button" class="input-group__toggle" onclick="Toggle2()" aria-label="Show password">
                                <i id="toggleConfirmPasswordIcon" class="fa-regular fa-eye"></i>
                            </button>
                        </div>
                        <div id="div1" runat="server" visible="false" class="alert-success">
                            <strong>Success!</strong> <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Submit OTP" OnClientClick="return validate5();" CssClass="btn-login" OnClick="Button1_Click" />
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 700, once: true, offset: 60, easing: 'ease-out-cubic', disable: 'mobile' });
    </script>
    <script src="js/auth-login.js"></script>
</body>
</html>
