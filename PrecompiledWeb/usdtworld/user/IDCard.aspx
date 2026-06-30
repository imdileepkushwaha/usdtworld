<%@ page language="C#" autoeventwireup="true" inherits="user_idcard, App_Web_syyoiqwe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ID Card</title>

    <style>
        .card {
            width: 450px; /* set the width of the image */
            height: 700px; /* set the height of the image */
            position: relative;
            z-index: 1;
        }

        .img {
            width: 220px; /* set the width of the image */
            height: 220px; /* set the height of the image */
            border-radius: 50%; /* add a border radius to make the image circular */
            position: absolute; /* set the position to absolute */
            top: 70px; /* position the image above the card with some negative margin */
            left: 115px; /* center the image horizontally */
            z-index: 2;
        }

        .text {
            font-family: Arial, sans-serif;
            position: absolute; /* set the position to absolute */
            top: 400px; /* position the image above the card with some negative margin */
            left: 50px; /* center the image horizontally */
            color: white;
            padding: 20px;
            font-size: 12px;
            z-index: 2;
        }


        .text2 {
            font-family: Arial, sans-serif;
            position: absolute; /* set the position to absolute */
            top: 530px; /* position the image above the card with some negative margin */
            left: 480px; /* center the image horizontally */
            color: purple;
            padding: 10px;
            font-size: 14px;
            z-index: 2;
        }

        .name {
            position: absolute; /* set the position to absolute */
            top: 315px; /* position the image above the card with some negative margin */
            left: 35px; /* center the image horizontally */
            color: white;
            padding: 20px;
            font-size: 26px;
            z-index: 2;
        }

        .post {
            position: absolute; /* set the position to absolute */
            top: 300px; /* position the image above the card with some negative margin */
            left: 150px; /* center the image horizontally */
            color: white;
            padding: 20px;
            font-size: 18px;
            z-index: 2;
        }


        .logoo {
            width: 200px; /* set the width of the image */
            height: 100px; /* set the height of the image */
            border-radius: 0%; /* add a border radius to make the image circular */
            position: absolute; /* set the position to absolute */
            top: 70px; /* position the image above the card with some negative margin */
            left: 600px; /* center the image horizontally */
            z-index: 2;
        }

        .sign {
            width: 220px; /* set the width of the image */
            height: 50px; /* set the height of the image */
            border-radius: 10%; /* add a border radius to make the image circular */
            position: absolute; /* set the position to absolute */
            top: 430px; /* position the image above the card with some negative margin */
            left: 550px; /* center the image horizontally */
            z-index: 2;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="col-md-6" style="display: none">

            <div class="col-md-6">
                <div class="form-group">
                    <label>Select Country :</label>
                    <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server">
                        <asp:ListItem Value="0"> Select Country</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label>Select State</label>
                <asp:DropDownList ID="lbl1" AutoPostBack="true" CssClass="form-control" runat="server">
                    <asp:ListItem Value="0"> Select State</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="row" style="display: none">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Select City :</label>
                    <asp:DropDownList ID="lbl2" CssClass="form-control" runat="server">
                        <asp:ListItem Value="0"> Select City</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col-md-6" style="display: none">
                <div class="form-group">
                    <label>Area Name</label>
                    <asp:TextBox ID="txtareaname" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>

        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .idcard {
                display: flex;
                gap: 20px
            }

            .id-outer {
                width: 450px;
                height: 700px;
                z-index: 1;
                border: 5px solid #37414b;
                border-radius: 20px;
            }



            .id-head {
                position: relative;
                background: #61af5f;
                height: 125px;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                display: flex;
                justify-content: center;
            }

            .logo-circle {
                background: #fff;
                width: 200px;
                height: 200px;
                border-radius: 50%;
                border: 5px solid #e5e5e5;
                margin-top: 15px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .id-head .logo-img {
                width: 75%;
            }

            .main-head-post {
                color: #023380;
                padding-top: 85px;
                font-size: 28px;
                font-weight: 600;
                text-align: center;
            }

            .other-text {
                color: #000;
                padding: 20px;
                font-size: 12px;
            }

            .user-text {
                gap: 20px;
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

                .user-text img {
                    width: 60px;
                }

            .user-text-area h3 {
                font-size: 15px;
                margin: 0;
                line-height: 30px;
                color: #575757;
            }

            .user-text-area span {
                font-size: 18px;
                line-height: 32px;
                font-weight: 600;
                color: #124684;
            }

            .id-foot {
                min-height: 84px;
                background: #f7f7f7;
                border-bottom-right-radius: 15px;
                border-bottom-left-radius: 15px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .id-foot img {
                width:300px;
            }

            .id-outer-back {
                width: 450px;
                height: 700px;
                z-index: 1;
                border: 5px solid #61af5f;
                border-radius: 20px;
            }

            .id-back-head {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100px;
            }

            .id-back-head img{
                width:300px;
            }

            .user-pic {
                display: flex;
                gap: 20px;
                align-items: center;
                padding: 15px 20px;
            }

            .userid-sec {
                display: flex;
                background: #61af5f;
                justify-content: center;
                align-items: center;
                padding: 15px 0;
            }

                .userid-sec h2 {
                    color: #fff;
                    font-size: 2em;
                    margin: 0;
                }

            .other-detaila {
                display: flex;
                padding: 26px 20px;
                align-items: center;
            }

            .details-text {
   display: flex;
    align-items: center;
    margin-bottom: 13px;
}
        </style>

        <div class="idcard">
            <div class="id-outer">
                <div class="id-head">
                    <div class="logo-circle">
                        <img class="logo-img" src="img/logo.png" alt="" />
                    </div>
                </div>

                <h2 class="main-head-post">
                    <asp:Label ID="lblusername" runat="server" Text="Label"></asp:Label>
                </h2>

                <div class="other-text">
                    <div class="user-text">
                        <img class="logo-img" src="img/user-icon.svg" alt="" />
                        <div class="user-text-area">
                            <h3>User Id No. : </h3>
                            <asp:Label ID="lbluserid" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>

                    <div class="user-text">
                        <img class="logo-img" src="img/doj-icon.svg" alt="" />
                        <div class="user-text-area">
                            <h3>DOJ : </h3>
                            <asp:Label ID="lblDob" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>

                    <div class="user-text">
                        <img class="logo-img" src="img/mobile-icon.svg" alt="" />
                        <div class="user-text-area">
                            <h3>Contact No. : </h3>
                            <asp:Label ID="lblmobile" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>

                    <div class="user-text">
                        <img class="logo-img" src="img/email-icon.svg" alt="" />
                        <div class="user-text-area">
                            <h3>Email Id : </h3>
                            <asp:Label ID="lblemail" runat="server" Text="Label"></asp:Label>
                        </div>
                    </div>


                </div>

                <div class="id-foot">

                    <img src="img/logo-id.png" alt="" />

                </div>
            </div>

            <div class="id-outer-back">
                <div class="id-back-head">
                    <img class="logo-img" src="img/logo.png" alt="" style="width:50%; height:50%" />
                </div>

                <div class="user-pic">
                    <img src="img/user-pic.svg" alt="" style="width: 175px;" />

                    <div>
                        <h4>LIMAYA</h4>
                    </div>
                </div>

                <div class="userid-sec">
                    <h2>EMPLOYEE ID</h2>
                </div>

                <div class="other-detaila">
                    <div class="details-left">
                        <div class="details-text">
                            <div class="user-text-area">
                                <h3>Address : DEMO</h3>

                            </div>
                        </div>

                        <div class="user-text">
                            <div class="user-text-area">
                                <h3>Contact No : 00000000</h3>

                            </div>
                        </div>

                        <div class="user-text">
                            <div class="user-text-area">
                                <h3>Email Id :  145874596554@gmail.com</h3>

                            </div>
                        </div>

                        <div class="user-text">
                            <div class="user-text-area">
                                <h3>Website : www.demo.com</h3>

                            </div>
                        </div>
                    </div>
                    <div class="qr-right">
                        <img src="img/qr-img.png" alt="" />
                    </div>
                </div>

                <div class="id-foot">

                    <img src="img/logo-id.png" alt="" />

                </div>
            </div>

        </div>

        <asp:Image ID="ImgMyPhoto" runat="server" class="img" Style="display: none" />
        <%--<img class="logoo" src="img/logo.png" alt="" />
        <img class="sign" src="img/SIGN.jpg" alt="" />
        <img class="card" src="img/idcardfrontNew.jpg" alt="" />
        <img class="card" src="img/IDcardBackNew.jpg" alt="" />--%>







        <div style="padding-top: 15px">
            <button class="btn btn-primary"><a href="dashboard.aspx">BACK </a></button>
            &nbsp;
           <asp:Button ID="btnprint" runat="server" Text="Print" class="btn btn-primary" OnClick="btnprint_Click" />
        </div>

    </form>
</body>
</html>
