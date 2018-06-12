<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

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
    <title>Home</title>
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

<body class="page-init">
    <form id="form1" runat="server">
        <!--搜索界面开始-->
        <div class="ps-searchbox">
            <div class="ps-searchbox__remove"><i class="fa fa-remove"></i></div>
            <div class="container">
                <header>
                    <p>Enter your keywords:</p>
                    <input class="form-control" type="text" placeholder="" />
                    <button><i class="ps-icon--search"></i></button>
                </header>
                <div class="ps-searchbox__result">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                            <div class="ps-product--list ps-product--list-light mt-60">
                                <div class="ps-product__thumbnail">
                                    <a class="ps-product__overlay" href="product-detail.html"></a>
                                    <img src="images/cake/img-cr-1.jpg" alt="" />
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
        <!--搜索界面结束-->
        <!--滚动条开始-->
        <div class="header--sidebar"></div>
        <!--滚动条结束-->
        <!--导航栏开始-->
        <header class="header" data-responsive="1183">
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
                        </div></div>
                        <div class="ps-cart" id="LoadCart"><div class="Cartbg" id="LoadC">
                           
                        </div>
                   </div>
                        </div>
                </div>
            </nav>
        </header>
        <!--导航栏结束-->
        <!--回到顶部开始-->
        <div id="back2top"><i class="fa fa-angle-up"></i></div>
        <!--回到顶部结束-->
        <div class="loader"></div>
        <div class="page-wrap">
            <div class="ps-banner--home-1">
                <div class="rev_slider_wrapper fullscreen-container" id="revolution-slider-1" data-alias="concept121" data-source="gallery" style="background-color: #000000; padding: 0px;">
                    <div class="rev_slider fullscreenbanner" id="rev_slider_1059_1" style="display: none;" data-version="5.4.1">
                        <ul class="ps-banner">
                            <li data-index="rs-2972" data-transition="slidingoverlayhorizontal" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default" data-thumb="../../assets/images/concept4-100x100.jpg" data-rotate="0" data-saveperformance="off" data-title="Web Show" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                                <img class="rev-slidebg" src="images/banner/img-slider-1.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" data-no-retina="" />
                                <div class="tp-caption ps-banner__caption" id="layer01" data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']" data-voffset="['-100','-80','-120','-120']" data-width="['none','none','none','400']" data-whitespace="['nowrap','nowrap','nowrap','normal']" data-type="text" data-responsive_offset="on" data-frames="[{&quot;from&quot;:&quot;z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;&quot;,&quot;speed&quot;:1500,&quot;to&quot;:&quot;o:1;&quot;,&quot;delay&quot;:1700,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1000,&quot;to&quot;:&quot;x:left(R);&quot;,&quot;ease&quot;:&quot;Power3.easeIn&quot;}]" style="z-index: 7; white-space: nowrap; text-transform: left;">We Implement Sweet Dream</div>
                                <div class="tp-caption ps-banner__description" id="layer02" data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']" data-type="text" data-responsive_offset="on" data-textalign="['center','center','center','center']" data-frames="[{&quot;from&quot;:&quot;z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;&quot;,&quot;speed&quot;:1500,&quot;to&quot;:&quot;o:1;&quot;,&quot;delay&quot;:1500,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1000,&quot;to&quot;:&quot;x:left(R);&quot;,&quot;ease&quot;:&quot;Power3.easeIn&quot;}]">
                                    Carrot cake macaroon topping jelly-o dessert cake. Tiramisu gummies wafer brownie tiramisu cake.
							<br />
                                    Icing powder candy canes cotton candy pie liquorice.
                                </div>
                                <a class="tp-caption ps-btn ps-btn--lg" href="#" id="layer03" data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']" data-voffset="['80','70','70','70']" data-type="text" data-responsive_offset="on" data-textalign="['center','center','center','center']" data-frames="[{&quot;from&quot;:&quot;z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;&quot;,&quot;speed&quot;:1500,&quot;to&quot;:&quot;o:1;&quot;,&quot;delay&quot;:1500,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1000,&quot;to&quot;:&quot;x:left(R);&quot;,&quot;ease&quot;:&quot;Power3.easeIn&quot;}]">TRY OUR CUPCAKES <i class="fa fa-angle-right"></i></a>
                            </li>
                            <li data-index="rs-2973" data-transition="slidingoverlayhorizontal" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="default" data-thumb="../../assets/images/concept4-100x100.jpg" data-rotate="0" data-saveperformance="off" data-title="Web Show" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
                                <img class="rev-slidebg" src="images/banner/img-slider-2.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" data-no-retina="" />
                                <div class="tp-caption ps-banner__caption" id="layer04" data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']" data-voffset="['-100','-80','-120','-120']" data-width="['none','none','none','400']" data-whitespace="['nowrap','nowrap','nowrap','normal']" data-type="text" data-responsive_offset="on" data-frames="[{&quot;from&quot;:&quot;z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;&quot;,&quot;speed&quot;:1500,&quot;to&quot;:&quot;o:1;&quot;,&quot;delay&quot;:1700,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1000,&quot;to&quot;:&quot;x:left(R);&quot;,&quot;ease&quot;:&quot;Power3.easeIn&quot;}]" style="z-index: 7; white-space: nowrap; text-transform: left;">A little bliss in every bite</div>
                                <div class="tp-caption ps-banner__description" id="layer05" data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']" data-voffset="['0','0','0','0']" data-type="text" data-responsive_offset="on" data-textalign="['center','center','center','center']" data-frames="[{&quot;from&quot;:&quot;z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;&quot;,&quot;speed&quot;:1500,&quot;to&quot;:&quot;o:1;&quot;,&quot;delay&quot;:1500,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1000,&quot;to&quot;:&quot;x:left(R);&quot;,&quot;ease&quot;:&quot;Power3.easeIn&quot;}]">Macaroon lollipop gummi bears liquorice sweet. Icing dessert sweet apple pie chocolate cake. Jujubes halvah cupcake cheesecake.</div>
                                <a class="tp-caption ps-btn ps-btn--lg" href="#" id="layer06" data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']" data-y="['middle','middle','middle','middle']" data-voffset="['80','70','70','70']" data-type="text" data-responsive_offset="on" data-textalign="['center','center','center','center']" data-frames="[{&quot;from&quot;:&quot;z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;&quot;,&quot;speed&quot;:1500,&quot;to&quot;:&quot;o:1;&quot;,&quot;delay&quot;:1500,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:1000,&quot;to&quot;:&quot;x:left(R);&quot;,&quot;ease&quot;:&quot;Power3.easeIn&quot;}]">ORDER NOW <i class="fa fa-angle-right"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <section class="ps-section ps-section--offer pt-40">
                <div class="container">
                    <div class="ps-section__header text-center mb-30">
                        <h4 class="ps-section__top">Making People Happy</h4>
                        <h3 class="ps-section__title ps-section__title--full">OFFER THIS WEEK</h3>
                    </div>
                    <div class="ps-shop-features">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 ">
                                <a href="#">
                                    <img class="mb-30" src="images/product-banner/012x.jpg" alt="" /></a>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
                                <a href="#">
                                    <img class="mb-30" src="images/product-banner/022x.jpg" alt="" /></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="ps-section ps-section--list-product pb-80 pt-20">
                <div class="container">
                    <div class="row">
                        <div class=" col-sm-12 col-xs-12 ">
                            <div class="ps-section__header">
                                <a href="index.aspx"><h3 class="ps-section__title ps-section__title--left ClassActive">All CAKE</h3>
                                <a href="index.aspx?typeid=20"><h3 class="ps-section__title ps-section__title--left">New CAKE</h3></a> 
                                 <a href="index.aspx?typeid=10"><h3 class="ps-section__title ps-section__title--left">HOT CAKE</h3>
                                <a href="index.aspx?typeid=30"><h3 class="ps-section__title ps-section__title--left">specialty </h3>
                            </div>
                            <div class="ps-section__content" id="ProductContent" runat="server" data-type="">
                                <asp:Repeater ID="rptProduct1" runat="server">
                                    <ItemTemplate>
                                        <div class="ps-product--list  Myps-product--list">
                                            <div class="ps-product__thumbnail">
                                                <div class="ps-badge"><span><%#Eval("Label") %></span></div>
                                                <%--  <div class="ps-badge  ps-badge--new"><span><%#Eval("NewPrice") %></span></div>--%>
                                                <a class="ps-product__overlay" href="product-detail.aspx?id=<%#Eval("Id") %>"></a>
                                                <img src="<%#Eval("ImgPath") %>" alt="">
                                            </div>
                                            <div class="ps-product__content">
                                                <h4 class="ps-product__title"><a href="product-detail.aspx?id=<%#Eval("Id") %>"><%#Eval("Name") %></a></h4>
                                                <p>Lollipop dessert donut marzipan cookie bonbon sesame snaps chocolate.</p>
                                                <p class="ps-product__price">
                                                    <del>£<%#Eval("OldPrice") %></del>£<%#Eval("NewPrice") %>
                                                </p>
                                                <a class="ps-btn ps-btn--xs" href="product-detail.aspx?id=<%#Eval("Id") %>">Order now<i class="fa fa-angle-right"></i></a>
                                                <span class="ps-btn ps-btn--xs addCart" data-pid="<%#Eval("Id") %>">Add to cart<i class="fa fa-angle-right"></i></span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <section class="ps-section ps-section--best-seller pt-40 pb-100">
                <div class="container">
                    <div class="ps-section__header text-center mb-50">
                        <h4 class="ps-section__top">Sweet Cupcakes</h4>
                        <h3 class="ps-section__title ps-section__title--full">BEST SELLER</h3>
                    </div>
                    <div class="ps-section__content">
                        <div class="owl-slider owl-slider--best-seller" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="30" data-owl-nav="true" data-owl-dots="false" data-owl-animate-in="" data-owl-animate-out="" data-owl-item="4" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4" data-owl-nav-left="&lt;i class=&quot;ps-icon--back&quot;&gt;&lt;/i&gt;" data-owl-nav-right="&lt;i class=&quot;ps-icon--next&quot;&gt;&lt;/i&gt;">
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
                                                <li><a class="addCart" data-tooltip="Add to cart" data-pid="<%#Eval("Id") %>"><i class="ps-icon--shopping-cart"></i></a></li>
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
            <div class="ps-section ps-section--home-testimonial pb-30 bg--parallax" data-background="images/parallax/img-bg-1.jpg">
                <div class="container">
                    <div class="owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="10000" data-owl-gap="0" data-owl-nav="false" data-owl-dots="true" data-owl-animate-in="" data-owl-animate-out="" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-nav-left="&lt;i class=&quot;fa fa-angle-left&quot;&gt;&lt;/i&gt;" data-owl-nav-right="&lt;i class=&quot;fa fa-angle-right&quot;&gt;&lt;/i&gt;">
                        <div class="ps-testimonial text-center pt-80 pb-100">
                            <div class="ps-testimonial__header">
                                <div class="ps-testimonial__thumbnail">
                                    <img src="images/testimonial/1.jpg" alt="">
                                </div>
                                <select class="ps-rating">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="5">5</option>
                                </select>
                                <p>Logan May - CEO & Founder Invision</p>
                            </div>
                            <div class="ps-testimonial__content">
                                <p>Dessert pudding dessert jelly beans cupcake sweet caramels gingerbread. Fruitcake biscuit cheesecake. Cookie topping sweet muffin pudding tart bear claw sugar plum croissant.</p>
                            </div>
                        </div>
                        <div class="ps-testimonial text-center pt-80 pb-100">
                            <div class="ps-testimonial__header">
                                <div class="ps-testimonial__thumbnail">
                                    <img src="images/testimonial/2.jpg" alt="">
                                </div>
                                <select class="ps-rating">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="5">5</option>
                                </select>
                                <p>Logan May - CEO & Founder Invision</p>
                            </div>
                            <div class="ps-testimonial__content">
                                <p>Dessert pudding dessert jelly beans cupcake sweet caramels gingerbread. Fruitcake biscuit cheesecake. Cookie topping sweet muffin pudding tart bear claw sugar plum croissant.</p>
                            </div>
                        </div>
                        <div class="ps-testimonial text-center pt-80 pb-100">
                            <div class="ps-testimonial__header">
                                <div class="ps-testimonial__thumbnail">
                                    <img src="images/testimonial/3.jpg" alt="">
                                </div>
                                <select class="ps-rating">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="5">5</option>
                                </select>
                                <p>Logan May - CEO & Founder Invision</p>
                            </div>
                            <div class="ps-testimonial__content">
                                <p>Dessert pudding dessert jelly beans cupcake sweet caramels gingerbread. Fruitcake biscuit cheesecake. Cookie topping sweet muffin pudding tart bear claw sugar plum croissant.</p>
                            </div>
                        </div>
                        <div class="ps-testimonial text-center pt-80 pb-100">
                            <div class="ps-testimonial__header">
                                <div class="ps-testimonial__thumbnail">
                                    <img src="images/testimonial/4.jpg" alt="">
                                </div>
                                <select class="ps-rating">
                                    <option value="1">1</option>
                                    <option value="1">2</option>
                                    <option value="1">3</option>
                                    <option value="1">4</option>
                                    <option value="5">5</option>
                                </select>
                                <p>Logan May - CEO & Founder Invision</p>
                            </div>
                            <div class="ps-testimonial__content">
                                <p>Dessert pudding dessert jelly beans cupcake sweet caramels gingerbread. Fruitcake biscuit cheesecake. Cookie topping sweet muffin pudding tart bear claw sugar plum croissant.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <section class="ps-section ps-section--news pt-100 pb-100">
                <div class="container">
                    <div class="ps-section__header text-center">
                        <h4 class="ps-section__top">Our Story</h4>
                        <h3 class="ps-section__title ps-section__title--full">BLOG & NEWS</h3>
                    </div>
                    <div class="ps-section__content">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                <div class="ps-new ps-new--large">
                                    <img src="images/new/new-large.jpg" alt="">
                                    <div class="ps-new__container">
                                        <header class="ps-new__header">
                                            <p>by<a href="#"> Athony</a> / February 12, 2017</p>
                                            <a class="ps-new__title" href="#">Sweet Bakery by
                                                <br>
                                                Joni William</a>
                                        </header>
                                        <div class="ps-new__content">
                                            <p data-number-line="2">
                                                Fond his say old meet cold find come
										<br>
                                                whom. The sir park sake bred.
                                            </p>
                                            <a class="ps-btn ps-btn--sm" href="#">Read more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">
                                <div class="ps-new">
                                    <img src="images/new/new-small-1.jpg" alt="">
                                    <div class="ps-new__container">
                                        <header class="ps-new__header">
                                            <p>by<a href="#"> Athony</a> / February 12, 2017</p>
                                            <a class="ps-new__title" href="#">Where I Learning Cook Cupcakes ?</a>
                                        </header>
                                        <div class="ps-new__content">
                                            <p data-number-line="2">No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympath</p>
                                            <a class="ps-btn ps-btn--sm" href="#">Read more</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="ps-new">
                                    <img src="images/new/new-small-2.jpg" alt="">
                                    <div class="ps-new__container">
                                        <header class="ps-new__header">
                                            <p>by<a href="#"> Athony</a> / February 12, 2017</p>
                                            <a class="ps-new__title" href="#">Where I Learning Cook Cupcakes ?</a>
                                        </header>
                                        <div class="ps-new__content">
                                            <p data-number-line="2">No comfort do written conduct at prevent manners on. Celebrated contrasted discretion him sympath</p>
                                            <a class="ps-btn ps-btn--sm" href="#">Read more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="ps-section ps-section--partner">
                <div class="container">
                </div>
            </div>
            <section class="ps-section ps-section--map">
                <div id="contact-map" data-address="浙江省绍兴市越城区建人路" data-title="BAKERY LOCATION!" data-zoom="16"></div>
                <div class="ps-delivery">
                    <div class="ps-delivery__header">
                        <h3>Contact Us</h3>
                        <p>Our Company is the best, meet the creative team that never sleeps. Say something to us we will answer to you.</p>
                    </div>
                    <div class="ps-delivery__content">
                    </div>
                </div>
            </section>
            <section class="ps-section ps-section--subscribe pt-80 pb-80">
                <div class="container">
                </div>
            </section>
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
                                        <img src="images/app.jpg" alt="" /></a>
                                      <p>Copyright &copy; 2017. By 25 余会明 else.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <div class="modal-popup mfp-with-anim mfp-hide" id="quickview-modal" tabindex="-1">
                <button class="modal-close"><i class="fa fa-remove"></i></button>
                <div class="ps-product-modal ps-product--detail clearfix">
                    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                        <div class="ps-product__thumbnail">
                            <div class="quickview--main" data-owl-auto="true" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="0" data-owl-nav="false" data-owl-dots="false" data-owl-animate-in="" data-owl-animate-out="" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-nav-left="&lt;i class=&quot;fa fa-angle-left&quot;&gt;&lt;/i&gt;" data-owl-nav-right="&lt;i class=&quot;fa fa-angle-right&quot;&gt;&lt;/i&gt;">
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
                            <div class="quickview--thumbnail" data-owl-auto="true" data-owl-loop="false" data-owl-speed="10000" data-owl-gap="20" data-owl-nav="false" data-owl-dots="false" data-owl-animate-in="" data-owl-animate-out="" data-owl-item="4" data-owl-item-xs="2" data-owl-item-sm="3" data-owl-item-md="4" data-owl-item-lg="4" data-owl-nav-left="&lt;i class=&quot;fa fa-angle-left&quot;&gt;&lt;/i&gt;" data-owl-nav-right="&lt;i class=&quot;fa fa-angle-right&quot;&gt;&lt;/i&gt;">
                                <img src="images/cake/img-cake-12.jpg" alt=""><img src="images/cake/img-cake-11.jpg" alt=""><img src="images/cake/img-cake-10.jpg" alt=""><img src="images/cake/img-cake-6.jpg" alt=""><img src="images/cake/img-cake-5.jpg" alt="">
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
                                <p><span>Availability: </span>In stock</p>
                                <p class="category"><span>CATEGORIES: </span><a href="#">Cupcake</a>,<a href="#">organic</a>,<a href="#"> sugar</a>,<a href="#"> sweet</a>,<a href="#"> bio</a></p>
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
                                    <button class="minus"><span>-</span></button>
                                    <input class="form-control" type="text" value="1"/>
                                    <button class="plus"><span>+</span></button>
                                </div>
                                <ul class="ps-product__action">
                                    <li><a href="#" data-tooltip="Add to wishlist"><i class="ps-icon--heart"></i></a></li>
                                    <li><a href="#" data-tooltip="Compare"><i class="ps-icon--reload"></i></a></li>
                                </ul>
                            </div>
                        </header>
                        <footer>
                            <a class="ps-btn--fullwidth ps-btn ps-btn--sm" href="#">Purchase<i class="fa fa-angle-right"></i></a>
                            <p class="ps-product__sharing">Share with:<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-google-plus"></i></a><a href="#"><i class="fa fa-twitter"></i></a></p>
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
    <script>
        $(function () {
            $("#LoadCart").load("cart.aspx" + " #LoadC");
            $(".addCart").css("cursor", "pointer").click(function (e) {
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 1,
                    work: "+",
                }, function (data) {
                    if (data != "error")
                    {
                        $(".ps-cart__toggle span i").text(data);
                        $("#LoadCart").load("cart.aspx" + " #LoadC");
                 message("success", "加入购物车成功！", 2000,e);                      
                    }                  
                })

            });
            $("#aOut").click(function () {
                $.get("Handlers/Loginout.ashx", {work:"logout"}, function (data) {
                    if (data == "ok") {
                        $("#Use").load("index.aspx" + " #useload");
                    }
                })
            })
            
        })
    </script>

</body>
</html>
