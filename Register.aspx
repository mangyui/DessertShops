<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <link href="favicon.png" rel="icon" />
    <title>用户注册</title>
    <!--必要样式-->
    <link href="plugins/ShowMessage/iview.css" rel="stylesheet" />
    <link href="css/loginstyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="plugins/jquery/dist/jquery.min.js"></script>
    <script src="plugins/ShowMessage/message.js"></script>
    <script>
        $(function () {
            $("#adduser").click(function (e) {
                var UserName = $("#UserName").val();
                //alert(UserName);
                var UserPwd = $("#UserPwd").val();
                var ReUserPwd = $("#ReUserPwd").val();
                var Sex = $("#Sex").val();
                var TelNo = $("#TelNo").val();
                var Birthday = $("#Birthday").val();
                var Address = $("#Address").val();
                if (UserPwd != ReUserPwd)
                     message("error", "您输入密码不一致!", 3000);
                else if (UserName == "" || ReUserPwd == "" || UserPwd == "" || Sex == "" || TelNo == "" || Birthday == "" || Address == "")
                    message("error", "不能为空！请填写完整。", 3000);
                else
                {
                var pdata = {UserName: UserName, UserPwd: UserPwd, ReUserPwd: ReUserPwd, Sex: Sex, TelNo: TelNo, Birthday: Birthday, Address: Address };
                //alert(pdata);
                $.post("Handlers/AddUserHandler.ashx", pdata, function (data) {
                    if (data =="ok") {
                        message("success", "注册成功！", 3000);
                        setTimeout(function () {
                        window.location.href = "login.html";
                        }, 2000)
                    }
                    else {
                        message("error", "注册失败！", 3000);
                    }
                });}
            });
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="zhuce">
            <a href="login.html" id="aBack">返回登录</a>
            <div class='login_title2'>
                <span>用户注册</span>
            </div>
            <div class="zcbg">          
                用户名称：<input type="text" id="UserName" name="UserName" />
                <br />
                用户密码：<input type="text" id="UserPwd" name="UserPwd" />
                <br />
                重复密码：<input type="text" id="ReUserPwd" name="ReUserPwd" />
                <br />
                用户性别：<select id="Sex" name="Sex">
                    <option>男</option>
                    <option>女</option>
                </select>
                <br />
                联系电话：<input type="text" id="TelNo" name="TelNo" />
                <br />
                用户年龄：<input type="number" id="Birthday" name="Birthday" />
                <br />
                联系地址：<input type="text" id="Address" name="Address" />
                <br />
                <div class='login_fields__submit zcsub'>
                    <input id="adduser" type="button" value="注册" />
                </div>
            </div>
        </div>
    </form>

</body>
</html>
