<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>Cart</title>
        <script>
        $(function () {
            mySum();
            $("#aOut").click(function () {
                $.get("Handlers/Loginout.ashx", { work: "logout" }, function (data) {
                    if (data == "ok") {
                        $("#Use").load("cart.aspx" + " #useload");
                    }
                })
            })
            $("table .form-group--number .minus").click(function () {   
                $minus = $(this);
                $.post("Handlers/CartHandler.ashx", {
                    id: $(this).data("pid"),
                    quantity: 1,
                    work: "-",                           //- 删除操作
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
                    work: "+",                        //+ 添加操作
                }, function (data) {
                    if (data != "error") {
                        $plus.prev().val($plus.prev().val() * 1 + 1);
                        mySum();
                        $("#LoadCart").load("cart.aspx" + " #LoadC");
                    }
                })
                return false;
            })
            $(".ps-cart-listing__remove").click(function (e) {
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
                        message("success", "删除该商品成功！", 2000,e);
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-wrap">
            <!--section-->
            <div class="ps-section--hero">
                <img src="images/hero/01.jpg" alt=""/>
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

        </div>
</asp:Content>

