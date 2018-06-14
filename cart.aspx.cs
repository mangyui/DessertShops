using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer cus = (Customer)Session["Customer"];
        if (cus != null)
        {
            aName.InnerText = cus.UserName;
            aName.HRef = "user.aspx";
            aOut.InnerText = "Logout";
            aOut.HRef = "";
        }
        else
        {
            aName.InnerText = "用户";
            aName.HRef = "#";
            aOut.InnerText = "请登入";
            aOut.HRef = "login.html";
        }

        ShoppingCart Slist=(ShoppingCart)Session["ShoppingCart"];
        if (Slist==null)
            Slist=new ShoppingCart();

        ICollection Clist= Slist.CartItems;

        rptCart.DataSource = Clist;
        rptCart.DataBind();

        rptMinCart.DataSource = Clist;
        rptMinCart.DataBind();

        CCNum.InnerText = Slist.TotalQuantity.ToString();
        MinNum.InnerText = Slist.TotalQuantity.ToString();
        MinTotal.InnerText = "£" + Slist.TotalSum.ToString();

    }
}