<!DOCTYPE html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="crypto.WebForm1" %>



<head runat="server">
    <html>
</head>
<body>
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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <div class="page-info-section">	
</div>


<div class="container border border-secondary mt-2">
	<div class="pl-4 m-4">
		<img width="50px" height="50px" class="img-id float-left mr-2">
		<h3 class="pt-2"><b><span class="name"></span></b><span class="symbol"></span></h3>
	</div>
	<div class="row pl-4 m-4">
		<div class="col-lg-6">
			<h4>Price : <span class="price"></span> <span class="price_change_pct"></span></h4>
			<p>Market Cap : <span class="market_cap"></span></p>
		</div>
		<div class="col-lg-6">
			<a target="_blank" class="btn btn-outline-primary m-3 website_url">WEBSITE</a>
			<a target="_blank" class="btn btn-outline-primary whitepaper_url">WHITEPAPER</a>
		</div>
	</div>
	<div class="row pl-4 m-4">
		<div class="col-lg-6">
			<h4>Description</h4>
			<p class="description"></p>
		</div>
		<div class="col-lg-6">
			<h4 class="pl-3">Market Data</h4>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>Market Rank</p>
				<p class="market_rank"></p>
			</div>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>Price</p>
				<p class="price">$12</p>
			</div>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>Market Cap</p>
				<p class="market_cap"></p>
			</div>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>24 Hour Volume</p>
				<p class="24_hour_volume"></p>
			</div>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>Circulating Supply </p>
				<p class="circulating_supply">$12</p>
			</div>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>1 day Price change</p>
				<p class="1_day_price_change">$12</p>
			</div>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>7 day Price change</p>
				<p class="7_day_price_change">$12</p>
			</div>
			<div class="d-flex justify-content-between pl-3" style="width:70%">
				<p>30 day Price change</p>
				<p class="30_day_price_change">$12</p>
			</div>
		</div>
	</div>
	<div class="pl-4 m-4">
		<h4><span class="name"></span>Chart</h4>
		 <div id="controls" style="width: 100%; overflow: hidden;">
    	<div style="float: left; margin-left: 15px;">
		    From: <input type="text" id="fromfield" class="amcharts-input" placeholder="yyyy-MM-dd" />
		    To: <input type="text" id="tofield" class="amcharts-input" placeholder="yyyy-MM-dd" />
	    </div>
	    <div style="float: right; margin-right: 15px;">
		    <button id="b1m" class="amcharts-input">1m</button>
		    <button id="b3m" class="amcharts-input">3m</button>
		    <button id="b6m" class="amcharts-input">6m</button>
		    <button id="b1y" class="amcharts-input">1y</button>
		    <button id="bytd" class="amcharts-input">YTD</button>
		    <button id="bmax" class="amcharts-input">MAX</button>
	    </div>
	    </div>
		<div id="chartdiv"></div>
	</div>
</div>
     <script src="scripts/jquery-3.3.1.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
   
</body>
</html>
