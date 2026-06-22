﻿<%@ page language="C#" autoeventwireup="true" inherits="Register, App_Web_54felq4y" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Social Vista - Future Of Smart Trading
  </title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Sites meta Data -->
  <meta name="application-name"
    content="Social Vista - Future Of Smart Trading">
  <meta name="author" content="Social Vista">
  <meta name="keywords" content="Social Vista, Crypto, Forex, and Stocks Trading Business">
  <meta name="description"
    content="Experience the power of future trading, the ultimate tarding portfolio designed to transform your trading business. With its sleek design and advanced features, Social vista empowers you to showcase your expertise, engage clients, and dominate the markets. Elevate your online presence and unlock new trading possibilities with Bitrader.">

  <!-- OG meta data -->
  <meta property="og:title"
    content="Social Vista - Future Of Smart Trading">
  <meta property="og:site_name" content=Social Vista>
  <meta property="og:url" content="index.html">
  <meta property="og:description"
    content="Welcome to Social Vista, the ultimate tarding portfolio designed to transform your trading business. With its sleek and modern design, Bitrader provides a cutting-edge platform to showcase your expertise, attract clients, and stay ahead in the competitive trading markets.">
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

 <div class="preloader">
    <img src="assets/images/logo/preloader.png" alt="preloader icon">
  </div>

     <div class="lightdark-switch" style="display:none">
    <span class="switch-btn" id="btnSwitch"><img src="assets/images/icon/moon.svg" alt="light-dark-switchbtn"
        class="swtich-icon"></span>
  </div>

   
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
                  <a href="contact.aspx">Contact Us</a>
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

   
    <br /><br /><br /><br />
   <section class="page-header bg--cover" style="background-image:url(assets/images/header/1.png)">
    <div class="container">
      <div class="page-header__content" data-aos="fade-right" data-aos-duration="1000">
        <h2>Register</h2>
        <nav style="--bs-breadcrumb-divider: '/';" aria-label="breadcrumb">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item "><a href="index-2.html">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Register</li>
          </ol>
        </nav>
      </div>
      <div class="page-header__shape">
        <span class="page-header__shape-item page-header__shape-item--1"><img src="assets/images/header/2.png"
            alt="shape-icon"></span>
      </div>
    </div>
  </section>


        <form id="form1" runat="server">
            <div style="background-color:#000000; color:#fff">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
               
                     <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 50%; width: 50%; top: 0; right: 0; left: 0; z-index: 9999999; opacity: 0.7;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="assets/images/social.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="border-width: 0px; padding: 10px; position: fixed; " />
                </div>
            </ProgressTemplate>
    </asp:UpdateProgress>
             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
             

                        <div class="inner-banner-w3ls d-flex flex-column justify-content-center align-items-center">
    </div>
	
			 <br />
                             <div class="center">
								  
								   
                            
                                       <section class="account padding-top padding-bottom sec-bg-color2">

                                             <div class="container">
      <div class="account__wrapper" >
                        <div class="row">
                            <!--Body-->
                           <div class="col-md-6">
                                    <div class="form-group" >
                                        <label class="text-end ">Sponsor Id :</label>
                                        <asp:TextBox ID="txtsponserid" AutoPostBack="true" OnTextChanged="txtsponserid_TextChanged" CssClass="form-control" runat="server" placeholder="Sponsor ID"></asp:TextBox>
</div>
                                </div>
                            

                                 <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Sponsor Name :</label>
                                        <asp:TextBox ID="txtsponsername" Enabled="false" CssClass="form-control" runat="server" placeholder="Sponsor Name"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
							     <div class="col-md-6" style="display:none">
                                <div class="form-group">
									 <div class="input-group">
                                    <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                    <asp:TextBox ID="txtparentname" Enabled="false" CssClass="form-control" runat="server" placeholder="Parental Name"></asp:TextBox> </div>
                                </div>
                            </div>
							<div class="col-md-6" style="display:none">
                                <div class="form-group">
									    <div class="input-group">
                                    <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                    <asp:TextBox ID="txtparentid" AutoPostBack="true" CssClass="form-control" runat="server" OnTextChanged="txtparentid_TextChanged" placeholder="Parental ID"></asp:TextBox>
                                </div>
									 </div>
                            </div>
                        
                       
          <br />
                        <div class="row" >
                            <!--Body-->
                            <div class="col-md-6" style="display:none;">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-key text-primary"></i></div>
                                        <asp:TextBox ID="txtepin" CssClass="form-control" runat="server" placeholder="E-Pin" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="display:none;">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-inr text-primary"></i></div>
                                        <asp:TextBox ID="txtamount" Enabled="false" CssClass="form-control" runat="server" placeholder="Amount"></asp:TextBox>
                                    </div>
                                </div>
                        </div>
                        </div>
                        <div class="form-row" style="display: none;">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:RadioButton ID="RdBtnFree" runat="server" Text="Free Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnFree_CheckedChanged" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:RadioButton ID="RdBtnEpin" runat="server" Text="E-Pin Regitration" GroupName="A" AutoPostBack="true" OnCheckedChanged="RdBtnEpin_CheckedChanged" />
                                </div>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div>
                        <asp:Panel ID="pnlpin" Visible="false" runat="server">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Plan :</label>
                                        <asp:DropDownList ID="DDLstPlan" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDLstPlan_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="display:none;">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select E-Pin :</label>
                                        <asp:DropDownList ID="ddepin" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddepin_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    </div>
                                </div>

                            </div>
                        </asp:Panel>
                       <div class="row" style="display:none" >
                            <div class="col-md-1">
                                <div class="form-group custom-radio">
                                    <asp:RadioButton ID="RdBtnLeft" runat="server" Text="Left" GroupName="B" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group custom-radio">
                                    <asp:RadioButton ID="RdBtnRight" runat="server" Text="Right" GroupName="B" />
                                </div>
                            </div>
                            <div class="col-md-6">
                            </div>
                        </div> 


              <div class="row">
							<div class="col-md-6" style="display:none">
                                <div class="form-group">
                                    <label class="text-end ">Select Position :</label>
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:DropDownList ID="ddposition" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Position</asp:ListItem>
                                            <asp:ListItem Value="Left">Left</asp:ListItem>
                                            <asp:ListItem Value="Right">Right</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--Body-->
							<div class="col-md-6" >
							
								
								 <div class="form-group">
                                       <label class="text-end ">Name :</label>
                                    <div class="input-group">
                                        <div class="input-group-addon bg-dark" >
											
									
 <asp:DropDownList ID="ddpp" runat="server" style="border:; background-color:none">
                                            <asp:ListItem Value="Mr">Mr.</asp:ListItem>
                                            <asp:ListItem Value="Mrs">Mrs.</asp:ListItem>
                                            <asp:ListItem Value="Miss">Miss</asp:ListItem>
                                        </asp:DropDownList>
  
								</div>
                                        <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>

                                    </div>
                                </div></div>
                                  <div class="col-md-6"> 
                                                <div class="form-group">
                                       <label class="text-end ">Last Name :</label>
                                   
                                                  <asp:TextBox ID="txtlastname" CssClass="form-control" runat="server" placeholder="Last Name"></asp:TextBox>

                                        </div>

                                           </div>
                            </div>
           <br />

                                       
                        <div class="row">
                            <!--Body-->
							   <div class="col-md-6" style="display:none">
                                <div class="form-group">
                                    <label class="text-end ">Select Gender :</label>
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                             <asp:ListItem Value="Transgender">Transgender</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                             

                             <div class="col-md-6">
                              <div class="form-group" >
                                        <label class="text-end">Email:</label>
                                        <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="Email"></asp:TextBox>

                                    </div>
                                </div>


                              <div class="col-md-3">
                            <div class="form-group">

                                  <label class="text-end ">Select Country :</label>
                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                     </div>                          <div class="col-md-3" >

                                <div class="form-group">
                                     <label class="text-end ">Mobile No. :</label>
                                    <div class="input-group">
                                       
                                        <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" maxlength="14" placeholder="Mobile No"></asp:TextBox>
                                    </div>
                                </div>
                            </div> 

                            <div class="col-md-6" style="display:none">
		  <div class="form-group">
		     <label>Date of Birth : Year-Month-Date</label>
		   
                         
                             <fieldset>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlYear" CssClass="form-control" ToolTip="Year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlMonth" CssClass="form-control" ToolTip="Month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlDay" CssClass="form-control" ToolTip="Day" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </fieldset>
                        </div>
                                    <div class="form-group" style="display:none;">
                                        <label>Date Of Birth(dd/MM/yyyy)</label>
                                     

                                        <asp:TextBox ID="txtdob" CssClass="form-control form_date" runat="server" Placeholder="dd/MM/yyyy"></asp:TextBox>
                                    </div>
                                </div>

                            <div class="col-md-12" style="display:none">
                            <div class="form-group">
                                <label class="text-end ">Address :</label>
                                <asp:TextBox ID="TextBox3" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Address"></asp:TextBox>
                            </div>

                        </div>
							 <div class="col-md-6"  style="display:none">
                            <div class="form-group">
                                <label class="text-end "> Select Country :</label>
                                <asp:DropDownList ID="ddcounssstry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select Country</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                     </div>
                                 <div class="col-md-6" style="display:none">
                            <div class="form-group">
                                <label class="text-end "> Select State :</label>
                                <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                    <asp:ListItem Value="0"> Select State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                     </div>

                                 <div class="col-md-6" style="display:none">
                            <div class="form-group">
                                <label class="text-end "> Select City :</label>
                                <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="0"> Select City</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                                     </div>

                                <div class="col-md-6" style="display:none" >
                            <div class="form-group">
                                <label class="text-end ">Pincode :</label>
                                <asp:TextBox ID="TextBox2" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" Placeholder="Pincode"></asp:TextBox>
                                
                            </div>
                                     </div>
                                    
                                
                          
                             <div class="col-md-6"  style="display:none">   
                                 <div class="form-group">
                                      <label class="text-end ">Nominee Name :</label>
                                        <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                            <asp:TextBox ID="txtnomineename" placeholder= "Nominee Name" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>  
                                        </div>
                                    </div> 

                             <div class="col-md-6"  style="display:none">
                                <div class="form-group">
                                       <label class="text-end ">Select Relation :</label>
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:DropDownList ID="ddrelation" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Relation</asp:ListItem>
                                            <asp:ListItem Value="Husband">Husband</asp:ListItem>
                                            <asp:ListItem Value="Wife">Wife</asp:ListItem>
                                             <asp:ListItem Value="Mother">Mother</asp:ListItem>
                                             <asp:ListItem Value="Father">Father</asp:ListItem>
                                             <asp:ListItem Value="Son">Son</asp:ListItem>
                                             <asp:ListItem Value="Daughter">Daughter</asp:ListItem>
											 <asp:ListItem Value="Brother">Brother</asp:ListItem>
											 <asp:ListItem Value="Cousin">Cousin</asp:ListItem>
											 <asp:ListItem Value="Uncle">Uncle</asp:ListItem>
											 <asp:ListItem Value="Aunt">Aunt</asp:ListItem>
                                              <asp:ListItem Value="Brother-In-Law">Brother-In-Law</asp:ListItem>
											 <asp:ListItem Value="Mother-In-Law">Mother-In-Law</asp:ListItem>
											 <asp:ListItem Value="Sister-In-Law">Sister-In-Law</asp:ListItem>
											 <asp:ListItem Value="Father-In-Law">Father-In-Law</asp:ListItem>
                                                      
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                           


                          <div class="col-md-6"  style="display:none;">
                                    <div class="form-group" >
                                        <label class="text-end">Adhar Number :</label>
                                        <asp:TextBox ID="txtaadhar" CssClass="form-control" runat="server" placeholder="Aadhar Number" MaxLength="12"></asp:TextBox>

                                    </div>
                                </div>
                            </div>



 <div class="row">

      
                            	<div class="col-md-6" style="display:none;">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtheight" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
     	<div class="col-md-6" style="display:none;">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>

                                    </div>
                                </div>
                            </div> </div>
     

 <div class="row">
                             <div class="col-md-6"  style="display:none;">
                            <div class="form-group" >
                                        <label class="text-end">Select Gender:</label>
                                        <asp:DropDownList ID="ddgender" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                            <asp:ListItem Value="Male">Male</asp:ListItem>
                                            <asp:ListItem Value="Female">Female</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                          
							
							<div class="col-md-6"  style="display:none;">
                                        <div class="form-group" >
                                        <label class="text-end">Pan Number:</label>
                                            <asp:TextBox ID="txtPanNumber" runat="server" CssClass="form-control" placeholder="Pan Card Number"></asp:TextBox>
                                        </div>
                                    </div>
       </div>
                                           <div class="row">
                                  <div class="col-md-6" style="display: none;">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtaccountholdername" placeholder= "Account Holder Name" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div> <br>
                              <div class="col-md-6"  style="display: none;">
                                     <div class="input-group">
                                        <div class="input-group-addon bg-light"><i class="fa fa-user text-primary"></i></div>
                                        <asp:TextBox ID="txtaccountno" placeholder= "Account Number" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                             </div>
                                        
                             <div class="row"  style="display: none;">
                                  <div class="col-md-6">
                                    <div class="input-group">
                                       <div class="input-group-addon bg-light"><i class="fa fa-tag prefix text-primary"></i></div>
                                        <asp:TextBox ID="txtifsccode" Placeholder="IFSC Code" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div> 
                                               <div class="col-md-6" >
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddbank" CssClass="form-control" runat="server"> 
                                             <asp:ListItem Value="0"> Select Bank</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                 </div>
                                 <div class="row" style="display: none;">
                       
                        </div>

        
                           <div class="row" style="display:none">
                             <div class="col-md-12" >
                            <div class="form-group">
                                <asp:TextBox ID="txtaddress" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Address"></asp:TextBox>
                            </div>

                        </div>
                                
                              </div>
                          <div class="row" style="display:none">
                               
                                
                     
                                <div class="col-md-6">
                            <div class="form-group">
                                <asp:TextBox ID="txtpincode" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" Placeholder="Pincode"></asp:TextBox>
                                <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server" Placeholder="Area" Visible="false"></asp:TextBox>
                            </div>
                                     </div>
                               
                              </div>
                        <div class="row">
                              
                            
                             <div class="col-md-6"  style="display:none;">
                                  <div class="form-group" >
                                        <label class="text-end">Mobile Number:</label>
                                        <asp:TextBox ID="txt123mobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" maxlength="10" placeholder="Mobile No"></asp:TextBox>
                                    </div>
                                </div>

                            
                            </div>  
                                    
                         <div class="row">
                             <div class="col-md-6"   style="display:none;">
                                         <div class="form-group" >
                                        <label class="text-end">Nominee Name:</label>
                                            <asp:TextBox ID="txt123nomineename" placeholder= "Nominee Name" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div> 

                                <div class="col-md-6" style="display:none;">
		 <div class="form-group">
		     <label>Nominee Date of Birth : Year-Month-Date</label>
		   
                         
                             <fieldset>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlYear2" CssClass="form-control" ToolTip="Year" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged2">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlMonth2" CssClass="form-control" ToolTip="Month" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged2">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4 dvRow">
                                    <asp:DropDownList ID="ddlDay2" CssClass="form-control" ToolTip="Day" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </fieldset>
                        </div>
                                    <div class="form-group" style="display:none;">
                                        <label>Nominee Date Of Birth(dd/MM/yyyy)</label>
                                     

                                        <asp:TextBox ID="txtdob2" CssClass="form-control form_date" runat="server" Placeholder="dd/MM/yyyy"></asp:TextBox>
                                    </div>
                                </div>
                                    <div class="col-md-6"   style="display:none;">
                                    <div class="form-group" >
                                        <label class="text-end">Nominee Relation:</label>
                                            <asp:DropDownList ID="dd132relation" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Relation</asp:ListItem>
                                            <asp:ListItem Value="Husband">Husband</asp:ListItem>
                                            <asp:ListItem Value="Wife">Wife</asp:ListItem>
                                             <asp:ListItem Value="Mother">Mother</asp:ListItem>
                                             <asp:ListItem Value="Father">Father</asp:ListItem>
                                             <asp:ListItem Value="Son">Son</asp:ListItem>
                                             <asp:ListItem Value="Daughter">Daughter</asp:ListItem>
												 <asp:ListItem Value="Brother">Brother</asp:ListItem>
                                             <asp:ListItem Value="Sister">Sister</asp:ListItem>
                                             <asp:ListItem Value="Father-In-Law">Father-In-Law</asp:ListItem>
                                             <asp:ListItem Value="Mother-In-Law">Mother-In-Law</asp:ListItem>
                                              <asp:ListItem Value="Other">Other</asp:ListItem>
                                                      
                                        </asp:DropDownList>
                                        </div>
                                    </div>
                               
                        </div>
                     
                                         
                        <div class="row">
                            <!--Body-->
                            <div class="col-md-6">
                              <div class="form-group" >
                                        <label class="text-end">Password:</label>
                                        <asp:TextBox ID="txtuserpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>

                                    </div>
                                </div>
                           

                            <div class="col-md-6">
                                <div class="form-group" >
                                        <label class="text-end">Confirm Password:</label>
                                        <asp:TextBox ID="txtconfirmpassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Confirm Password"></asp:TextBox>
                                    </div>
                                </div>
                           
                        </div>
                    

                        <div class="form-row" style="display: none;">
                            <div class="form-group col-md-6">
                            </div>
                            <div class="form-group col-md-6">
                                <div class="col-md-4 dvRow">
                                   
                                    
                                </div>
                                <div class="col-md-4 dvRow">
                                 
                                 
                                </div>
                                <div class="col-md-4 dvRow">
                                   
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12" style="margin-bottom: 0 !important;">
                            </div>
                        </div>
						
						<br>

                                            <div class="row" style="display:none">
                                <div class="col-md-12 text-center">
                                    <div class="form-group">
                                        
                                    <p style="color:#000">
                                   
                                        I agree to the<a href="Terms_Conditions.html" class="thembo text-primary" target="_blank">Terms & Condition</a></p>
                                        </div>
                                    </div>
                                 </div>	<br>
                        <div class="row">
							
							<div class="col-sm-5"></div>
                            <div class="col-sm-2">
                                <div class="text-center">

                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-success btn-block rounded-0 py-2" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
							
							
							<div class="col-sm-5"></div>
                        </div>



          </div>
</section>
                            
                    </ContentTemplate>
                </asp:UpdatePanel>

                </div>
            </form>
    
    
  <!-- vendor plugins -->

  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/all.min.js"></script>
  <script src="assets/js/swiper-bundle.min.js"></script>
  <script src="assets/js/aos.js"></script>
  <script src="assets/js/fslightbox.js"></script>
  <script src="assets/js/purecounter_vanilla.js"></script>



  <script src="assets/js/custom.js"></script>
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
   
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