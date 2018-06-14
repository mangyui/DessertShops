<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

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
    <title>Cart</title>
    <!-- Fonts-->
<link href="https://fonts.googleapis.com/css?family=Libre+Baskerville:400,400i,700%7CPacifico%7CVarela+Round%7CPoppins" rel="stylesheet"/>
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
        <!--滚动条-->
        <div class="header--sidebar"></div>
        <!--导航栏开始-->
        <header class="header header--2" data-responsive="1183">
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
        <!--导航栏结束-->
        <div id="back2top"><i class="fa fa-angle-up"></i></div>
        <div class="loader"></div>

        <div class="page-wrap">
            <!--section-->
            <div class="ps-section--hero">
                <img src="images/hero/01.jpg" alt="">
                <div class="ps-section__content text-center">
                    <h3 class="ps-section__title">OUR BAKERY</h3>
                    <div class="ps-breadcrumb">
                        <ol class="breadcrumb">
                            <li><a href="index.aspx">Home</a></li>
                            <li class="active">Cart</li>
                        </ol>
                    </div>
                </div>
            </div>

            <!--购物车列表开始-->
            <div class="ps-section--cart pt-100 pb-100">
                <div class="container">
                    <div class="ps-cart-listing">
                        <p class="hidden-lg"><i>Slide right to view</i></p>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>All Products</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptCart" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <div class="ps-product--cart">
                                                        <img src="<%#Eval("Img") %>" alt=""><a href="product-detail.aspx?id=<%#Eval("Id") %>"><%#Eval("Name") %></a>
                                                    </div>
                                                </td>
                                                <td>$<span id="Pprice"><%#Eval("Price") %></span></td>
                                                <td>
                                                    <div class="form-group--number">
                                                        <button class="minus" data-pid="<%#Eval("Id") %>"><span>-</span></button>
                                                        <input class="form-control" type="text" value="<%#Eval("Quantity") %>">
                                                        <button class="plus" data-pid="<%#Eval("Id") %>"><span>+</span></button>
                                                    </div>
                                                </td>
                                                <td><span class="total-row">150$</span></td>
                                                <td>
                                                    <div class="ps-cart-listing__remove" data-pid="<%#Eval("Id") %>"></div>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <div class="ps-cart__process">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
                                    <div class="form-group form-group--icon ps-cart__promotion">
                                        <div class="icon-wrap">
                                            <i class="fa fa-angle-right"></i>
                                            <a id="removeAll" class="ps-cart__shopping">Remove All</a>
                                        </div>
                                    </div>
                                    <div class="form-groupform-order">
                                        <a href="index.aspx" id="ConShop" class="ps-cart__shopping">Continue Shopping</a>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                    <div class="ps-cart__total">
                                        <p>Total Price: <span id="TotalM">2599$</span></p>
                                        <a id="aPay" class="ps-btn ps-btn--sm ps-btn--fullwidth" href="#quickview-modal">Process to checkout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--购物车列表结束-->

            <!--关于我们开始-->
            <section class="ps-section ps-section--subscribe pt-80 pb-80">
                <div class="container">
                    <div class="ps-subscribe">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                                <h4>ABOUT US</h4>
                                <p>Te pri oblique ullamcorper, magna persequeris has eu. Mei prompta dolores examad debet suavitate. Pri te vocibus electram. Eu eleifend rationibus vis, at.</p>
                                <p class="text-uppercase ps-subscribe__highlight">240 CENTRAL PARK, LONDON, OR 10019</p>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 ">
                                <a class="ps-subscribe__logo" href="index.aspx">
                                    <img src="images/logo-1.png" alt="" /></a>
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                                <h4>SUBSCRIBE EMAIL</h4>
                                <p>Give us your email, and we shall send regular updates for new stuff and events.</p>
                                <input class="form-control" type="text" placeholder="Type your email..." />
                                <button class="ps-btn ps-btn--sm">Subscribe</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--关于我们结束-->
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
                                                <img src="images/payment/1.png" alt="" /></a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/2.png" alt="" /></a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/3.png" alt="" /></a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/4.png" alt="" /></a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <img src="images/payment/5.png" alt="" /></a>
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
                                        <img src="images/app.jpg" alt="" /></a>
                                    <p>Copyright &copy;25余会明</p>
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
    <script src="plugins/ShowMessage/message.js"></script>
    <script>
        $(function () {
            //$("#LoadCart").load("cart.aspx" + " #LoadC");
            mySum();
            $("#aOut").click(function () {
                $.get("Handlers/Loginout.ashx", { work: "logout" }, function (data) {
                    if (data == "ok") {
                        $("#Use").load("index.aspx" + " #useload");
                    }
                })
            })
            $("table .form-group--number .minus").click(function () {
                $minus = $(this);
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 1,
                    work: "-",
                }, function (data) {
                    if (data != "error") {
                        $minus.next().val($minus.next().val() * 1 - 1);
                        if ($minus.next().val() == 0) {
                            $minus.parents("tr").fadeOut(1000, function () {
                                $(this).remove();

                            })
                        }
                        mySum();
                        $("#LoadCart").load("cart.aspx" + " #LoadC");

                    }
                })

                return false;
            })
            $("table .form-group--number .plus").click(function () {
                $plus = $(this);
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 1,
                    work: "+",
                }, function (data) {
                    if (data != "error") {
                        $plus.prev().val($plus.prev().val() * 1 + 1);
                        mySum();
                        $("#LoadCart").load("cart.aspx" + " #LoadC");
                    }
                })

                return false;
            })
            $(".ps-cart-listing__remove").click(function () {
                $remove = $(this);
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 0,
                    work: "-",
                }, function (data) {
                    if (data != "error") {
                        $remove.parents("tr").fadeOut(1000, function () {
                            $(this).remove();
                            mySum();
                        })
                        $("#LoadCart").load("cart.aspx" + " #LoadC");
                        message("success", "删除该商品成功！", 2000);
                    }
                })

            })
            $("#removeAll").click(function () {
                $(".ps-cart-listing__remove").click();
                $("tbody tr").fadeOut(1000, function () {
                    $(this).remove();
                    mySum();
                });
                return false;
            })
            function mySum() {
                var sum = 0;
                $("tbody tr").each(function () {
                    var eachNum = $(this).find(".form-control").val() * 1;
                    var eachSum = $(this).find("#Pprice").text() * 1 * eachNum;
                    $(this).find("span.total-row").text(eachSum.toFixed(2) + "$");
                    sum += eachSum;
                })

                $("#TotalM").text(sum.toFixed(2) + "$");
            }
            $("div.ps-product--cart").css("cursor", "pointer").click(function () {
                window.location.href = $(this).find("a").attr("href");
            })
            $("#aPay").on("click", function (e) {

                $.post("Handlers/ChangeMoney.ashx", { type: "-" }, function (data) {
                    if (data == "ok") {
                        message("success", "下单成功！", 2000, e);
                        setTimeout(function () {
                            window.location.href = "user.aspx";
                        }, 2000);
                    }
                    else if (data == "errormoney")
                        message("error", "账户余额不足，请充值", 2000, e);
                    else if (data == "errorcart")
                        message("error", "购物车为空！", 2000, e);
                    else if (data == "errorcustomer")
                        message("error", "请先登录", 2000, e);
                    else
                        message("error", "未知错误！", 2000, e);
                })

            })
        })
    </script>
</body>
</html>
