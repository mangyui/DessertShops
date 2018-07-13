<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product-detail.aspx.cs" Inherits="product_detail2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Product Detail</title>
     <script type="text/javascript" src="js/xq_bigimg.js"></script>
    <script>
        $(function () {
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
            $("#PaddCart").click(function (e) {
                $.post("Handlers/CartHandler.ashx", {
                    id: $("#ContentPlaceHolder1_PId").text(),
                    quantity: $(".form-group--number input.form-control").val(),
                    work: "+",
                }, function (data) {
                    if (data != "error") {
                        $(".ps-cart__toggle span i").text(data);
                        $("#LoadCart").load("product-detail.aspx" + " #LoadC");
                        message("success", "加入购物车成功！", 2000,e);
                    }
                })
                return false;
            })
            $(".addCart").css("cursor", "pointer").click(function (e) {
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 1,
                    work: "+",
                }, function (data) {
                    if (data != "error") {
                        $(".ps-cart__toggle span i").text(data);
                        $("#LoadCart").load("product-detail.aspx" + " #LoadC");
                        message("success", "加入购物车成功！", 2000,e);
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="page-wrap">
            <!-- Heros-->
            <div class="ps-section--hero">
                <img src="images/hero/02.jpg" alt=""/>
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
            <!--产品详情开始-->
            <div class="ps-section pt-80 pb-80">
                <div class="container">
                    <div class="ps-product--detail">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 ">
                                <div class="ps-product__image">
                                    <div class="ps-badge"><span id="PPHot" runat="server">$25.00</span></div>
                                    <div class="ps-badge ps-badge--new"><span id="PId" runat="server"></span></div>
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
                                        $<asp:Literal ID="litNewprice" Text="15.00" runat="server" />
                                        <del id="PPOldprice" runat="server">$25.00</del>
                                    </p>
                                    <a class="ps-product__quickview" href="#" data-effect="mfp-zoom-out">Saled：<i id="DetailSale" runat="server">0</i></a>
                                    <div class="ps-product__description">
                                        <p id="Pdesc" runat="server">
                                           
                                        </p><br/>
                                        <p>
                                            （附加信息）Toffee chocolate cake apple pie sugar plum sesame snaps muffin cake pudding cupcake. Muffin danish muffin lollipop
										biscuit jelly beans oat cake croissant.
                                        </p>
                                    </div>
                                    <div class="ps-product__meta">
                                        <p>
                                            <span>ToDate: </span><i id="iDate" runat="server">stock</i> 
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
                                                    <a class="ps-btn--fullwidth ps-btn" href="#" id="PaddCart">Purchase Now
											<i class="fa fa-angle-right"></i>
                                                    </a>

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
            <!--产品详情结束-->

            <!--滑动产品开始-->
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
                                            <p class="ps-product__price">$<%#Eval("NewPrice") %></p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </section>
            <!--滑动产品结束-->
</div>
</asp:Content>

