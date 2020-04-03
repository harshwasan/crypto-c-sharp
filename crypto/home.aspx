<!DOCTYPE html>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="crypto.home" %>

<html lang="en">
<head>
    <title>Cryptocurrency</title>
    <meta charset="UTF-8">
    <meta name="description" content="Cryptocurrency Landing Page Template">
    <meta name="keywords" content="cryptocurrency, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Favicon -->
    <link href="~/img/favicon_io/favicon.ico" rel="shortcut icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

    <!-- Stylesheets -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="css/owl.carousel.css" />
    <link rel="stylesheet" href="css/style.css" />

    <style type="text/css">
        .responsive-table {
            display: block;
            width: 100%;
            overflow-x: auto;
            -ms-overflow-style: -ms-autohiding-scrollbar;
        }

        imgs {
            width: 16px;
            height: 16px;
        }
    </style>
   

</head>
<body>
      <form runat="server">
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header section -->
    <header class="header-section clearfix">
       
        <div class="container-fluid">
            <a class="site-logo">
                <img src="img/logo.png" alt="">
            </a>

            <div class="responsive-bar"><i class="fa fa-bars"></i></div>
            <a class="user"><i class="fa fa-bell"></i></a>
            <a id="subscribe" href="#element_subscribe" class="site-btn">Subscribe</a>
           
            <nav class="main-menu">
                <ul class="menu-list" runat="server">
                    <li><a id="about" href="#element_about">About</a></li>
                    <li><a href="#">News</a></li>
                    <li><a href="#">Contact</a></li>
                    <li><a href="user_tokens.aspx">User Tokens</a></li>

                    <li id="li_login" runat="server"><asp:LinkButton class="nav-link" runat="server" ID="btn_login"  OnClick="btn_logout_Click">Sign-up/login</asp:LinkButton></li>
                </ul>
            </nav>
             
        </div>
               
    </header>
    <!-- Header section end -->

    <!-- Hero section -->
    <section class="hero-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6 hero-text">
                    <h2>Invest In <span>Startups</span>
                        <br>
                        Crypto Coins</h2>
                    <h4>Use modern progressive technologies of ICO to earn money.</h4>
                    <!-- <?php echo form_open('email/send_mail', 'class="hero-subscribe-from"'); ?>
						<input type="text" name="" placeholder="Enter your email">
						<button class="site-btn sb-gradients">Get Started</button>
					<?php echo form_close();?> -->
                </div>
                <div class="col-md-6">
                    <img src="img/laptop.png" class="laptop-image" alt="">
                </div>
            </div>
        </div>
    </section>
    <!-- Hero section end -->

    <!-- About section -->
    <section id="element_about" class="about-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-6 about-text">
                    <h2>What is ICO <i class="fa fa-question"></i></h2>
                    <h5>Initial Coin Offerings (ICOs) are a popular fundraising method used primarily by startups wishing to offer products and services, usually related to the cryptocurrency and blockchain space.</h5>
                    <p>ICOs act as a way to raise funds, where a company looking to raise money to create a new coin, app, or service launches an ICO. Interested investors can buy into the offering and receive a new cryptocurrency token issued by the company. This token may have some utility in using the product or service the company is offering, or it may just represent a stake in the company or project.</p>
                    <!-- <a href="" class="site-btn sb-gradients sbg-line mt-5">Get Started</a> -->
                </div>
            </div>
            <div class="about-img">
                <img src="img/about-img.png" alt="">
            </div>
        </div>
    </section>
    <!-- About section end -->
    <!-- //================================================================== -->
    <div class="responsive-table m-2">
        <table class="table main-table">
            <thead class="thead-light">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Market Cap</th>
                    <th scope="col">Price</th>
                    <th scope="col">Volume(24h)</th>
                    <th scope="col">Circulating Supply</th>
                    <th scope="col">Change(24h)</th>
                </tr>
            </thead>
            <tbody class="table-body">
            </tbody>
        </table>
    </div>
    <!-- //================================================================== -->
    <!-- Newsletter section -->
    <section id="element_subscribe" class="newsletter-section gradient-bg">
        <div class="container text-white">
            <div class="row">
                <div class="col-lg-7 newsletter-text">
                    <h2>Subscribe to our Newsletter</h2>
                    <p>Subscribe for our weekly industry updates, insider perspectives and in-depth market analysis.</p>
                </div>
                <div class="col-lg-5 col-md-8 offset-lg-0 offset-md-2">
                    <div class="row">
                        <div class="col">
                        <asp:TextBox class="form-control" runat="server" ID="mailtxt" Text="enter your text"></asp:TextBox>                      
                            </div>
                        <div class="col">
                        <asp:button runat="server" ID="mailbtn" OnClick="mailbtn_Click" class="site-btn" style="color:black" Text="Get Started"></asp:button>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    

       
         
    </section>
    </form>
    <!-- Newsletter section end -->

    <!-- <h1><?= $data['ico']['finished'][0]['name'];?></h1>  -->
    <!-- <h1><?= $data[0]['id'];?></h1>  -->



    <!--====== Javascripts & Jquery ======-->
    <script src="scripts/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript">
        $("#about").click(function () {
            $('html, body').animate({
                scrollTop: $("#element_about").offset().top
            }, 1000);
        });
        $("#subscribe").click(function () {
            $('html, body').animate({
                scrollTop: $("#element_subscribe").offset().top
            }, 1000);
        });

   
    </script>
</body>
</html>
