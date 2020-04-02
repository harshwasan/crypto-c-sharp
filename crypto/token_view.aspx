<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="token_view.aspx.cs" Inherits="crypto.token_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="UTF-8" />
    <meta name="description" content="Cryptocurrency Landing Page Template" />
    <meta name="keywords" content="cryptocurrency, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Favicon -->
    <link href="~/img/favicon_io/favicon.ico" rel="shortcut icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" />

    <!-- Stylesheets -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/themify-icons.css" />
    <link rel="stylesheet" href="css/owl.carousel.css" />
    <link rel="stylesheet" href="css/style.css" />


    <script src="https://www.amcharts.com/lib/4/core.js"></script>
    <script src="https://www.amcharts.com/lib/4/charts.js"></script>
    <script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

    <link href="css/bootstrap.min.css" rel="stylesheet" />
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
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header-section clearfix">

            <div class="container-fluid">
                <a class="site-logo">
                    <img src="img/logo.png" alt="">
                </a>

                <div class="responsive-bar"><i class="fa fa-bars"></i></div>
                <a class="user"><i class="fa fa-bell"></i></a>


                <nav class="main-menu">
                    <ul class="menu-list" runat="server">
                        <li><a style="color: black" id="about" href="#element_about">About</a></li>
                        <li><a style="color: black" href="#">News</a></li>
                        <li><a style="color: black" href="#">Contact</a></li>
                        <li><a style="color: black" href="user_tokens.aspx">User Tokens</a></li>

                        <li id="li_login" runat="server">
                            <asp:LinkButton Style="color: black" class="nav-link" runat="server" ID="btn_login" OnClick="btn_logout_Click">Sign-up/login</asp:LinkButton></li>
                    </ul>
                </nav>

            </div>

        </header>


        <div>


            <div class="container border border-secondary mt-2">
                <div class="pl-4 m-4">
                    <%--<img width="50px" height="50px" class="img-id float-left mr-2">--%>
                    <h3 class="pt-2"><b><span class="name"></span></b><span class="symbol"></span></h3>
                </div>
                <div class="row pl-4 m-4">
                    <div class="col-lg-6">
                        <h4>Price : <span id="spnprice" runat="server" class="price"></span><span class="price_change_pct"></span></h4>
                        <p>Market Cap : <span class="market_cap"></span></p>
                        <h5 id="headerperdict" runat="server">Predicted value:<asp:Label runat="server" ID="predictedvalue"></asp:Label>
                        </h5>
                        <p>
                            <asp:Label runat="server" ID="recommendation"></asp:Label>
                        </p>
                    </div>
                    <div class="col-lg-6">
                        <a href="_blank" class="btn btn-outline-primary m-3 website_url">WEBSITE</a>
                        <a href="_blank" class="btn btn-outline-primary whitepaper_url">WHITEPAPER</a>
                    </div>
                </div>
                <div class="row pl-4 m-4">
                    <div class="col-lg-6">
                        <h4>Description</h4>
                        <p class="description"></p>
                    </div>
                    <div class="col-lg-6">
                        <h4 class="pl-3">Market Data</h4>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>Market Rank</p>
                            <p class="market_rank"></p>
                        </div>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>Price</p>
                            <p class="price">$12</p>
                        </div>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>Market Cap</p>
                            <p class="market_cap"></p>
                        </div>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>24 Hour Volume</p>
                            <p class="24_hour_volume"></p>
                        </div>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>Circulating Supply </p>
                            <p class="circulating_supply">$12</p>
                        </div>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>1 day Price change</p>
                            <p class="1_day_price_change">$12</p>
                        </div>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>7 day Price change</p>
                            <p class="7_day_price_change">$12</p>
                        </div>
                        <div class="d-flex justify-content-between pl-3" style="width: 70%">
                            <p>30 day Price change</p>
                            <p class="30_day_price_change">$12</p>
                        </div>
                    </div>
                    <div class="col-lg-6">

                        <div class="responsive-table m-2">
                            <asp:GridView runat="server" class="table table-condensed" UseAccessibleHeader="true" GridLines="None" ID="gridview" AutoGenerateColumns="False" PageSize="13" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr No">

                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Volume Owned">
                                        <ItemTemplate>
                                            <asp:Label ID="Vol_owned" runat="server"
                                                Text='<%# Bind("volume") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cost you bought at">
                                        <ItemTemplate>
                                            <asp:Label ID="cost_you_bought_at" runat="server"
                                                Text='<%# Bind("costboughtat")  %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Profit/Loss">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="profit_loss" Text='<%# Bind("profit") %> '></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   


                                </Columns>
                            </asp:GridView>
                        </div>


                    </div>
                </div>
                <div class="pl-4 m-4">
                    <h4><span class="name"></span>Chart</h4>
                    <div id="controls" style="width: 100%; overflow: hidden;">
                        <div style="float: left; margin-left: 15px;">
                            From:
                            <input type="text" id="fromfield" class="amcharts-input" placeholder="yyyy-MM-dd" />
                            To:
                            <input type="text" id="tofield" class="amcharts-input" placeholder="yyyy-MM-dd" />
                        </div>
                        <div style="float: right; margin-right: 15px;">
                            <asp:LinkButton ID="b1m" class="amcharts-input">1m</asp:LinkButton>
                            <asp:LinkButton ID="b3m" class="amcharts-input">3m</asp:LinkButton>
                            <asp:LinkButton ID="b6m" class="amcharts-input">6m</asp:LinkButton>
                            <asp:LinkButton ID="b1y" class="amcharts-input">1y</asp:LinkButton>
                            <asp:LinkButton ID="bytd" class="amcharts-input">YTD</asp:LinkButton>
                            <asp:LinkButton ID="bmax" class="amcharts-input">MAX</asp:LinkButton>
                        </div>
                    </div>
                    <div id="chartdiv"></div>
                </div>
            </div>


        </div>
        <script src="scripts/jquery-3.3.1.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </form>
</body>
</html>
