using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer cus = (Customer)Session["Admin"];
        if (cus != null)
        {
            SpanAd.InnerText = cus.UserName;
            SpanLg.InnerText = "欢迎登录！";
            SpanAd.HRef = "";
           aLogin.InnerText = "登出";
        }
        else
        {
            SpanAd.InnerText = "请登录";
            SpanLg.InnerText = "未登录！";
            SpanAd.HRef = "/login.html";
            aLogin.InnerText = "登录";        
        }
    }
}
