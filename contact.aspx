﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1">
	<meta name="description" content="empire asia , empireasia.org, task based sysytem">
	<meta name="keywords" content="empire asia , empireasia.org, task based sysytem">
	<meta name="author" content="Awaiken">
	<!-- Page Title -->
    <title>Empire Asia Google Task Based System</title>
	<!-- Favicon Icon -->
	<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
	<!-- Google Fonts Css-->
	<link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:ital,wght@0,200..800;1,200..800&amp;display=swap" rel="stylesheet">
	<!-- Bootstrap Css -->
	<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
	<!-- SlickNav Css -->
	<link href="css/slicknav.min.css" rel="stylesheet">
	<!-- Swiper Css -->
	<link rel="stylesheet" href="css/swiper-bundle.min.css">
	<!-- Font Awesome Icon Css-->
	<link href="css/all.min.css" rel="stylesheet" media="screen">
	<!-- Animated Css -->
	<link href="css/animate.css" rel="stylesheet">
    <!-- Magnific Popup Core Css File -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Mouse Cursor Css File -->
	<link rel="stylesheet" href="css/mousecursor.css">
	<!-- Main Custom Css -->
	<link href="css/custom.css" rel="stylesheet" media="screen">
</head>
<body>
  
    <form id="form1" runat="server">
    

        <header class="main-header">
		<div class="header-sticky">
			<nav class="navbar navbar-expand-lg">
				<div class="container">
					<!-- Logo Start -->
					<a class="navbar-brand" href="index.aspx">
						<img src="images/logo.png" alt="Logo">
					</a>
					<!-- Logo End -->

					<!-- Main Menu Start -->
					<div class="collapse navbar-collapse main-menu">
                        <div class="nav-menu-wrapper">
                            <ul class="navbar-nav mr-auto" id="menu">
                                <li class="nav-item "><a class="nav-link" href="index.aspx">Home</a>
                                    
                                </li>                                
                                <li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
                                <li class="nav-item"><a class="nav-link" href="#">Business Plan</a></li>
                                 
                                <li class="nav-item submenu" style="display:none;"><a class="nav-link" href="#">Pages</a>
                                    <ul>                                        
                                        <li class="nav-item"><a class="nav-link" href="service-single.html">Service Details</a></li>
                                        <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                                        <li class="nav-item"><a class="nav-link" href="blog-single.html">Blog Details</a></li>
                                        <li class="nav-item"><a class="nav-link" href="projects.html">Projects</a></li>
                                        <li class="nav-item"><a class="nav-link" href="project-single.html">Project Details</a></li>
                                        <li class="nav-item"><a class="nav-link" href="team.html">Team</a></li>
                                        <li class="nav-item"><a class="nav-link" href="team-single.html">Team Details</a></li>
                                        <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing Plan</a></li>
                                        <li class="nav-item"><a class="nav-link" href="testimonial.html">Testimonials</a></li>
                                        <li class="nav-item"><a class="nav-link" href="image-gallery.html">Image Gallery</a></li>
                                        <li class="nav-item"><a class="nav-link" href="video-gallery.html">Video Gallery</a></li>
                                        <li class="nav-item"><a class="nav-link" href="faqs.html">FAQs</a></li>
                                        <li class="nav-item"><a class="nav-link" href="404.html">404</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>     
                              

<div class="header-btn">
<a href="/Register.aspx" class="btn-default">Register Here</a>
</div>
      

 <div class="header-nav-right">

<div class="header-btn">
<a href="user/index.aspx" class="btn-highlighted">Login</a>
</div>
</div>                       
                            </ul>
                            
                        </div>

                        <!-- Header Social Box Start -->
                        <div class="header-social-box d-inline-flex">
                            <!-- Header Social Links Start -->
                            <div class="header-social-links">
                                <ul>
                                    <li><a href="#"><i class="fa-brands fa-x-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa-brands fa-facebook-f"></i></a></li>
                                    <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                                </ul>
                            </div>
                            <!-- Header Social Links End -->

                            <!-- Header Btn Start -->
                            <div class="header-btn">
                                <!-- Toggle Button trigger modal Start -->
                                <button class="btn btn-popup" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><img src="images/header-btn-dot.svg" alt=""></button>
                                <!-- Toggle Button trigger modal End -->

                                <!-- Header Sidebar Start -->
                                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight">
                                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                    
                                    <div class="offcanvas-body">
                                        <!-- Header Contact Box Start -->
                                       
                                        <!-- Header Contact Box End -->

                                        <!-- Header Contact Box Start -->
                                        <div class="header-contact-box">
                                            <div class="icon-box">
                                                <img src="images/icon-mail-accent.svg" alt="">
                                            </div>
                                            <div class="header-contact-box-content">
                                                <h3>email</h3>
                                                <p>info@empireasia.org</p>
                                            </div>
                                        </div>
                                        <!-- Header Contact Box End -->

                                        <!-- Header Contact Box Start -->
                                        <div class="header-contact-box">
                                            <div class="icon-box">
                                                <img src="images/icon-location-accent.svg" alt="">
                                            </div>
                                            <div class="header-contact-box-content">
                                                <h3>address</h3>
                                                <p>North Tower Level 18, Singapore 048583.</p>
                                            </div>
                                        </div>
                                        
                                        <!-- Header Contact Box End -->

                                        <!-- Header Social Links Start -->
                                        <div class="header-social-links sidebar-social-links">
                                            <h3>stay connected</h3>
                                            <ul>
                                                <li><a href="#"><i class="fa-brands fa-x-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-facebook-f"></i></a></li>
                                                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                                            </ul>
                                        </div>
                                        <!-- Header Social Links End -->
                                    </div>
                                </div>
                                <!-- Header Sidebar End -->
                            </div>
                            <!-- Header Btn End -->
                        </div>     
                        <!-- Header Social Box End -->                   
					</div>
                    
					<!-- Main Menu End -->
					<div class="navbar-toggle"></div>
				</div>
			</nav>
			<div class="responsive-menu"></div>
		</div>
	</header>

 
    
    
   

		
		
		  <div class="page-header parallaxie">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12">
                    <!-- Page Header Box Start -->
                    <div class="page-header-box">
                        <h1 class="text-anime-style-2" data-cursor="-opaque">Contact <span>us</span></h1>
                        <nav class="wow fadeInUp">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.aspx">home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">conatct us</li>
                            </ol>
                        </nav>
                    </div>
                    <!-- Page Header Box End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Scrolling Ticker Section Start -->
    
    <!-- Scrolling Ticker Section End -->

    <!-- Contact Information Section Start -->
   
    <!-- Contact Information Section End -->

    <!-- Contact Us Form Section Start -->
		
		
		<div class="contact-us-form">
        <div class="container">
            <div class="row section-row align-items-center">
                            <!--Body-->
                          <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                         <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-tag prefix text-primary"></i></div>
                                        <asp:TextBox ID="TxtTitle" CssClass="form-control" runat="server" placeholder="Title"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                        </div>


                        
                        
                        
                        

                                           <br>
                             

                        <div class="row" >
                             <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-envelope text-primary"></i></div>
                                        <asp:TextBox ID="TxtEmail" CssClass="form-control" runat="server" placeholder="email id"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                              <div class="col-md-6" >
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-tag prefix text-primary"></i></div>
                                        <asp:TextBox ID="TxtMobileNo" CssClass="form-control" runat="server" placeholder="Mobile No"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                        </div>
                                              <br>
                           <div class="row">
                             <div class="col-md-12" >
                            <div class="form-group">
                                <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-tag prefix text-primary"></i></div>
                                <asp:TextBox ID="TxtDescription" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Query"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>
                                
                              </div>
                       
                      
   
                        <div class="row">
							
							<div class="col-sm-5"></div>
                            <div class="col-sm-2">
                                <div class="text-center">

                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary btn-block rounded-0 py-2" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
					 </div>
                            </div>
    <div class="contact-us-form">
        <div class="container">
            <div class="row section-row align-items-center">
                <div class="col-lg-7">
                    <!-- Section Title Start -->
                    <div class="section-title">
                        <h3 class="wow fadeInUp">Contact us</h3>
                        <h2 class="text-anime-style-2" data-cursor="-opaque">Get in <span>touch</span> with us</h2>
                    </div>
                    <!-- Section Title End -->
                </div>

                <div class="col-lg-5">
                    <!-- Section Title Content Start -->
                    <div class="section-title-content">
                        <p class="wow fadeInUp" data-wow-delay="0.2s">Connect with our team for tailored social media marketing solutions that elevate your brand, engage your audience, and drive results.</p>
                    </div>
                    <!-- Section Title Content End -->
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <!-- Contact Form Start -->
                    <div class="contact-form">
                        <form id="contactForm" action="#" method="POST" data-toggle="validator" class="wow fadeInUp" data-wow-delay="0.2s">
                            <div class="row">                                
                                <div class="form-group col-md-6 mb-4">
                                    <input type="text" name="fname" class="form-control" id="fname" placeholder="First name" required>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="form-group col-md-6 mb-4">
                                    <input type="text" name="lname" class="form-control" id="lname" placeholder="Last name" required>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="form-group col-md-6 mb-4">
                                    <input type="text" name="phone" class="form-control" id="phone" placeholder="Enter your mobile no." required>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="form-group col-md-6 mb-4">
                                    <input type="email" name ="email" class="form-control" id="email" placeholder="Enter your e-mail" required>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="form-group col-md-12 mb-5">
                                    <textarea name="message" class="form-control" id="message" rows="4" placeholder="Write message..."></textarea>
                                    <div class="help-block with-errors"></div>
                                </div>

                                <div class="col-md-12">
                                    <button type="submit" class="btn-default"><span>submit message</span></button>
                                    <div id="msgSubmit" class="h3 hidden"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- Contact Form End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Contact Us Form Section End -->

    <!-- Google Map Section Start -->
    <div class="google-map">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Google Map IFrame Start -->
                    <div class="google-map-iframe">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96737.10562045308!2d-74.08535042841811!3d40.739265258395164!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sin!4v1703158537552!5m2!1sen!2sin" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                    <!-- Google Map IFrame End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Google Map Section End -->

          <footer class="main-footer">
        <!-- Let's Work Together start -->
   
        <!-- Let's Work Together end -->

        <!-- Footer Main Start -->
		<div class="footer-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-5 col-md-12">
						<!-- Footer Newsletter Box Start -->
                        <div class="footer-newsletter-box">
                            <!-- Footer Newsletter Title Start -->
                            <div class="section-title footer-newsletter-title">
                                <h2>Let's achieve social media <span>excellence</span></h2>
                            </div>
                            <!-- Footer Newsletter Title End -->

                            <!-- Newsletter Form start -->
                            <div class="newsletter-form">
                                <form id="newsletterForm" action="#" method="POST">
                                    <div class="form-group">
                                        <input type="email" name="email" class="form-control" id="mail" placeholder="Enter Your Email" required="">
                                        <button type="submit" class="newsletter-btn"><i class="fa-regular fa-paper-plane"></i></button>
                                    </div>
                                </form>
                            </div>
                            <!-- Newsletter Form end -->
                        </div>
                        <!-- Footer Newsletter Box End -->
					</div>

                    <div class="col-lg-2 col-md-4">
                        <!-- Footer Links start -->
						<div class="footer-links">
                            <h3>quick link</h3>
                            <ul>
                                <li><a href="index.aspx">Home</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Blog</a></li>
                            </ul>
                        </div>
                        <!-- Footer Links end -->	
                    </div>

                    <div class="col-lg-3 col-md-4">
                        <!-- Footer Links start -->
						<div class="footer-links">
                            <h3>services</h3>
                            <ul>
                                <li><a href="#">strategy development</a></li>
                                <li><a href="#">account management</a></li>
                                <li><a href="#">analytics and reporting</a></li>
                                <li><a href="#">research and optimization</a></li>
                            </ul>
                        </div>
                        <!-- Footer Links end -->
                    </div>

					<div class="col-lg-2 col-md-4">
                        <!-- Footer Contact Details Start -->
                        <div class="footer-links">
                            <h3>Support</h3>
                            <ul>
                                <li><a href="#">help</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Term's & Condition </a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                        <!-- Footer Contact Details End -->
					</div>

                    <div class="col-lg-12">
                        <!-- About Footer Start -->
                        <div class="footer-cta-box">
                            <!-- Footer Logo Start -->
                            <div class="footer-logo">
                                <img src="images/logo.png" alt="">
                            </div>
                            <!-- Footer Logo End -->
                        
                            <!-- Footer Contact Box Start -->
                            <div class="footer-contact-box">
                                <!-- Footer Contact Item Start -->
                              
                                <!-- Footer Contact Item End -->
    
                                <!-- Footer Contact Item Start -->

<div class="footer-contact-item">
                                    <div class="icon-box">
                                        <i class="fa-solid fa-map"></i>
                                    </div>
                                    <div class="footer-contact-item-content">
                                        <h3>  North Tower Level 18, Singapore 048583. </h3>
                                    </div>                                    
                                </div>
                              
                                <div class="footer-contact-item">
                                    <div class="icon-box">
                                        <i class="fa-solid fa-envelope"></i>
                                    </div>
                                    <div class="footer-contact-item-content">
                                        <h3><a href="#">info@empireasia.org </a></h3>
                                    </div>                                    
                                </div>
                                <!-- Footer Contact Item End -->
                            </div>
                            <!-- Footer Contact Box End -->
                        </div>
                        <!-- About Footer End -->
                    </div>
				</div>

                <!-- Footer Copyright Section Start -->
                <div class="footer-copyright">
                    <div class="row align-items-center">                       
                        <div class="col-lg-6 col-md-5">
                            <!-- Footer Copyright Start -->
                            <div class="footer-copyright-text">
                                <p>Copyright © 2025 All Rights Reserved.</p>
                            </div>
                            <!-- Footer Copyright End -->
                        </div>

                        <div class="col-lg-6 col-md-7">
                            <!-- Footer Social Links Start -->
                            <div class="footer-social-links">
                                <ul>
                                    <li><a href="#"><i class="fa-brands fa-facebook-f"></i>Facebook</a></li>
                                    <li><a href="#"><i class="fa-brands fa-instagram"></i>Instagram</a></li>
                                    <li><a href="#"><i class="fa-brands fa-x-twitter"></i>Twitter</a></li>
                                </ul>
                            </div>
                            <!-- Footer Social Links End -->
                        </div>
                    </div>
                </div>
                <!-- Footer Copyright Section End -->
			</div>
		</div>
		<!-- Footer Main End -->
    </footer>
    </form>
      <!-- Jquery Library File -->
    <script src="js/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap js file -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Validator js file -->
    <script src="js/validator.min.js"></script>
    <!-- SlickNav js file -->
    <script src="js/jquery.slicknav.js"></script>
    <!-- Swiper js file -->
    <script src="js/swiper-bundle.min.js"></script>
    <!-- Counter js file -->
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <!-- Isotop js file -->
	<script src="js/isotope.min.js"></script>
    <!-- Magnific js file -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <!-- SmoothScroll -->
    <script src="js/SmoothScroll.js"></script>
    <!-- Parallax js -->
    <script src="js/parallaxie.js"></script>
    <!-- MagicCursor js file -->
    <script src="js/gsap.min.js"></script>
    <script src="js/magiccursor.js"></script>
    <!-- Text Effect js file -->
    <script src="js/SplitText.js"></script>
    <script src="js/ScrollTrigger.min.js"></script>
    <!-- YTPlayer js File -->
    <script src="js/jquery.mb.YTPlayer.min.js"></script>
    <!-- Wow js file -->
    <script src="js/wow.min.js"></script>
    <!-- Main Custom js file -->
    <script src="js/function.js"></script>
</body>
</html>
