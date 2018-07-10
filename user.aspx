<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>User</title>
    <link rel="stylesheet" href="css/codingcss.css" />
    <link href="plugins/showBo/showBo.css" rel="stylesheet" />
    <script src="plugins/showBo/showBo.js"></script>
    <script>
        $(function () {
            $("#aOut").click(function () {
                $.get("Handlers/Loginout.ashx", { work: "logout" }, function (data) {
                    if (data == "ok") {
                        $("#Use").load("user.aspx" + " #useload");
                    }
                })
            })
            $(".cuk-tab-panes .cuk-tab-pane").hide();
            $(".cuk-tab-panes .cuk-tab-pane").eq(0).show();
            $(".cuk-tab-bar").click(function () {
                $(".cuk-tab-bar").removeClass("cuk-tab-bar-active");
                $(this).addClass("cuk-tab-bar-active");
                $(".cuk-tab-panes .cuk-tab-pane").hide();
                $(".cuk-tab-panes .cuk-tab-pane").eq($(this).index()).show();
                return false;
            })
            //$("#zhuye").click(function () {
            //    $(".cuk-tab-bar").removeClass("cuk-tab-bar-active");
            //    $("#zhuye").addClass("cuk-tab-bar-active");
            //    $("#Recharge").hide();
            //    $("#dingdan").show();
            //    return false;
            //})
            //$("#Recharge").hide();
            $.getUrlParam = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
            }
            function aa() {
                if ($.getUrlParam("id") != null)
                    $(".cuk-tab-bar").eq(1).click();
            }
            aa();
            $("#chonghzi").click(function () {
                $(".cuk-tab-bar").eq(2).click();
                return false;
            })
            $(".num").click(function () {
                $(".num").removeClass("num-active");
                $(this).addClass("num-active");

            })
            $("#CZ").click(function (e) {
                var num = $(".num-active").text();
                if (num == "")
                    message("error", "请先选择要充值的金额", 1000, e);
                else {
                    $.post("Handlers/ChangeMoney.ashx", { type: "+", addmoney: num }, function (data) {
                        if (data == "ok") {
                            message("success", "充值成功！", 2000, e);
                            $('#CZ').attr('disabled', 'disabled')
                            setTimeout(function () {
                                window.location.href = "user.aspx";
                            }, 2000);
                        }
                        else if (data == "errorcustomer")
                            message("error", "请先登录", 2000, e);
                        else
                            message("error", "充值失败！", 2000, e);
                    })
                }
            })
            $(".PayA").click(function (e) {
                var $th = $(this);
                var orderid = $(this).data("orderid");
                $.post("Handlers/ChangeMoney.ashx", { type: "-", orderid: orderid }, function (data) {
                    if (data == "ok") {
                        message("success", "付款成功！", 2000, e);
                        $th.attr('disabled', 'disabled');
                        setTimeout(function () {
                            window.location.href = "user.aspx";
                        }, 2000);
                    }
                    else if (data == "errorcustomer")
                        message("error", "请先登录", 2000, e);
                    else
                        message("error", "付款失败！", 2000, e);
                })
            })
            //$(".dingdanremove").click(function (e) {
            //    var did = $(this).data("did");
            //    var $th = $(this).parent();
            //    $.post("Handlers/RemoveDingDan.ashx", {did:did},function(data){
            //        if (data == "ok") {
            //            message("success", "成功删除该订单", 2000,e);
            //            $th.fadeOut(1000, function () {
            //                $th.remove();
            //            })
            //        }
            //    })
            //})
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
        <div class="cuk-layout">
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
                            <span class="count-3gW" id="Cmoney"><%#Eval("Balance") %></span>$
                        </div>
                        <ul class="section-2ZI activity-info-BDI">
                            <li>联系方式：<%#Eval("TelNo") %></li>
                            <li>联系地址：<%#Eval("City")+" "+Eval("Province")+" "+Eval("Address") %></li>
                            <li class="clearfix"><span class="td-3ia">年龄：</span><%#Eval("Age") %></li>
                            <li>性别：<%#Eval("Sex") %></li>
                        </ul>
                        <ul class="section-2ZI follow-info-5YF">
                            <a id="chonghzi" class="ps-btn ps-btn--xs" href="#" onclick="Showbo.Msg.topwd()">前往充值<i class="fa fa-angle-right"></i></a>
                        </ul>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <aside class="cuk-layout-content">
                    <div>
                        <div class="cuk-tab">
                            <div class="cuk-tab-bar-nav">
                                <a href="#" id="zhuye" class="cuk-tab-bar  cuk-tab-bar-active">主页</a>
                                <a href="#" id="order" class="cuk-tab-bar ">订单详情</a>
                                <a href="#" id="geren" class="cuk-tab-bar ">充值</a>
                                <a href="#" class="cuk-tab-bar">收藏</a>
                                <a href="#" class="cuk-tab-bar">其他</a>
                            </div>
                            <div id="Panes" class="cuk-tab-panes">
                                <div id="dingdan" class="cuk-tab-pane">
                                    <h3 class="activity-title-1mK">TA 的订单</h3>
                                    <ul>
                                        <asp:Repeater ID="rptDingDan" runat="server">
                                            <ItemTemplate>
                                                <div>
                                                    <li class="dingdanli">
                                                        <a class="DId">订单编号：16136235—<%#Eval("Id") %></a><br />
                                                        <table>
                                                            <tr>
                                                                <td><span>下单时间：<%#Eval("InDate") %></span></td>
                                                                <td><span>用户ID：<%#Eval("UserId") %></span></td>
                                                                <td><span>总价：<%#Eval("Price") %>$</span></td>
                                                                <td><span>订单状态：<%#Eval("State") %></span></td>
                                                            </tr>
                                                        </table>

                                                    </li>
                                                    <a class="ps-btn ps-btn--xs aorder PayA" data-orderid="<%#Eval("Id") %>">前往付款<i class="fa fa-angle-right"></i></a>
                                                    <a class="ps-btn ps-btn--xs aorder" href="user.aspx?id=<%#Eval("Id") %>">查看订单详情<i class="fa fa-angle-right"></i></a>

                                                    <%--<span class="dingdanremove" title="删除该订单" data-did="<%#Eval("Id") %>"></span>--%>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                                <div id="OrderM" class="cuk-tab-pane">

                                    <div class="" id="OrderContent">
                                        <div class="ps-cart__total TopbgRed">
                                            <p>订单号：16136235—<span id="SpanOId" runat="server">xx</span></p>
                                        </div>
                                        <div class="ps-cart__content">
                                            <asp:Repeater ID="rptOrderC" runat="server">
                                                <ItemTemplate>
                                                    <div class="ps-cart-item">
                                                        <a class="ps-cart-item__close" href="#"></a>
                                                        <div class="ps-cart-item__thumbnail">
                                                            <a href="product-detail.aspx"></a>
                                                            <img src="<%#Eval("Img") %>" alt="">
                                                        </div>
                                                        <div class="ps-cart-item__content">
                                                            <a class="ps-cart-item__title" href="product-detail.aspx?id=<%#Eval("Peoductid") %>"><%#Eval("Name") %></a>
                                                            <p>
                                                                <span>Quantity:<i><%#Eval("Num") %></i></span>
                                                                <span>Total:<i>£<%#Eval("Price") %></i></span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="ps-cart__total bgRed">
                                            <p>Item Total:<span id="OrderSum" runat="server">£00.00</span></p>
                                            <p>Order State:<span id="OrderState" runat="server">无</span></p>
                                        </div>
                                    </div>

                                </div>
                                <div id="Recharge" class="cuk-tab-pane">
                                    <h3 id="RCh3" class="">*当前仅为模拟充值</h3>
                                    <a class="num">10</a>
                                    <a class="num">50</a>
                                    <a class="num">100</a>
                                    <a class="num">500</a>
                                    <a class="num">1000</a><br />
                                    <a id="CZ" class="ps-btn ps-btn--xs">充值<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
        <!--用户中心结束-->
    </div>
</asp:Content>

