using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cart2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShoppingCart Slist = (ShoppingCart)Session["ShoppingCart"];
        if (Slist == null)
            Slist = new ShoppingCart();

        rptCart.DataSource = Slist.CartItems;
        rptCart.DataBind();
    }
}