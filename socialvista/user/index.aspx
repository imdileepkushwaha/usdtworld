<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta charset="UTF-8">
    <title><%= clsUtility.ProjectName %></title>
    <meta charset="UTF-8">
		<meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="Description" content="Xino - Laravel Admin & Dashboard Template">
		<meta name="Author" content="Spruko Technologies Private Limited">
		<meta name="Keywords" content="cryptocurrency, dashboard, admin, crypto, ico, bootstrap admin template, admin template, bootstrap dashboard template, crypto dashboard, cryptocurrency dashboard, ico dashboard, crypto admin, dashboard cryptocurrency, cryptocurrency trading dashboard, crypto dashboard template "/>

		<!-- Title -->
     

        <!-- Favicon -->
        <link rel="icon" href="img/logo.png" type="image/x-icon"/>

		<!-- Icons css -->
		<link href="assets/css/icons.html" rel="stylesheet">

		<!---Fontawesome css-->
		<link href="assets/plugins/fontawesome-free/css/all.min.css" rel="stylesheet">

		<!---Ionicons css-->
		<link href="assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet">

		<!---Typicons css-->
		<link href="assets/plugins/typicons.font/typicons.css" rel="stylesheet">

		<!---Feather css-->
		<link href="assets/plugins/feather/feather.css" rel="stylesheet">

		<!---Falg-icons css-->
        <link href="assets/plugins/flag-icon-css/css/flag-icon.min.css" rel="stylesheet">

		
		<!---Style css-->
		<link href="assets/css/style.css" rel="stylesheet">
		<link href="assets/css/style-dark.css" rel="stylesheet">

        <!-- skin css-->
        <link href="assets/css/skin-modes.css" rel="stylesheet">

		<!--- Animations css-->
		<link href="assets/css/animate.css" rel="stylesheet">

        <!-- Switcher css -->
		<link href="assets/switcher/css/switcher.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/switcher/demo.css">
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
        <link href="css/login-modern.css" rel="stylesheet" />
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
	
	
	<script>
	    // Change the type of input to password or text
	    function togglePassword(inputId, iconId) {
	        var input = document.getElementById(inputId);
	        var icon = document.getElementById(iconId);
	        if (!input) return;

	        if (input.type === "password") {
	            input.type = "text";
	            if (icon) {
	                icon.classList.remove("fa-eye");
	                icon.classList.add("fa-eye-slash");
	            }
	        } else {
	            input.type = "password";
	            if (icon) {
	                icon.classList.remove("fa-eye-slash");
	                icon.classList.add("fa-eye");
	            }
	        }
	    }

	    function Toggle() {
	        togglePassword("<%=txtpassword.ClientID%>", "toggleLoginPasswordIcon");
	    }
	    function Toggle1() {
	        togglePassword("<%=TxtNewPassword.ClientID%>", "toggleNewPasswordIcon");
        }
        function Toggle2() {
            togglePassword("<%=TxtConfirmpassword.ClientID%>", "toggleConfirmPasswordIcon");
        }
    </script>
</head>
<body class="login-page-modern">
      <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>         
           <asp:UpdateProgress id="updateProgress" runat="server">
    <ProgressTemplate>
       <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; opacity: 0.7;">
            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="../assets/images/social.gif" AlternateText="Loading ..." ToolTip="Loading ..." style="border-width:0px;padding: 10px;position:fixed;top:25%;left:40%;" />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
          <asp:UpdatePanel runat="server" ID="uplMaster" >
        <ContentTemplate>
           <div class="login-shell">
                <div class="login-card">
                    <div class="login-brand">
                        <img src="img/logo-white.png" alt="<%= clsUtility.ProjectName %>" class="login-brand-logo" />
                        <h1>Welcome to <%= clsUtility.ProjectName %></h1>
                        <p>Your secure gateway to trading, wallet management, and member services. Sign in to access your dashboard.</p>
                        <div class="login-brand-badges">
                            <span><i class="fas fa-shield-alt"></i> Secure Login</span>
                            <span><i class="fas fa-bolt"></i> Fast Access</span>
                            <span><i class="fas fa-chart-line"></i> Smart Trading</span>
                        </div>
                    </div>
                    <div class="login-form-panel">
                        <h2>Sign in</h2>
                        <p class="subtitle">Enter your Trade ID and password to continue.</p>

                        <div class="login-field">
                            <label for="<%= txtusername.ClientID %>">Trade ID</label>
                            <div class="login-input-wrap">
                                <i class="fas fa-user field-icon"></i>
                                <asp:TextBox ID="txtusername" CssClass="form-control" runat="server" placeholder="Enter your Trade ID"></asp:TextBox>
                            </div>
                        </div>

                        <div class="login-field">
                            <label for="<%= txtpassword.ClientID %>">Password</label>
                            <div class="login-input-wrap">
                                <i class="fas fa-lock field-icon"></i>
                                <asp:TextBox ID="txtpassword" TextMode="Password" CssClass="form-control" placeholder="Enter your password" runat="server"></asp:TextBox>
                                <button type="button" class="password-toggle-btn" onclick="Toggle()" aria-label="Show password">
                                    <i id="toggleLoginPasswordIcon" class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>

                        <div class="login-actions">
                            <span></span>
                            <a onclick="showModal();" style="cursor:pointer;">Forgot password?</a>
                        </div>

                        <asp:Button runat="server" ID="btnLogin" Text="Sign In" CssClass="btn-login-primary" OnClick="btnLogin_Click" />

                        <p class="login-footer-text">
                            Don't have an account?
                            <a href="../Register.aspx">Create an Account</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="row" style="display:none">
               
                 <div> <div class="login-box" >
      <div class="login-logo">
            <%-- <a href="#"><b><%= clsUtility.ProjectName %></b></a>--%>

      </div><!-- /.login-logo -->
      <div class="login-box-body">
           <a href="#"><b><img src="img/spinelogo.png" style="width:80%"></b></a>
        <p class="login-box-msg">User Login</p>
      
          <div class="form-group has-feedback">      
            
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
             
          
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
          
            <div class="col-xs-4">
         
            
            </div>
              <div class="col-xs-8">
                  Forgot password?</a>
                  </div><!-- /.col -->
          </div>
        
      </div><!-- /.login-box-body -->
    </div></div>

            </div>
    <!-- /.login-box -->
         
      <div id="myModal" class="modal fade modal-modern">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Forgot Password</h4>
                        </div>
                        <div class="modal-body">
                            <div class="login-field">
                                <label for="<%= txtuserid.ClientID %>">User ID</label>
                                <div class="login-input-wrap">
                                    <i class="fas fa-id-badge field-icon"></i>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtuserid" placeholder="Enter your User ID"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSend" runat="server" Text="Submit" OnClientClick="return validate3();" CssClass="btn btn-success" OnClick="btnSend_Click" />
                            <button type="button" class="btn red" data-dismiss="modal">Close</button>
                        </div>
                        <div class="row" id="divsuccess" runat="server" visible="false">
                            <div class="col-md-12">
                                <div class="alert alert-success"> <strong>Success!</strong> <asp:Label ID="lblmessage" runat="server" Text="Label"></asp:Label>. </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
             <div id="Divotp" class="modal fade modal-modern">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">OTP Confirmation</h4>
                        </div>
                        <div class="modal-body">
                            <div class="login-field">
                                <label for="<%= TxtOtp.ClientID %>">OTP</label>
                                <div class="login-input-wrap">
                                    <i class="fas fa-key field-icon"></i>
                                    <asp:TextBox runat="server" CssClass="form-control" ID="TxtOtp" placeholder="Enter OTP"></asp:TextBox>
                                </div>
                                <asp:Label ID="LblMessages" runat="server" Text="Invalid OTP please enter valid OTP...!" CssClass="bg-red-active" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                             <asp:Button ID="BtnConfirm" runat="server" Text="Submit OTP" OnClientClick="return validate2();" CssClass="btn btn-success" OnClick="BtnConfirm_Click"  />
                            <asp:Button ID="BtnResend" runat="server" Text="Resend OTP" CssClass="btn btn-info" OnClick="BtnResend_Click" />
                            <button type="button" class="btn red" data-dismiss="modal">Close</button>
                        </div>
                        <div class="row" id="div2" runat="server" visible="false">
                            <div class="col-md-12">
                                <div class="alert alert-success"> <strong>Success!</strong> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>. </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
             <div id="Divreset" class="modal fade modal-modern">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Reset Password</h4>
            </div>
            <div class="modal-body">
                <div class="login-field">
                    <label for="<%= TxtResetotp.ClientID %>">OTP</label>
                    <div class="login-input-wrap">
                        <i class="fas fa-key field-icon"></i>
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtResetotp" placeholder="Enter OTP"></asp:TextBox>
                    </div>
                    <asp:Label ID="Label2" runat="server" Text="Invalid OTP please enter valid OTP...!" CssClass="bg-red-active" Visible="false"></asp:Label>
                </div>
                <div class="login-field">
                    <label for="<%= TxtNewPassword.ClientID %>">New Password</label>
                    <div class="login-input-wrap">
                        <i class="fas fa-lock field-icon"></i>
                        <asp:TextBox ID="TxtNewPassword" TextMode="Password" CssClass="form-control" placeholder="New password" runat="server"></asp:TextBox>
                        <button type="button" class="password-toggle-btn" onclick="Toggle1()" aria-label="Show password">
                            <i id="toggleNewPasswordIcon" class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
                <div class="login-field">
                    <label for="<%= TxtConfirmpassword.ClientID %>">Confirm Password</label>
                    <div class="login-input-wrap">
                        <i class="fas fa-lock field-icon"></i>
                        <asp:TextBox ID="TxtConfirmpassword" TextMode="Password" CssClass="form-control" placeholder="Confirm password" runat="server"></asp:TextBox>
                        <button type="button" class="password-toggle-btn" onclick="Toggle2()" aria-label="Show password">
                            <i id="toggleConfirmPasswordIcon" class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                 <asp:Button ID="Button1" runat="server" Text="Submit OTP" OnClientClick="return validate5();" CssClass="btn btn-success" OnClick="Button1_Click"  />
               
                <button type="button" class="btn red" data-dismiss="modal">Close</button>
            </div>
            <div class="row" id="div1" runat="server" visible="false">
                <div class="col-md-12">
                    <div class="alert alert-success"> <strong>Success!</strong> <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>. </div>
                </div>
            </div>
           
        </div>
    </div>
</div>

                </ContentTemplate>
    </asp:UpdatePanel>
           </form>
    <!-- jQuery 2.1.3 -->
   <script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
     <script type="text/javascript">
         function showModal() {
             $('#myModal').modal({ backdrop: 'static', keyboard: false })
         }
         function Closepopup() {
             $('#myModal').modal('hide');
             $('body').removeClass('modal-open');
             $('body').css('padding-right', '0');
             $('.modal-backdrop').remove();
         }
         function showModal12() {
             $('#Divotp').modal({ backdrop: 'static', keyboard: false })
         }
         function Closepopup1() {
             $('#Divotp').modal('hide');
             $('body').removeClass('modal-open');
             $('body').css('padding-right', '0');
             $('.modal-backdrop').remove();
         }
         function showModal13() {
             $('#Divreset').modal({ backdrop: 'static', keyboard: false })
         }
         function Closepopup2() {
             $('#Divreset').modal('hide');
             $('body').removeClass('modal-open');
             $('body').css('padding-right', '0');
             $('.modal-backdrop').remove();
         }
     </script>

    <script src="assets/plugins/jquery/jquery.min.js"></script>

		<!-- Bootstrap Bundle js -->
		<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Ionicons js -->
		<script src="assets/plugins/ionicons/ionicons.js"></script>

		<!-- Moment js -->
		<script src="assets/plugins/moment/moment.js"></script>

		<!-- eva-icons js -->
		<script src="assets/js/eva-icons.min.js"></script>

		<!-- Rating js-->
		<script src="assets/plugins/rating/jquery.rating-stars.js"></script>
		<script src="assets/plugins/rating/jquery.barrating.js"></script>

		
		<!-- Custom js -->
		<script src="assets/js/custom.js"></script>

        <!-- Switcher js -->
		<script src="assets/switcher/js/switcher.js"></script>
</body>
</html>