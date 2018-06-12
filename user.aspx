<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="apple-touch-icon.png" rel="apple-touch-icon" />
    <link href="favicon.png" rel="icon" />
    <meta name="author" content="" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <title>User</title>
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
    <link rel="stylesheet" href="css/codingcss.css">
    <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--WARNING: Respond.js doesn't work if you view the page via file://-->
    <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
</head>
<!--[if IE 7]><body class="ie7 lt-ie8 lt-ie9 lt-ie10"><![endif]-->
<!--[if IE 8]><body class="ie8 lt-ie9 lt-ie10"><![endif]-->
<!--[if IE 9]><body class="ie9 lt-ie10"><![endif]-->
<body>
    <form id="form1" runat="server">

        <div class="header--sidebar"></div>
         <!--导航栏开始-->
        <header class="header header--2" data-responsive="1199">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-7 col-sm-12 col-xs-12 ">
                            <p>460 West 34th Street, 15th floor, New York - Hotline: 804-377-3580 - 804-399-3580</p>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12 ">
                            <a class="ps-search-btn" href="#"><i class="ps-icon--search"></i></a>
                            <div class="btn-group ps-dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USD<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">USD</a></li>
                                    <li><a href="#">SGD</a></li>
                                    <li><a href="#">ERO</a></li>
                                    <li><a href="#">JPN</a></li>
                                </ul>
                            </div>
                            <div class="btn-group ps-dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Language<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">English</a></li>
                                    <li><a href="#">Japanese</a></li>
                                    <li><a href="#">Chinese</a></li>
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
                            <li><a href="product-listing.html">List</a></li>
                            <li><a href="product-grid.html">Grid</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                    <a class="ps-logo" href="index.aspx">
                        <img src="images/logo-1.png" alt="" /></a>
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
                        <div class="ps-cart" id="LoadCart">
                            <div class="Cartbg" id="LoadC">
                                <a class="ps-cart__toggle" href="cart.aspx"><span><i id="CCNum" runat="server">0</i></span><i class="ps-icon--shopping-cart"></i></a>
                                <div class="ps-cart__listing">

                                    <div class="ps-cart__content">
                                        <asp:Repeater ID="rptMinCart" runat="server">
                                            <ItemTemplate>
                                                <div class="ps-cart-item">
                                                    <a class="ps-cart-item__close" href="#"></a>
                                                    <div class="ps-cart-item__thumbnail">
                                                        <a href="product-detail.aspx"></a>
                                                        <img src="<%#Eval("Img") %>" alt="">
                                                    </div>
                                                    <div class="ps-cart-item__content">
                                                        <a class="ps-cart-item__title" href="product-detail.aspx?id=<%#Eval("Id") %>"><%#Eval("Name") %></a>
                                                        <p>
                                                            <span>Quantity:<i><%#Eval("Quantity") %></i></span><br />
                                                            <span>Total:<i>£<%#Convert.ToDecimal(Eval("Price"))*Convert.ToDecimal(Eval("Quantity")) %></i></span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="ps-cart__total bgRed">
                                        <p>Number of items:<span id="MinNum" runat="server">36</span></p>
                                        <p>Item Total:<span id="MinTotal" runat="server">£528.00</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </nav>
        </header>

        <div id="back2top"><i class="fa fa-angle-up"></i></div>
        <div class="loader"></div>
        <div class="page-wrap">
            <div class="ps-section--hero">
                <img src="images/hero/03.jpg" alt="">
                <div class="ps-section__content text-center">
                    <h3 class="ps-section__title">User Centre</h3>
                    <div class="ps-breadcrumb">
                        <ol class="breadcrumb">
                            <li><a href="index.aspx">Home</a></li>
                            <li class="active">User Centre</li>
                        </ol>
                    </div>
                </div>
            </div>

            <!--用户中心开始-->
            <div class="cuk-layout" style="max-width: 1200px;">
                <div class="cuk-layout-aside" style="padding: 30px 0px; width: 300px; flex-basis: 300px;">
                    <asp:Repeater ID="rptUser" runat="server">
                        <ItemTemplate>
                            <div class="section-2ZI basic-info-2Ns">
                                <img class="cuk-avatar cuk-avatar-circle cuk-avatar-large avatar-36q" src="images/User.jpg" />
                                <p class="username-1y7"><%#Eval("UserName") %></p>
                                <p class="bio-_sm"></p>
                            </div>
                            <div class="section-2ZI follow-info-5YF">
                                <span class="count-3gW">账户余额</span>
                                <span class="divider-gPC">：</span>
                                <span class="count-3gW"><%#Eval("Balance") %></span>
                            </div>
                            <ul class="section-2ZI activity-info-BDI">
                                <li>联系方式：<%#Eval("TelNo") %></li>
                                <li>联系地址：<%#Eval("City")+","+Eval("Province")+","+Eval("Address") %></li>
                                <li class="clearfix"><span class="td-3ia">用户名：</span>mangyu</li>
                            </ul>
                            <ul class="section-2ZI profileInfo-1hl">
                                <li>性别：<%#Eval("Sex") %></li>
                                <li>出生日期：<%#Eval("Balance") %></li>
                            </ul>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <aside class="cuk-layout-content">
                        <div>
                            <div class="cuk-tab">
                                <div class="cuk-tab-bar-nav">
                                    <a class="cuk-tab-bar cuk-tab-bar-active" href="#">主页</a>
                                    <a href="#" class="cuk-tab-bar">个人</a>
                                    <a href="#" class="cuk-tab-bar">收藏</a>
                                    <a href="#" class="cuk-tab-bar">其他</a>
                                </div>
                                <div class="cuk-tab-panes">
                                    <div class="cuk-tab-pane">
                                        <div class="activity-header-3gx">
                                            <h3 class="activity-title-1mK">TA 的活跃度</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
</div>

             <!--用户中心开始-->
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
                                                    <img src="images/payment/1.png" alt=""></a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <img src="images/payment/2.png" alt=""></a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <img src="images/payment/3.png" alt=""></a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <img src="images/payment/4.png" alt=""></a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <img src="images/payment/5.png" alt=""></a>
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
                                        <p><strong>Monday - Friday</strong> 8:00 am - 8:30 pm</p>
                                        <p><strong>Satuday - Sunday</strong>10:00 am - 16:30 pm</p>
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
                                            <li><a href="#">Order</a></li>
                                            <li><a href="#">Shipping</a></li>
                                            <li><a href="#">Policy Return Policy</a></li>
                                            <li><a href="#">Payments</a></li>
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
                                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="#"><i class="fa fa-google"></i></a></li>
                                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                        </ul>
                                        <a href="#">
                                            <img src="images/app.jpg" alt=""></a>
                                        <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
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
    <script>
        $(function () {
            $("#LoadCart").load("cart.aspx" + " #LoadC");
            $("#aOut").click(function () {
                $.get("Handlers/Loginout.ashx", { work: "logout" }, function (data) {
                    if (data == "ok") {
                        $("#Use").load("user.aspx" + " #useload");
                    }
                })
            })
        })
    </script>
</body>
</html>
