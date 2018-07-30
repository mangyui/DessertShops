using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
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
            aName.HRef = "user.aspx";
            aOut.InnerText = "请登入";
            aOut.HRef = "login.html";
        }

        ShoppingCart Slist = (ShoppingCart)Session["ShoppingCart"];
        if (Slist == null)
            Slist = new ShoppingCart();


        rptMinCart.DataSource = Slist.CartItems;
        rptMinCart.DataBind();

        CCNum.InnerText = Slist.TotalQuantity.ToString();
        MinNum.InnerText = Slist.TotalQuantity.ToString();
        MinTotal.InnerText = "$" + Slist.TotalSum.ToString();
    }
}
