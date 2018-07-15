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
            $(".ps-cart-item_xin").click(function () {
                $(this).toggleClass("ps_xin_active");
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
                if ($.getUrlParam("id") != null) {
                    $(".cuk-tab-bar").eq(1).click();
                    $("#Aopde").data("orderid", $("#ContentPlaceHolder1_SpanOId").text()).data("odstate", $("#ContentPlaceHolder1_OrderState").text()).data("odprice", $("#ContentPlaceHolder1_OrderSum").text());
                    if ($("#ContentPlaceHolder1_OrderState").text() == "待付款") {
                        var $anew = $("<a class='ps-btn ps-btn--xs aorder' id='deleOrder' data-orderid='" + $("#ContentPlaceHolder1_SpanOId").text() + "' data-odstate='" + $("#ContentPlaceHolder1_OrderState").text() + "' data-odprice='" + $("#ContentPlaceHolder1_OrderSum").text() + "'>取消订单<i class='fa fa-angle-right'></i></a>")
                        $anew.insertAfter("#Aopde");
                    }
                }
            }
            aa();
            $("#deleOrder").click(function () {
                Showbo.Msg.todele($(this).data("orderid"), $(this).data("odprice"));
            })
            $("#UpdateCus").click(function () {
                $(".cuk-tab-bar").eq(4).click();
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
                    var name = $("#pName").text();
                    Showbo.Msg.tochong(name, num);
                }
            })
            $(".PayA").each(function () {
                if ($(this).data("odstate") == "待付款") {
                    var odid = $(this).data("orderid");
                    var odpr = $(this).data("odprice");
                    $(this).text("付款").css("background-image", "linear-gradient(90deg,#228fbd, #2570a1)").attr("onclick", "Showbo.Msg.topwd(" + odid + "," + odpr + ")");
                    //var $anew = $("<a class='ps-btn ps-btn--xs aorder deleOrder' data-orderid='" + odid + "' data-odstate='待付款' data-odprice='" + odpr + "'>取消订单<i class='fa fa-angle-right'></i></a>")
                    //$anew.insertAfter($(this));
                }
                else if ($(this).data("odstate") == "已付款") {
                    $(this).text("待发货").css("background-image", "linear-gradient(90deg,#202d40,#202d40)");
                }
                else if ($(this).data("odstate") == "待收货") {
                    var odid = $(this).data("orderid");
                    var odpr = $(this).data("odprice");
                    $(this).text("确认收货").css("background-image", "linear-gradient(90deg,#00a6ac, #008792)").attr("onclick", "Showbo.Msg.toshou(" + odid + "," + odpr + ")");
                }
                else if ($(this).data("odstate") == "待评价") {
                    var odid = $(this).data("orderid");
                    var odpr = $(this).data("odprice");
                    $(this).text("评价").css("background-image", "linear-gradient(90deg,#6f60aa, #585eaa)").attr("onclick", "Showbo.Msg.toping(" + odid + "," + odpr + ")");
                }
                else if ($(this).data("odstate") == "交易完成") {
                    $(this).text("交易完成").css("background-image", "linear-gradient(90deg,#007d65, #007d65)");
                }
            })
            $("#UpdateUser").click(function (e) {
                var UserName = $("#cusName").val();
                var newPwd = $("#newPwd").val();
                var oldPwd = $("#oldPwd").val();
                var TelNo = $("#TelNo").val();
                var Age = $("#Age").val();
                var Address = $("#Address").val();
                if(oldPwd == "")
                    message("error", "请输入密码", 3000);
                else if (UserName == ""|| TelNo == "" || Address == ""||Age=="")
                    message("error", "不能为空！请填写完整。", 3000);
                else {
                    var pdata = { work:"update", UserName: UserName, newPwd: newPwd, oldPwd: oldPwd,TelNo: TelNo, Age:Age, Address: Address };
                    //alert(pdata);
                    $.post("Handlers/Loginout.ashx", pdata, function (data) {
                        if (data == "ok") {
                            message("success", "修改成功！", 2000);
                            setTimeout(function () {
                                window.location.href = "user.aspx";
                            }, 1500)
                        }
                        else if (data == "errorcustomer")
                            message("error", "请先登录！", 3000, e);
                        else if(data == "errorpwd")
                           message("error", "密码错误！", 3000,e);
                        else {
                            message("error", "修改失败！", 3000);
                        }
                    });
                }
            })
            //var ke=function kkk() {
            //  var $th = $(this); alert("132");         
            //    var orderid = $(this).parents("#dvMsgBox").find("dvMsgCT").find("span").eq(1).text();

            //    $.post("Handlers/ChangeMoney.ashx", { type: "-", orderid: orderid }, function (data) {
            //        if (data == "ok") {
            //            message("success", "付款成功！", 2000, e);
            //            setTimeout(function () {
            //                window.location.href = "user.aspx";
            //            }, 2000);
            //        }
            //        else if (data == "errormoney")
            //            message("error", "余额不足", 2000, e);
            //        else if (data == "errorcustomer")
            //            message("error", "请先登录", 2000, e);
            //        else
            //            message("error", "付款失败！", 2000, e);
            //    })
            //}
            //$("#YesBtn").click(function(e){

            //})

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
            <img src="images/hero/03.jpg" alt="" />
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
                            <p id="pName" class="username-1y7"><%#Eval("UserName") %></p>
                            <p class="bio-_sm"></p>
                        </div>
                        <div class="section-2ZI follow-info-5YF">
                            <span class="count-3gW">账户余额</span>
                            <span class="divider-gPC">：</span>
                            <span class="count-3gW" id="Cmoney"><%#Eval("Balance") %></span>$
                        </div>
                        <ul class="section-2ZI activity-info-BDI">
                            <li>ID编号：<%#Eval("UserId") %></li>
                            <li id="oldsex">性别：<%#Eval("Sex") %></li>
                            <li class="clearfix"><span class="td-3ia">年龄：</span><%#Eval("Age") %></li>
                            <li>联系方式：<%#Eval("TelNo") %></li>
                            <li>联系地址：<%#Eval("Province")+" "+Eval("City")+" "+Eval("Address") %></li>
                        </ul>
                        <ul class="section-2ZI follow-info-5YF">
                            <a id="UpdateCus" class="ps-btn ps-btn--xs" href="#">修改个人信息<i class="fa fa-angle-right"></i></a>
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
                                <a href="#" id="geren" class="cuk-tab-bar ">修改资料</a>
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
                                                        <a href="user.aspx?id=<%#Eval("Id") %>" class="DId">订单编号：<%#Eval("Id") %></a><br />
                                                        <table>
                                                            <tr>
                                                                <td><span>下单时间：<%#Eval("InDate") %></span></td>
                                                                <td><span>用户ID：<%#Eval("UserId") %></span></td>
                                                                <td><span>总价：<i class="SpanOP"><%#Eval("Price") %></i> $</span></td>
                                                                <td><span>订单状态：<i style="font-size:15px;font-weight:bold"><%#Eval("State") %></i></span></td>
                                                            </tr>
                                                        </table>

                                                    </li>
                                                    <a class="ps-btn ps-btn--xs aorder PayA" data-orderid="<%#Eval("Id") %>" data-odstate="<%#Eval("State") %>" data-odprice="<%#Eval("Price") %>">无操作<i class="fa fa-angle-right"></i></a>
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
                                            <p>订单号：<span id="SpanOId" runat="server">请先在主页选择要查看的订单</span></p>
                                        </div>
                                        <div class="ps-cart__content">
                                            <asp:Repeater ID="rptOrderC" runat="server">
                                                <ItemTemplate>
                                                    <div class="ps-cart-item">
                                                        <a href="#" class="ps-cart-item_xin" title="love" data-tooltip="Add to wishlist">
                                                            <i class="ps-icon--heart"></i>
                                                        </a>
                                                        <div class="ps-cart-item__thumbnail">
                                                            <a href="product-detail.aspx"></a>
                                                            <img src="<%#Eval("Img") %>" alt="">
                                                        </div>
                                                        <div class="ps-cart-item__content">
                                                            <a class="ps-cart-item__title" href="product-detail.aspx?id=<%#Eval("Peoductid") %>"><%#Eval("Name") %></a>
                                                            <p>
                                                                <span>Quantity:<i><%#Eval("Num") %></i></span>
                                                                <span>Total:<i>$<%#Eval("Price") %></i></span>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <div class="ps-cart__total bgBlack">
                                            <p>Item Total:$<span id="OrderSum" runat="server">00.00</span></p>
                                            <p>Order State:<span id="OrderState" runat="server">无</span></p>
                                        </div>
                                    </div>
                                    <a class="ps-btn ps-btn--xs aorder PayA" id="Aopde" data-orderid="" data-odstate="" data-odprice="">无操作<i class="fa fa-angle-right"></i></a>
                                </div>
                                <div id="Recharge" class="cuk-tab-pane">
                                    <h3 id="RCh3" class="">*请先选择下列充值数值</h3>
                                    <a class="num">10</a>
                                    <a class="num">50</a>
                                    <a class="num">100</a>
                                    <a class="num">500</a>
                                    <a class="num">1000</a><br />
                                    <a id="CZ" class="ps-btn ps-btn--xs">充值<i class="fa fa-angle-right"></i></a>
                                </div>
                                <div class="cuk-tab-pane">
                                </div>
                                <div id="UpCus" class="cuk-tab-pane">                                   
                                      <asp:Repeater ID="rptUpcus" runat="server">
                                            <ItemTemplate>
                                                <div class="zcbg zhuce">                                    
                                        用户名称：<input type="text" id="cusName" name="cusName" value="<%#Eval("UserName") %>"/>
                                        <br />                                      
                                        用户年龄：<input type="text" id="Age" name="Age" value="<%#Eval("Age") %>"/>
                                        <br />
                                        联系电话：<input type="text" id="TelNo" name="TelNo" value="<%#Eval("TelNo") %>"/>
                                        <br />
                                        联系地址：<input type="text" id="Address" name="Address" value="<%#Eval("Address") %>"/>
                                        <br />
                                        修改密码：<input type="text" id="newPwd" name="newPwd"  placeholder="如需修改密码，则在此输入新密码"/>
                                        <br />
                                        输原密码：<input type="text" id="oldPwd" name="oldPwd" />
                                        <br />
                                     </div>  
                                      <div class='login_fields__submit zcsub'>
 <%--                                             <a id="UpdateCus" class="ps-btn ps-btn--xs" href="#">修改个人信息<i class="fa fa-angle-right"></i></a>--%>
                                            <input id="UpdateUser"  class="ps-btn ps-btn--xs"  type="button" value="修改" />
                                        </div>
                            </div>
                            </ItemTemplate>
                                        </asp:Repeater>
                        </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
        <!--用户中心结束-->
    </div>
</asp:Content>

