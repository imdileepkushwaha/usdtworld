﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <titleUSDT World - Future Of Smart Trading
  </title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Sites meta Data -->
  <meta name="application-name"
    content="USDT World - Future Of Smart Trading">
  <meta name="author" content="USDT World">
  <meta name="keywords" content="USDT World, Crypto, Forex, and Stocks Trading Business">
  <meta name="description"
    content="Experience the power of future trading, the ultimate tarding portfolio designed to transform your trading business. With its sleek design and advanced features, USDT World empowers you to showcase your expertise, engage clients, and dominate the markets. Elevate your online presence and unlock new trading possibilities with Bitrader.">

  <!-- OG meta data -->
  <meta property="og:title"
    content="USDT World - Future Of Smart Trading">
  <meta property="og:site_name" content="USDT World">
  <meta property="og:url" content="index.html">
  <meta property="og:description"
    content="Welcome to USDT World, the ultimate tarding portfolio designed to transform your trading business. With its sleek and modern design, Bitrader provides a cutting-edge platform to showcase your expertise, attract clients, and stay ahead in the competitive trading markets.">
  <meta property="og:type" content="website">
  <meta property="og:image" content="assets/images/og.png">



  <link rel="shortcut icon" href="assets/images/favicon.png" type="image/x-icon">

  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/aos.css">
  <link rel="stylesheet" href="assets/css/all.min.css">

  <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">



  <!-- main css for template -->
  <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
  
    <form id="form1" runat="server">
    

      <header class="header-section header-section--style5">
    <div class="header-bottom">
      <div class="container">
        <div class="header-wrapper header-wrapper--style2">
          <div class="logo">
            <a href="index-2.html">
              <img src="assets/images/logo/socialvistalogo.png" alt="logo" class="dark" style="height: 120px;">
            </a>
          </div>
          <div class="header-content d-flex align-items-center gap-4">
            <div class="menu-area">
              <ul class="menu menu--style1">
               <li>
                  <a href="index.html">Home</a>
                  
                </li>
                <li>
                  <a href="index.html">Services</a>
                  
                </li>
                <li>
                  <a href="index.html">About us</a>
                  
                </li>

                <li>
                  <a href="/user/index.aspx">Sign In</a>
                 

                </li>
                <li>
                  <a href="contact.html">Contact Us</a>
                </li>
              </ul>

            </div>
            <div class="header-action">
              <div class="menu-area">
                <div class="header-btn">
                  <a href="/register.aspx" class="trk-btn trk-btn--tertiary">
                    <span>Register</span>
                  </a>
                </div>

                <!-- toggle icons -->
                <div class="header-bar d-lg-none header-bar--style1">
                  <span></span>
                  <span></span>
                  <span></span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
    
   

		<br><br><br><br>
	


        <section class="page-header bg--cover" style="background-image:url(assets/images/header/1.png)">
    <div class="container">
      <div class="page-header__content" data-aos="fade-right" data-aos-duration="1000">
        <h2>Contact Us</h2>
        <nav style="--bs-breadcrumb-divider: '/';" aria-label="breadcrumb">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item "><a href="index.html">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
          </ol>
        </nav>
      </div>
      <div class="page-header__shape">
        <span class="page-header__shape-item page-header__shape-item--1"><img src="assets/images/header/2.png"
            alt="shape-icon"></span>
      </div>
    </div>
  </section>
    <!-- Page Header End -->

    <!-- Scrolling Ticker Section Start -->
    
    <!-- Scrolling Ticker Section End -->

    <!-- Contact Information Section Start -->
   
    <!-- Contact Information Section End -->

    <!-- Contact Us Form Section Start -->
		
		
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
                  
                    <!-- Section Title Content End -->
                </div>
            </div>                     <!--Body-->
        
                  <div class="row">
                <div class="col-lg-12">
                    <!-- Contact Form Start -->
                    <div class="contact-form">
                             <div class="row">                                
                                <div class="form-group col-md-6 mb-4">
                                
                                     
                                        <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>

                                    </div>
                                
                         <div class="form-group col-md-6 mb-4">
                                        <asp:TextBox ID="TxtTitle" CssClass="form-control" runat="server" placeholder="Title"></asp:TextBox>

                                    </div>
                                

                        
                        
                        
                        

                             

                         <div class="form-group col-md-6 mb-4">
                                        <asp:TextBox ID="TxtEmail" CssClass="form-control" runat="server" placeholder="email id"></asp:TextBox>

                                    </div>
                                
                                <div class="form-group col-md-6 mb-4">
                                        <asp:TextBox ID="TxtMobileNo" CssClass="form-control" runat="server" placeholder="Mobile No"></asp:TextBox>

                                    </div>
                               

                         <div class="form-group col-md-12 mb-5">
                                <asp:TextBox ID="TxtDescription" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Query"></asp:TextBox>
                                    </div>
                                
                                
                            
                       
                      
   
                         <div class="col-md-12">

                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary btn-block rounded-0 py-2" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                            
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
                    
                    <!-- Section Title Content End -->
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

    <footer class="footer ">
    <div class="container">
      <div class="footer__wrapper">
        
        <div class="footer__bottom">
          <div class="footer__end">
            <div class="footer__end-copyright">
              <p class=" mb-0">© 2026 All Rights Reserved By <a href="https://socialvista.trade"
                  target="_blank">USDT World</a> </p>
            </div>
            <div>
              <ul class="social">
                <li class="social__item">
                  <a href="#" class="social__link social__link--style22"><i class="fab fa-facebook-f"></i></a>
                </li>
                <li class="social__item">
                  <a href="#" class="social__link social__link--style22 "><i class="fab fa-instagram"></i></a>
                </li>
                <li class="social__item">
                  <a href="#" class="social__link social__link--style22"><i class="fa-brands fa-linkedin-in"></i></a>
                </li>
                <li class="social__item">
                  <a href="#" class="social__link social__link--style22"><i class="fab fa-youtube"></i></a>
                </li>
                <li class="social__item">
                  <a href="#" class="social__link social__link--style22 "><i class="fab fa-twitter"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer__shape">
      <span class="footer__shape-item footer__shape-item--1"><img src="assets/images/footer/1.png"
          alt="shape icon"></span>
      <span class="footer__shape-item footer__shape-item--2"> <span></span> </span>
    </div>
  </footer>
    </form>
      <!-- vendor plugins -->

  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/all.min.js"></script>
  <script src="assets/js/swiper-bundle.min.js"></script>
  <script src="assets/js/aos.js"></script>
  <script src="assets/js/fslightbox.js"></script>
  <script src="assets/js/purecounter_vanilla.js"></script>



  <script src="assets/js/custom.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {

        const btn = document.getElementById("btnSwitch");

        // Default = DARK (if nothing saved)
        let savedTheme = localStorage.getItem("theme") || "dark";
        document.documentElement.setAttribute("data-bs-theme", savedTheme);

        if (btn) {
            btn.addEventListener("click", function () {

                let currentTheme = document.documentElement.getAttribute("data-bs-theme");

                let newTheme = currentTheme === "dark" ? "dark" : "dark";

                document.documentElement.setAttribute("data-bs-theme", newTheme);

                localStorage.setItem("theme", newTheme);
            });
        }

    });
</script>

</body>
</html>
