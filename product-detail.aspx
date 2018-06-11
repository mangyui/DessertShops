<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product-detail.aspx.cs" Inherits="product_detail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="apple-touch-icon.png" rel="apple-touch-icon" />
    <link href="favicon.png" rel="icon" />
    <meta name="author" content="" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <title>Product Grid</title>
    <!-- Fonts-->
    <link href="https://fonts.lug.ustc.edu.cn/css?family=Libre+Baskerville:400,400i,700%7CPacifico%7CVarela+Round%7CPoppins" rel="stylesheet" />
    <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css" />
    <link rel="stylesheet" href="plugins/ps-icon/ps-icon.css" />
    <!-- CSS Library-->
    <link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="plugins/owl-carousel/assets/owl.carousel.css" />
    <link rel="stylesheet" href="plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css" />
    <link rel="stylesheet" href="plugins/Magnific-Popup/dist/magnific-popup.css" />
    <link rel="stylesheet" href="plugins/jquery-ui/jquery-ui.min.css" />
    <link rel="stylesheet" href="plugins/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="plugins/slick/slick/slick.css" />
    <link rel="stylesheet" href="plugins/revolution/css/settings.css" />
    <link rel="stylesheet" href="plugins/revolution/css/layers.css" />
    <link rel="stylesheet" href="plugins/revolution/css/navigation.css" />
    <!-- Custom-->
    <link rel="stylesheet" href="css/style.css" />
    <link href="plugins/ShowMessage/iview.css" rel="stylesheet" />
    <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--WARNING: Respond.js doesn't work if you view the page via file://-->
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!--[if IE 7]><body class="ie7 lt-ie8 lt-ie9 lt-ie10"><![endif]-->
<!--[if IE 8]><body class="ie8 lt-ie9 lt-ie10"><![endif]-->
<!--[if IE 9]><body class="ie9 lt-ie10"><![endif]-->

<body>
    <form id="form1" runat="server">
        <div class="ps-searchbox">
            <div class="ps-searchbox__remove"><i class="fa fa-remove"></i></div>
            <div class="container">
                <header>
                    <p>Enter your keywords:</p>
                    <input class="form-control" type="text" placeholder="">
                    <button><i class="ps-icon--search"></i></button>
                </header>
                <div class="ps-searchbox__result">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                            <div class="ps-product--list ps-product--list-light mt-60">
                                <div class="ps-product__thumbnail">
                                    <a class="ps-product__overlay" href="product-detail.html"></a>
                                    <img src="images/cake/img-cr-1.jpg" alt="">
                                </div>
                                <div class="ps-product__content">
                                    <h4 class="ps-product__title"><a href="product-detail.html">Amazin’ Glazin’</a></h4>
                                    <p>Lollipop dessert donut marzipan cookie bonbon sesame snaps chocolate.</p>
                                    <p class="ps-product__price">
                                        <del>£25.00</del>£15.00
                                    </p>
                                    <a class="ps-btn ps-btn--xs" href="cart.html">Order now<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                            <div class="ps-product--list ps-product--list-light mt-60">
                                <div class="ps-product__thumbnail">
                                    <a class="ps-product__overlay" href="product-detail.html"></a>
                                    <img src="images/cake/img-cr-2.jpg" alt="">
                                </div>
                                <div class="ps-product__content">
                                    <h4 class="ps-product__title"><a href="product-detail.html">The Crusty Croissant</a></h4>
                                    <p>Lollipop dessert donut marzipan cookie bonbon sesame snaps chocolate.</p>
                                    <p class="ps-product__price">
                                        <del>£25.00</del>£15.00
                                    </p>
                                    <a class="ps-btn ps-btn--xs" href="cart.html">Order now<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                            <div class="ps-product--list ps-product--list-light mt-60">
                                <div class="ps-product__thumbnail">
                                    <a class="ps-product__overlay" href="product-detail.html"></a>
                                    <img src="images/cake/img-cr-3.jpg" alt="">
                                </div>
                                <div class="ps-product__content">
                                    <h4 class="ps-product__title"><a href="product-detail.html">Amazin’ Glazin’</a></h4>
                                    <p>Lollipop dessert donut marzipan cookie bonbon sesame snaps chocolate.</p>
                                    <p class="ps-product__price">
                                        <del>£25.00</del>£15.00
                                    </p>
                                    <a class="ps-btn ps-btn--xs" href="cart.html">Order now<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                            <div class="ps-product--list ps-product--list-light mt-60">
                                <div class="ps-product__thumbnail">
                                    <a class="ps-product__overlay" href="product-detail.html"></a>
                                    <img src="images/cake/img-cr-4.jpg" alt="">
                                </div>
                                <div class="ps-product__content">
                                    <h4 class="ps-product__title"><a href="product-detail.html">The Crusty Croissant</a></h4>
                                    <p>Lollipop dessert donut marzipan cookie bonbon sesame snaps chocolate.</p>
                                    <p class="ps-product__price">
                                        <del>£25.00</del>£15.00
                                    </p>
                                    <a class="ps-btn ps-btn--xs" href="cart.html">Order now<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="text-center"><a class="ps-searchbox__morelink" href="product-grid.html">VIEW ALL RESULT</a></footer>
            </div>
        </div>
        <div class="header--sidebar"></div>
        <header class="header header--2" data-responsive="1199">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-7 col-sm-12 col-xs-12 ">
                            <p>460 West 34th Street, 15th floor, New York - Hotline: 804-377-3580 - 804-399-3580</p>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12 ">
                            <a class="ps-search-btn" href="#">
                                <i class="ps-icon--search"></i>
                            </a>
                            <div class="btn-group ps-dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USD
								<i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">USD</a>
                                    </li>
                                    <li>
                                        <a href="#">SGD</a>
                                    </li>
                                    <li>
                                        <a href="#">ERO</a>
                                    </li>
                                    <li>
                                        <a href="#">JPN</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-group ps-dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Language
								<i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">English</a>
                                    </li>
                                    <li>
                                        <a href="#">Japanese</a>
                                    </li>
                                    <li>
                                        <a href="#">Chinese</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <nav class="navigation">
                <div class="container">
                    <div class="menu-toggle"><span></span></div>
                    <div class="navigation__left">
                        <ul class="menu menu--left">
                            <li><a href="index.aspx">Home</a></li>
                            <li><a href="prodeuct-listing.html">List</a></li>
                            <li><a href="product-grid.html">Grid</a></li>
                             <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                    <a class="ps-logo" href="index.aspx">
                        <img src="images/logo-1.png" alt=""/></a>
                    <div class="navigation__right">
                        <ul class="menu menu--right">
                            <li><a href="about.html">About</a></li>
                        </ul>
                         <div id="Use">
                            <div id="useload">
                            <div class="ps-user" id="User">
                            </div>
                            <div id="UserName"><a href="#" id="aName" runat="server">MR YU</a>&nbsp;&nbsp;&nbsp;<a href="#" id="aOut" runat="server">Logout</a></div>
                        </div>
                          </div>
                        <div class="ps-cart" id="LoadCart"><div class="Cartbg" id="LoadC">
                        </div>
                        </div>
                    </div>
                </div>
            </nav>
        </header>
        <div id="back2top">
            <i class="fa fa-angle-up"></i>
        </div>
        <div class="loader"></div>
        <div class="page-wrap">
            <!-- Heros-->
            <div class="ps-section--hero">
                <img src="images/hero/02.jpg" alt="">
                <div class="ps-section__content text-center">
                    <h3 class="ps-section__title">OUR BAKERY</h3>
                    <div class="ps-breadcrumb">
                        <ol class="breadcrumb">
                            <li>
                                <a href="index.aspx">Home</a>
                            </li>
                            <li>
                                <a href="cart.aspx">Cart</a>
                            </li>
                            <li class="active">Anytime Cakes</li>
                        </ol>
                    </div>
                </div>
            </div>
            <div class="ps-section pt-80 pb-80">
                <div class="container">
                    <div class="ps-product--detail">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                                <div class="ps-product__image">
                                    <div class="ps-badge"><span id="PPHot" runat="server">£25.00</span></div>
                                    <img id="PPImg" runat="server" src="images/cake/img-cake-6.jpg" xq_big="true" setting='{"pwidth":400,"pheight":400,"margin_top":0,"margin_left":0}' />
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 ">
                                <header>
                                    <h3 id="PPName" runat="server" class="ps-product__name">Anytime Cakes</h3>
                                    <select class="ps-rating">
                                        <option value="1">1</option>
                                        <option value="1">2</option>
                                        <option value="1">3</option>
                                        <option value="1">4</option>
                                        <option value="5">5</option>
                                    </select>
                                    <p class="ps-product__price">
                                        £<asp:Literal ID="litNewprice" Text="15.00" runat="server" />
                                        <del id="PPOldprice" runat="server">£25.00</del>
                                    </p>
                                    <a class="ps-product__quickview popup-modal" href="#quickview-modal" data-effect="mfp-zoom-out">QUICK OVERVIEW</a>
                                    <div class="ps-product__description">
                                        <p>
                                            Lollipop dessert donut marzipan cookie bonbon sesame snaps chocolate. Cupcake sweet roll sweet dragée dragée. Lollipop
										dessert donut marzipan cookie bonbon sesame snaps chocolate cake.
                                        </p>
                                        <p>
                                            Toffee chocolate cake apple pie sugar plum sesame snaps muffin cake pudding cupcake. Muffin danish muffin lollipop
										biscuit jelly beans oat cake croissant.
                                        </p>
                                    </div>
                                    <div class="ps-product__meta">
                                        <p>
                                            <span>Availability: </span>In stock
                                        </p>
                                        <p class="category">
                                            <span>CATEGORIES: </span>
                                            <a href="#">Cupcake</a>,
										<a href="#">organic</a>,
										<a href="#">sugar</a>,
										<a href="#">sweet</a>,
										<a href="#">bio</a>
                                        </p>
                                    </div>
                                    <div class="form-group ps-product__size">
                                        <label>Size:</label>
                                        <select class="ps-select" data-placeholder="Popupar product">
                                            <option value="01">CHOOSE AN OPTION</option>
                                            <option value="01">Item 01</option>
                                            <option value="02">Item 02</option>
                                            <option value="03">Item 03</option>
                                        </select>
                                    </div>
                                    <div class="ps-product__shop">
                                        <div class="form-group--number">
                                            <button class="minus">
                                                <span>-</span>
                                            </button>
                                            <input class="form-control" id="inputNum" type="text" value="1" />
                                            <button class="plus">
                                                <span>+</span>
                                            </button>
                                        </div>
                                        <ul class="ps-product__action">
                                            <li>
                                                <a href="#" data-tooltip="Add to wishlist">
                                                    <i class="ps-icon--heart"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#" data-tooltip="Compare">
                                                    <i class="ps-icon--reload"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </header>
                                <footer>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-5 col-sm-6 col-xs-12 ">
                                            <asp:Repeater ID="rptaddCart" runat="server">
                                                <ItemTemplate>
                                                    <a class="ps-btn--fullwidth ps-btn" href="#" id="PaddCart" data-pid="<%#Eval("Id") %>">Purchase Now
											<i class="fa fa-angle-right"></i>
                                                    </a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12 ">
                                            <p class="ps-product__sharing">
                                                Share with:
											<a href="#">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                                <a href="#">
                                                    <i class="fa fa-google-plus"></i>
                                                </a>
                                                <a href="#">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                </footer>
                            </div>
                        </div>
                        <div class="ps-product__info">
                            <ul class="tab-list" role="tablist">
                                <li class="active">
                                    <a href="#tab_01" aria-controls="tab_01" role="tab" data-toggle="tab">Overview</a>
                                </li>
                                <li>
                                    <a href="#tab_02" aria-controls="tab_02" role="tab" data-toggle="tab">Review</a>
                                </li>
                                <li>
                                    <a href="#tab_03" aria-controls="tab_03" role="tab" data-toggle="tab">PRODUCT TAG</a>
                                </li>
                                <li>
                                    <a href="#tab_04" aria-controls="tab_04" role="tab" data-toggle="tab">ADDITIONAL</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content mb-60">
                            <div class="tab-pane active" role="tabpanel" id="tab_01">
                                <p>
                                    Caramels tootsie roll carrot cake sugar plum. Sweet roll jelly bear claw liquorice. Gingerbread lollipop dragée cake.
								Pie topping jelly-o. Fruitcake dragée candy canes tootsie roll. Pastry jelly-o cupcake. Bonbon brownie soufflé muffin.
                                </p>
                                <p>
                                    Sweet roll soufflé oat cake apple pie croissant. Pie gummi bears jujubes cake lemon drops gummi bears croissant macaroon
								pie. Fruitcake tootsie roll chocolate cake Carrot cake cake bear claw jujubes topping cake apple pie. Jujubes gummi
								bears soufflé candy canes topping gummi bears cake soufflé cake. Cotton candy soufflé sugar plum pastry sweet roll..
                                </p>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab_02">
                                <p>1 review for Cupcakes Red Flowers</p>

                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab_03">
                                <p>
                                    Add your tag
								<span>*</span>
                                </p>

                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab_04">
                                <div class="form-group">
                                    <textarea class="form-control" rows="6" placeholder="Enter your addition here..."></textarea>
                                </div>
                                <div class="form-group">
                                    <button class="ps-btn" type="button">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="ps-section ps-section--best-seller pt-40 pb-100">
                <div class="container">
                    <div class="ps-section__header text-center mb-50">
                        <h4 class="ps-section__top">Sweet Cupcakes</h4>
                        <h3 class="ps-section__title ps-section__title--full">BEST SELLER</h3>
                    </div>
                    <div class="ps-section__content">
                        <div class="owl-slider owl-slider--best-seller" data-owl-auto="true" data-owl-loop="true" data-owl-speed="100000" data-owl-gap="30"
                            data-owl-nav="true" data-owl-dots="false" data-owl-animate-in="" data-owl-animate-out="" data-owl-item="4" data-owl-item-xs="1"
                            data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-nav-left="&lt;i class=&quot;ps-icon--back&quot;&gt;&lt;/i&gt;"
                            data-owl-nav-right="&lt;i class=&quot;ps-icon--next&quot;&gt;&lt;/i&gt;">
                            <asp:Repeater ID="rptProduct3" runat="server">
                                <ItemTemplate>
                                    <div class="ps-product">
                                        <div class="ps-product__thumbnail pring">
                                            <div class="ps-badge ps-badge--new"><span>-20%</span></div>
                                            <div class="ps-badge"><span><%#Eval("Label") %></span></div>
                                            <a class="ps-product__overlay" href="product-detail.aspx?id=<%#Eval("Id") %>"></a>
                                            <img src="<%#Eval("ImgPath") %>" alt="">
                                            <ul class="ps-product__action">
                                                <li><a class="popup-modal" href="#quickview-modal" data-effect="mfp-zoom-out" data-tooltip="View"><i class="ps-icon--search"></i></a></li>
                                                <li><a href="#" data-tooltip="Add to wishlist"><i class="ps-icon--heart"></i></a></li>
                                                <li><a href="#" data-tooltip="Compare"><i class="ps-icon--reload"></i></a></li>
                                                <li><a class=" addCart" data-tooltip="Add to cart" data-pid="<%#Eval("Id") %>"><i class="ps-icon--shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="ps-product__content">
                                            <a class="ps-product__title" href="product-detail.aspx?id=<%#Eval("Id") %>"><%#Eval("Name") %></a>
                                            <div class="ps-product__category">
                                                <a class="ps-product__category" href="#">cupcake</a><a class="ps-product__category" href="#">sweet</a><a class="ps-product__category" href="#">bio</a>
                                            </div>
                                            <select class="ps-rating">
                                                <option value="1">1</option>
                                                <option value="1">2</option>
                                                <option value="1">3</option>
                                                <option value="1">4</option>
                                                <option value="5">5</option>
                                            </select>
                                            <p class="ps-product__price">£<%#Eval("NewPrice") %></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </section>
            <!--footer-->
            <footer class="ps-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 ">
                            <div class="ps-widget ps-widget--footer ps-widget--payment">
                                <div class="ps-widget__header">
                                    <h3 class="ps-widget__title">PAYMENTS ACCEPTED</h3>
                                </div>
                                <div class="ps-widget__content">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/1.png" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/2.png" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/3.png" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/4.png" alt="">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/5.png" alt="">
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 ">
                            <div class="ps-widget ps-widget--footer ps-widget--worktime">
                                <div class="ps-widget__header">
                                    <h3 class="ps-widget__title">WORK TIME</h3>
                                </div>
                                <div class="ps-widget__content">
                                    <p>
                                        <strong>Monday - Friday</strong> 8:00 am - 8:30 pm
                                    </p>
                                    <p>
                                        <strong>Satuday - Sunday</strong>10:00 am - 16:30 pm
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 ">
                            <div class="ps-widget ps-widget--footer ps-widget--order">
                                <div class="ps-widget__header">
                                    <h3 class="ps-widget__title">ORDERS AND RETURNS</h3>
                                </div>
                                <div class="ps-widget__content">
                                    <ul class="ps-list--line">
                                        <li>
                                            <a href="#">Order</a>
                                        </li>
                                        <li>
                                            <a href="#">Shipping</a>
                                        </li>
                                        <li>
                                            <a href="#">Policy Return Policy</a>
                                        </li>
                                        <li>
                                            <a href="#">Payments</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 ">
                            <div class="ps-widget ps-widget--footer ps-widget--connect">
                                <div class="ps-widget__header">
                                    <h3 class="ps-widget__title">CONNECT US</h3>
                                </div>
                                <div class="ps-widget__content">
                                    <ul class="ps-widget__social">
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-facebook"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-google"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </li>
                                    </ul>
                                    <a href="#">
                                        <img src="images/app.jpg" alt="" />
                                    </a>
                                      <p>Copyright &copy; 2017. <strong> By 25 余会明</strong>  else.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <div class="modal-popup mfp-with-anim mfp-hide" id="quickview-modal" tabindex="-1">
                <button class="modal-close">
                    <i class="fa fa-remove"></i>
                </button>
                <div class="ps-product-modal ps-product--detail clearfix">
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                        <div class="ps-product__thumbnail">
                            <div class="quickview--main" data-owl-auto="true" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="0" data-owl-nav="false"
                                data-owl-dots="false" data-owl-animate-in="" data-owl-animate-out="" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1"
                                data-owl-item-md="1" data-owl-item-lg="1" data-owl-nav-left="&lt;i class=&quot;fa fa-angle-left&quot;&gt;&lt;/i&gt;"
                                data-owl-nav-right="&lt;i class=&quot;fa fa-angle-right&quot;&gt;&lt;/i&gt;">
                                <div class="ps-product__image">
                                    <img src="images/cake/img-cake-12.jpg" alt="">
                                </div>
                                <div class="ps-product__image">
                                    <img src="images/cake/img-cake-11.jpg" alt="">
                                </div>
                                <div class="ps-product__image">
                                    <img src="images/cake/img-cake-10.jpg" alt="">
                                </div>
                                <div class="ps-product__image">
                                    <img src="images/cake/img-cake-6.jpg" alt="">
                                </div>
                                <div class="ps-product__image">
                                    <img src="images/cake/img-cake-5.jpg" alt="">
                                </div>
                            </div>
                            <div class="quickview--thumbnail" data-owl-auto="true" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="20" data-owl-nav="false"
                                data-owl-dots="false" data-owl-animate-in="" data-owl-animate-out="" data-owl-item="4" data-owl-item-xs="2" data-owl-item-sm="3"
                                data-owl-item-md="4" data-owl-item-lg="4" data-owl-nav-left="&lt;i class=&quot;fa fa-angle-left&quot;&gt;&lt;/i&gt;"
                                data-owl-nav-right="&lt;i class=&quot;fa fa-angle-right&quot;&gt;&lt;/i&gt;">
                                <img src="images/cake/img-cake-12.jpg" alt="">
                                <img src="images/cake/img-cake-11.jpg" alt="">
                                <img src="images/cake/img-cake-10.jpg" alt="">
                                <img src="images/cake/img-cake-6.jpg" alt="">
                                <img src="images/cake/img-cake-5.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 ">
                        <header>
                            <h3 class="ps-product__name">Anytime Cakes</h3>
                            <select class="ps-rating">
                                <option value="1">1</option>
                                <option value="1">2</option>
                                <option value="1">3</option>
                                <option value="1">4</option>
                                <option value="5">5</option>
                            </select>
                            <p class="ps-product__price">
                                £15.00
							<del>£25.00</del>
                            </p>
                            <div class="ps-product__meta">
                                <p>
                                    <span>Availability: </span>In stock
                                </p>
                                <p class="category">
                                    <span>CATEGORIES: </span>
                                    <a href="#">Cupcake</a>,
								<a href="#">organic</a>,
								<a href="#">sugar</a>,
								<a href="#">sweet</a>,
								<a href="#">bio</a>
                                </p>
                            </div>
                            <div class="form-group ps-product__size">
                                <label>Size:</label>
                                <select class="ps-select" data-placeholder="Popupar product">
                                    <option value="01">Choose a option</option>
                                    <option value="01">Item 01</option>
                                    <option value="02">Item 02</option>
                                    <option value="03">Item 03</option>
                                </select>
                            </div>
                            <div class="ps-product__shop">
                                <div class="form-group--number">
                                    <button class="minus">
                                        <span>-</span>
                                    </button>
                                    <input class="form-control" type="text" value="1">
                                    <button class="plus">
                                        <span>+</span>
                                    </button>
                                </div>
                                <ul class="ps-product__action">
                                    <li>
                                        <a href="#" data-tooltip="Add to wishlist">
                                            <i class="ps-icon--heart"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" data-tooltip="Compare">
                                            <i class="ps-icon--reload"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </header>
                        <footer>
                            <a class="ps-btn--fullwidth ps-btn ps-btn--sm" href="#">Purchase
							<i class="fa fa-angle-right"></i>
                            </a>
                            <p class="ps-product__sharing">
                                Share with:
							<a href="#">
                                <i class="fa fa-facebook"></i>
                            </a>
                                <a href="#">
                                    <i class="fa fa-google-plus"></i>
                                </a>
                                <a href="#">
                                    <i class="fa fa-twitter"></i>
                                </a>
                            </p>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
            <div class="ivu-message" id="ShowMessage" style="top: 120px;"></div>
    </form>
    <!-- JS Library-->
    <script type="text/javascript" src="plugins/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="plugins/owl-carousel/owl.carousel.min.js"></script>
    <script type="text/javascript" src="plugins/overflow-text.js"></script>
    <script type="text/javascript" src="plugins/masonry.pkgd.min.js"></script>
    <script type="text/javascript" src="plugins/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="plugins/jquery-nice-select/js/jquery.nice-select.min.js"></script>
    <script type="text/javascript" src="plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="plugins/moment.js"></script>
    <script type="text/javascript" src="plugins/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" src="plugins/slick/slick/slick.min.js"></script>
    <script type="text/javascript" src="plugins/skrollr.min.js"></script>
    <script type="text/javascript" src="plugins/gmap3.min.js"></script>
    <script type="text/javascript" src="http://ditu.google.cn/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script>
    <!-- Revolution - slider-->
    <script type="text/javascript" src="plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
    <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
    <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
    <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
    <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
    <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="js/main.js"></script>
    <script src="plugins/ShowMessage/message.js"></script>
    <script type="text/javascript" src="js/xq_bigimg.js"></script>
    <script>
        $(function () {
            $("#LoadCart").load("cart.aspx" + " #LoadC");
            $(".form-group--number .minus").click(function () {
                if ($(this).next().val() > 1) {
                    $(this).next().val($(this).next().val() * 1 - 1);
                }
                return false;
            })
            $(".form-group--number .plus").click(function () {
                $(this).prev().val($(this).prev().val() * 1 + 1);
                return false;
            })
            $("#PaddCart").click(function () {
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: $(".form-group--number input.form-control").val(),
                    work: "+",
                }, function (data) {
                    if (data != "error") {
                        $(".ps-cart__toggle span i").text(data);
                        $("#LoadCart").load("cart.aspx" + " #LoadC");
                        message("success", "加入购物车成功！", 2000);
                    }
                })

                return false;
            })
            $(".addCart").css("cursor", "pointer").click(function () {
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 1,
                    work: "+",
                }, function (data) {
                    if (data != "error") {
                        $(".ps-cart__toggle span i").text(data);
                        $("#LoadCart").load("cart.aspx" + " #LoadC");
                        message("success", "加入购物车成功！", 2000);
                    }
                })
            });
            $("#aOut").click(function () {
                $.get("Handlers/Loginout.ashx", { work: "logout" }, function (data) {
                    if (data == "ok") {
                        $("#Use").load("product-detail.aspx" + " #useload");
                    }
                })
            })
        })
    </script>
</body>
</html>
