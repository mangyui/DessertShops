<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <title>User</title>
        <link rel="stylesheet" href="css/codingcss.css"/>
        <script>
        $(function () {
            $("#aOut").click(function () {
                $.get("Handlers/Loginout.ashx", { work: "logout" }, function (data) {
                    if (data == "ok") {
                        $("#Use").load("user.aspx" + " #useload");
                    }
                })
            })
            $("#zhuye").click(function () {
                $(".cuk-tab-bar").removeClass("cuk-tab-bar-active");
                $("#zhuye").addClass("cuk-tab-bar-active");
                //$("#Panes").load("user.aspx" + " #dingdan");
                $("#Recharge").hide();
                $("#dingdan").show();
                return false;
            })
            $("#Recharge").hide();
            $("#chonghzi,#geren").click(function () {
                $(".cuk-tab-bar").removeClass("cuk-tab-bar-active");
                $("#geren").addClass("cuk-tab-bar-active");
                $("#dingdan").hide();
                $("#Recharge").show();

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
                            message("error", "未知错误！", 2000, e);
                    })
                }
            })
            $(".dingdanremove").click(function (e) {
                var did = $(this).data("did");
                var $th = $(this).parent();
                $.post("Handlers/RemoveDingDan.ashx", {did:did},function(data){
                    if (data == "ok") {
                        message("success", "成功删除该订单", 2000,e);
                        $th.fadeOut(1000, function () {
                            $th.remove();
                        })
                    }
                })
            })
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
            <div class="cuk-layout" >
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
                                <span class="count-3gW"><%#Eval("Balance") %>$</span>
                            </div>
                            <ul class="section-2ZI activity-info-BDI">
                                <li>联系方式：<%#Eval("TelNo") %></li>
                                <li>联系地址：<%#Eval("City")+" "+Eval("Province")+" "+Eval("Address") %></li>
                                <li class="clearfix"><span class="td-3ia">用户名：</span><%#Eval("UserName") %></li>
                                <li>性别：<%#Eval("Sex") %></li>
                            </ul>
                            <ul class="section-2ZI follow-info-5YF">
                                <a id="chonghzi" class="ps-btn ps-btn--xs" href="#">前往充值<i class="fa fa-angle-right"></i></a>
                            </ul>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <aside class="cuk-layout-content">
                        <div>
                            <div class="cuk-tab">
                                <div class="cuk-tab-bar-nav">
                                    <a href="#" id="zhuye" class="cuk-tab-bar  cuk-tab-bar-active">主页</a>
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
                                                <a class="DId">订单编号：<%#Eval("Id") %></a><br/>
                                                <span>下单时间：<%#Eval("InDate") %></span>
                                                <span>商品数量：<%#Eval("Num") %></span>
                                                <span>总价：<%#Eval("Price") %>$</span>
                                                 <span>订单状态：<%#Eval("State") %></span>
                                            </li>
                                                    <span class="dingdanremove" title="删除该订单" data-did="<%#Eval("Id") %>"></span>
                                                    </div>
                                          </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div>
                                    <div id="Recharge" class="cuk-tab-pane">
                                        <h3 id="RCh3" class="">*当前仅为模拟充值</h3>
                                        <a class="num">10</a>
                                        <a class="num">20</a>
                                        <a class="num">30</a>
                                        <a class="num">50</a>
                                        <a class="num">100</a><br />
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

