<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Home</title>
     <script>
        $(function () {
            $(".header").removeClass("header--2");
            //$("#LoadCart").load("index.aspx" + " #LoadC");
            $(".addCart").css("cursor", "pointer").click(function (e) {
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 1,
                    work: "+",
                }, function (data) {
                    if (data != "error")
                    {
                        $(".ps-cart__toggle span i").text(data);
                        $("#LoadCart").load("index.aspx" + " #LoadC");
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
            //$(".ps-section__title--left").click(function () {
                
            //    $("#ProductContent").data("type",$(this).data("type"));
            //    alert($(this).data("type"));
            //    alert($("#ProductContent").data("type"));
            //    $("#PC").load("index.aspx" + " #PCLoad");
            //})
            
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="page-wrap">
            <!--主题轮播图开始-->
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
            <!--主题轮播图结束-->

            <!--产品列表开始-->
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
                                <a href="index.aspx"><h3 class="ps-section__title ps-section__title--left ClassActive" data-type="">All CAKE</h3></a> 
                                <a href="index.aspx?typeid=20"><h3 class="ps-section__title ps-section__title--left" data-type="20">New CAKE</h3></a> 
                                <a href="index.aspx?typeid=10"><h3 class="ps-section__title ps-section__title--left" data-type="10">HOT CAKE</h3></a> 
                                <a href="index.aspx?typeid=30"><h3 class="ps-section__title ps-section__title--left" data-type="30">specialty </h3></a> 
                                <span id="ProductContent" data-type="10" runat="server" ></span>
                            </div>
                            <div class="ps-section__content"  id="PC" >
                                <div id="PCLoad">
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
                            </div></div>
                        </div>

                    </div>
                </div>
            </section>
            <!--产品列表结束-->

            <!--滑动产品开始-->
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
            <!--滑动产品结束-->

            <!--人员介绍开始-->
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
             <!--人员介绍结束-->

            <!--讲述经历开始-->
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
             <!--讲述结束开始-->
 </div>
</asp:Content>

