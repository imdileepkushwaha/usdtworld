<%@ page language="C#" autoeventwireup="true" CodeFile="Register.aspx.cs" inherits="Register" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%= clsUtility.ProjectName %> – Join USDTW Presale</title>
    <meta name="application-name" content="<%= clsUtility.ProjectName %> - USDTW Token Presale" />
    <meta name="author" content="<%= clsUtility.Company %>" />
    <meta name="keywords" content="<%= clsUtility.ProjectName %>, USDTW, Crypto Token, Launchpad, Presale" />
    <meta name="description" content="Create your <%= clsUtility.ProjectName %> account and join the USDTW token presale at $0.000139." />
    <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&amp;family=Space+Grotesk:wght@400;500;600;700&amp;display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/auth.css" />
    <link rel="stylesheet" href="assets/css/register-overrides.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.4/dist/aos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="150">
            <ProgressTemplate>
                <div class="auth-loader-overlay" role="status" aria-live="polite" aria-label="Loading">
                    <div class="auth-loader-card">
                        <div class="auth-loader-spinner" aria-hidden="true">
                            <span class="auth-loader-ring auth-loader-ring--outer"></span>
                            <span class="auth-loader-ring auth-loader-ring--inner"></span>
                            <span class="auth-loader-core">
                                <i class="fa-solid fa-user-plus"></i>
                            </span>
                        </div>
                        <p class="auth-loader-title">Please wait</p>
                        <p class="auth-loader-text">Setting up your USDTW account<span class="auth-loader-dots"><span>.</span><span>.</span><span>.</span></span></p>
                        <div class="auth-loader-bar" aria-hidden="true"><span></span></div>
                    </div>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>

        <div class="auth-bg-orb auth-bg-orb--1"></div>
        <div class="auth-bg-orb auth-bg-orb--2"></div>
        <div class="auth-bg-orb auth-bg-orb--3"></div>
        <div class="auth-bg-orb auth-bg-orb--4"></div>
        <div class="auth-grid-overlay"></div>
        <canvas id="registerParticles"></canvas>

        <div class="auth-wrapper register-page">
            <div class="auth-card">

                <div class="auth-brand">
                    <div class="brand-dots">
                        <span class="brand-dot"></span>
                        <span class="brand-dot"></span>
                        <span class="brand-dot"></span>
                        <span class="brand-dot"></span>
                        <span class="brand-dot"></span>
                        <span class="brand-dot"></span>
                        <span class="brand-dot"></span>
                        <span class="brand-dot"></span>
                    </div>
                    <div class="brand-orb brand-orb--1"></div>
                    <div class="brand-orb brand-orb--2"></div>
                    <div class="brand-orb brand-orb--3"></div>

                    <div class="brand-content">
                        <div class="auth-brand-logo">
                            <img src="img/usdtw.png" alt="<%= clsUtility.ProjectName %>" class="auth-brand-logo__img" onerror="this.onerror=null;this.src='user/img/logo.png';" />
                            <!-- <div class="brand-logo"><%= clsUtility.ProjectName %></div> -->
                        </div>
                        <div class="brand-tagline">Join the USDTW Token Presale</div>

                        <div class="steps-process">
                            <div class="step-item" data-aos="fade-right" data-aos-delay="300">
                                <div class="step-circle">1</div>
                                <div class="step-info">
                                    <h4>Create Account</h4>
                                    <p>Register with your details below</p>
                                </div>
                                <div class="step-connector">
                                    <div class="step-connector-line"></div>
                                </div>
                            </div>
                            <div class="step-item" data-aos="fade-right" data-aos-delay="450">
                                <div class="step-circle">2</div>
                                <div class="step-info">
                                    <h4>Verify Identity</h4>
                                    <p>Quick &amp; secure KYC verification</p>
                                </div>
                                <div class="step-connector">
                                    <div class="step-connector-line"></div>
                                </div>
                            </div>
                            <div class="step-item" data-aos="fade-right" data-aos-delay="600">
                                <div class="step-circle">3</div>
                                <div class="step-info">
                                    <h4>Buy USDTW</h4>
                                    <p>Secure tokens at $0.000139 &amp; access launchpad</p>
                                </div>
                            </div>
                        </div>

                        <div class="trust-badges">
                            <div class="trust-badge">
                                <i class="fas fa-coins"></i>
                                <span>USDTW Presale</span>
                            </div>
                            <div class="trust-badge">
                                <i class="fas fa-lock"></i>
                                <span>256-bit Encryption</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="auth-form-panel">
                    <div class="mobile-brand-logo">
                        <img src="user/img/usdt.png" alt="<%= clsUtility.ProjectName %>" class="auth-brand-logo__img auth-brand-logo__img--sm" onerror="this.onerror=null;this.src='user/img/logo.png';" />
                        <span><%= clsUtility.ProjectName %></span>
                    </div>

                    <div class="auth-form-header">
                        <h1>Join USDTW Presale</h1>
                        <p>Create your account and secure USDTW at $0.000139 per token</p>
                    </div>

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div id="registerForm">
                                <div class="form-row">
                                    <div class="form-group" data-aos="fade-up" data-aos-delay="100">
                                        <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-group__input" runat="server" placeholder="Sponsor ID"></asp:TextBox>
                                        <i class="fas fa-id-badge form-group__icon"></i>
                                        <div class="form-group__glow"></div>
                                    </div>
                                    <div class="form-group" data-aos="fade-up" data-aos-delay="120">
                                        <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-group__input" runat="server" placeholder="Sponsor Name"></asp:TextBox>
                                        <i class="fas fa-user-check form-group__icon"></i>
                                        <div class="form-group__glow"></div>
                                    </div>
                                </div>

                                <div class="form-row form-row--name">
                                    <div class="form-group form-group--prefix" data-aos="fade-up" data-aos-delay="130">
                                        <asp:DropDownList ID="ddpp" CssClass="form-group__input" runat="server">
                                            <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                            <asp:ListItem Value="Miss">Miss</asp:ListItem>
                                        </asp:DropDownList>
                                        <i class="fas fa-user-tag form-group__icon"></i>
                                        <div class="form-group__glow"></div>
                                    </div>
                                    <div class="form-group" data-aos="fade-up" data-aos-delay="140">
                                        <asp:TextBox ID="txtname" CssClass="form-group__input" runat="server" placeholder="First Name"></asp:TextBox>
                                        <i class="fas fa-user form-group__icon"></i>
                                        <div class="form-group__glow"></div>
                                    </div>
                                    <div class="form-group" data-aos="fade-up" data-aos-delay="150">
                                        <asp:TextBox ID="txtlastname" CssClass="form-group__input" runat="server" placeholder="Last Name"></asp:TextBox>
                                        <i class="fas fa-user form-group__icon"></i>
                                        <div class="form-group__glow"></div>
                                    </div>
                                </div>

                                <div class="form-group" data-aos="fade-up" data-aos-delay="170">
                                    <asp:TextBox ID="txtemail" CssClass="form-group__input" runat="server" placeholder="Email Address"></asp:TextBox>
                                    <i class="fas fa-envelope form-group__icon"></i>
                                    <div class="form-group__glow"></div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group" data-aos="fade-up" data-aos-delay="190">
                                        <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-group__input" runat="server" maxlength="14" placeholder="Phone Number"></asp:TextBox>
                                        <i class="fas fa-phone form-group__icon"></i>
                                        <div class="form-group__glow"></div>
                                    </div>
                                    <div class="form-group" data-aos="fade-up" data-aos-delay="210">
                                        <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-group__input" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Country</asp:ListItem>
                                        </asp:DropDownList>
                                        <i class="fas fa-globe form-group__icon"></i>
                                        <div class="form-group__glow"></div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group form-group--password" data-aos="fade-up" data-aos-delay="230">
                                        <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-group__input" runat="server" placeholder="Create Password"></asp:TextBox>
                                        <i class="fas fa-lock form-group__icon"></i>
                                        <button type="button" class="password-toggle" onclick="toggleAspPassword('<%= txtuserpassword.ClientID %>', this)">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <div class="form-group__glow"></div>
                                    </div>
                                    <div class="form-group form-group--password" data-aos="fade-up" data-aos-delay="250">
                                        <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-group__input" runat="server" placeholder="Confirm Password"></asp:TextBox>
                                        <i class="fas fa-shield-halved form-group__icon"></i>
                                        <button type="button" class="password-toggle" onclick="toggleAspPassword('<%= txtconfirmpassword.ClientID %>', this)">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <div class="form-group__glow"></div>
                                    </div>
                                </div>

                                <div class="password-strength" data-aos="fade-up" data-aos-delay="270">
                                    <div class="strength-bar-track">
                                        <div class="strength-bar-fill" id="strengthBar"></div>
                                    </div>
                                    <div class="strength-label" id="strengthLabel"></div>
                                </div>

                                <div class="terms-group" data-aos="fade-up" data-aos-delay="350">
                                    <label class="terms-checkbox">
                                        <input type="checkbox" id="chkTerms" checked="checked" />
                                        <span class="checkmark"></span>
                                    </label>
                                    <div class="terms-text">
                                        I agree to the <a href="Terms_Conditions.html" target="_blank">Terms of Service</a> and <a href="#">Privacy Policy</a>.
                                    </div>
                                </div>

                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="auth-submit-btn" runat="server" Text="Create Account &amp; Join Presale" OnClick="btnSubmit_Click" data-aos="fade-up" data-aos-delay="400" />
                            </div>

                            <div class="register-hidden-fields" aria-hidden="true">
                                <asp:TextBox ID="txtparentname" Enabled="false" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtparentid" AutoPostBack="true" runat="server" OnTextChanged="txtparentid_TextChanged"></asp:TextBox>
                                <asp:TextBox ID="txtepin" runat="server" Enabled="false"></asp:TextBox>
                                <asp:TextBox ID="txtamount" Enabled="false" runat="server"></asp:TextBox>
                                <asp:RadioButton ID="RdBtnFree" runat="server" Text="Free Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnFree_CheckedChanged" />
                                <asp:RadioButton ID="RdBtnEpin" runat="server" Text="E-Pin Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnEpin_CheckedChanged" />
                                <asp:Panel ID="pnlpin" Visible="false" runat="server">
                                    <asp:DropDownList ID="DDLstPlan" AutoPostBack="true" OnSelectedIndexChanged="DDLstPlan_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    <asp:DropDownList ID="ddepin" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                </asp:Panel>
                                <asp:RadioButton ID="RdBtnLeft" runat="server" Text="Left" GroupName="B" />
                                <asp:RadioButton ID="RdBtnRight" runat="server" Text="Right" GroupName="B" />
                                <asp:DropDownList ID="ddposition" runat="server">
                                    <asp:ListItem Value="0">Select Position</asp:ListItem>
                                    <asp:ListItem Value="Left">Left</asp:ListItem>
                                    <asp:ListItem Value="Right">Right</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                    <asp:ListItem Value="Transgender">Transgender</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddlYear" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlMonth" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlDay" runat="server"></asp:DropDownList>
                                <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
                                <asp:TextBox ID="TextBox3" TextMode="MultiLine" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="ddcounssstry" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged"></asp:DropDownList>
                                <asp:DropDownList ID="ddstate" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Select State</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddcity" runat="server">
                                    <asp:ListItem Value="0">Select City</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtnomineename" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="ddrelation" runat="server">
                                    <asp:ListItem Value="0">Select Relation</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtaadhar" runat="server" MaxLength="12"></asp:TextBox>
                                <asp:TextBox ID="txtheight" runat="server"></asp:TextBox>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="ddgender" runat="server">
                                    <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtPanNumber" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtaccountholdername" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtaccountno" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtifsccode" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="ddbank" runat="server">
                                    <asp:ListItem Value="0">Select Bank</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtpincode" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txtareaname" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt123mobile" runat="server" maxlength="10"></asp:TextBox>
                                <asp:TextBox ID="txt123nomineename" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="ddlYear2" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged2" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlMonth2" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged2" runat="server"></asp:DropDownList>
                                <asp:DropDownList ID="ddlDay2" runat="server"></asp:DropDownList>
                                <asp:TextBox ID="txtdob2" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="dd132relation" runat="server">
                                    <asp:ListItem Value="0">Select Relation</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="auth-footer-link" data-aos="fade-up" data-aos-delay="450">
                        Already have an account? <a href="user/index.aspx">Sign in <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 700, once: true, offset: 60, easing: 'ease-out-cubic', disable: 'mobile' });

        function isNumber(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }

        function toggleAspPassword(clientId, btn) {
            var input = document.getElementById(clientId);
            var icon = btn.querySelector('i');
            if (!input || !icon) return;
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.replace('fa-eye', 'fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.replace('fa-eye-slash', 'fa-eye');
            }
        }

        function validatephonenumber(inputtxt) {
            var phoneno = /^([6-9]{1})([0-9]{9})$/;
            return phoneno.test(inputtxt);
        }

        function validateemail(inputtxt) {
            var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return email.test(inputtxt);
        }

        function validate() {
            var sponsorId = document.getElementById('<%= txtsponserid.ClientID %>');
            var sponsorName = document.getElementById('<%= txtsponsername.ClientID %>');
            var name = document.getElementById('<%= txtname.ClientID %>');
            var mobile = document.getElementById('<%= txtmobile.ClientID %>');
            var email = document.getElementById('<%= txtemail.ClientID %>');
            var country = document.getElementById('<%= ddcountry.ClientID %>');
            var password = document.getElementById('<%= txtuserpassword.ClientID %>');
            var confirmPassword = document.getElementById('<%= txtconfirmpassword.ClientID %>');
            var terms = document.getElementById('chkTerms');

            if (!sponsorId.value) { alert('Enter Sponsor Id'); sponsorId.focus(); return false; }
            if (!sponsorName.value) { alert('Invalid Sponsor Id'); sponsorId.focus(); return false; }
            if (!name.value) { alert('Enter Name'); name.focus(); return false; }
            if (!mobile.value) { alert('Enter Mobile'); mobile.focus(); return false; }
            if (mobile.value.length < 10) { alert('Incorrect Mobile Number'); mobile.focus(); return false; }
            if (!email.value) { alert('Enter Email'); email.focus(); return false; }
            if (!validateemail(email.value)) { alert('Invalid Email ID'); email.focus(); return false; }
            if (country.value === '0') { alert('Select Country'); country.focus(); return false; }
            if (!password.value) { alert('Enter Password'); password.focus(); return false; }
            if (!confirmPassword.value) { alert('Enter Confirm Password'); confirmPassword.focus(); return false; }
            if (password.value !== confirmPassword.value) { alert('Password Not Match'); password.focus(); return false; }
            if (!terms.checked) { alert('Please accept Terms of Service'); return false; }
            return true;
        }

        (function () {
            var pwInput = document.getElementById('<%= txtuserpassword.ClientID %>');
            var bar = document.getElementById('strengthBar');
            var label = document.getElementById('strengthLabel');
            if (!pwInput || !bar || !label) return;

            pwInput.addEventListener('input', function () {
                var val = this.value;
                var score = 0;
                if (val.length === 0) {
                    bar.style.width = '0%';
                    label.innerHTML = '';
                    return;
                }
                if (val.length >= 6) score++;
                if (val.length >= 10) score++;
                if (/[a-z]/.test(val)) score++;
                if (/[A-Z]/.test(val)) score++;
                if (/[0-9]/.test(val)) score++;
                if (/[^a-zA-Z0-9]/.test(val)) score += 2;

                var width, color, text, icon;
                if (score <= 2) { width = 20; color = '#ef4444'; text = 'Weak'; icon = 'fa-circle-xmark'; }
                else if (score <= 4) { width = 40; color = '#f97316'; text = 'Fair'; icon = 'fa-circle-exclamation'; }
                else if (score <= 5) { width = 60; color = '#eab308'; text = 'Good'; icon = 'fa-circle-minus'; }
                else if (score <= 6) { width = 80; color = '#22c55e'; text = 'Strong'; icon = 'fa-circle-check'; }
                else { width = 100; color = '#06b6d4'; text = 'Excellent'; icon = 'fa-shield-halved'; }

                bar.style.width = width + '%';
                bar.style.background = 'linear-gradient(90deg, ' + color + ', ' + color + 'dd)';
                label.innerHTML = '<i class="fas ' + icon + '" style="color:' + color + '"></i> <span style="color:' + color + '">' + text + '</span>';
            });
        })();

        (function () {
            var confirmInput = document.getElementById('<%= txtconfirmpassword.ClientID %>');
            var pwInput = document.getElementById('<%= txtuserpassword.ClientID %>');
            if (!confirmInput || !pwInput) return;

            confirmInput.addEventListener('input', function () {
                var icon = this.parentElement.querySelector('.form-group__icon');
                if (this.value.length === 0) {
                    this.style.borderColor = '';
                    if (icon) icon.style.color = '';
                    return;
                }
                if (this.value === pwInput.value) {
                    this.style.borderColor = '#22c55e';
                    if (icon) icon.style.color = '#22c55e';
                } else {
                    this.style.borderColor = 'var(--accent)';
                    if (icon) icon.style.color = 'var(--accent)';
                }
            });
        })();

        (function () {
            var canvas = document.getElementById('registerParticles');
            if (!canvas) return;
            var ctx = canvas.getContext('2d');
            var particles = [];
            var PARTICLE_COUNT = 40;

            function resize() {
                canvas.width = window.innerWidth;
                canvas.height = window.innerHeight;
            }
            resize();
            window.addEventListener('resize', resize);

            function Particle() { this.reset(); }
            Particle.prototype.reset = function () {
                this.x = Math.random() * canvas.width;
                this.y = Math.random() * canvas.height;
                this.size = Math.random() * 2 + 0.5;
                this.speedX = (Math.random() - 0.5) * 0.4;
                this.speedY = (Math.random() - 0.5) * 0.4;
                this.opacity = Math.random() * 0.3 + 0.05;
                this.color = ['108,99,255', '0,212,255', '139,92,246'][Math.floor(Math.random() * 3)];
            };
            Particle.prototype.update = function () {
                this.x += this.speedX;
                this.y += this.speedY;
                if (this.x < 0 || this.x > canvas.width) this.speedX *= -1;
                if (this.y < 0 || this.y > canvas.height) this.speedY *= -1;
            };
            Particle.prototype.draw = function () {
                ctx.beginPath();
                ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                ctx.fillStyle = 'rgba(' + this.color + ', ' + this.opacity + ')';
                ctx.fill();
            };

            for (var i = 0; i < PARTICLE_COUNT; i++) particles.push(new Particle());

            function animate() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                for (var i = 0; i < particles.length; i++) {
                    particles[i].update();
                    particles[i].draw();
                }
                requestAnimationFrame(animate);
            }
            animate();
        })();
    </script>
</body>
</html>
