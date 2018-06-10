using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer cus = (Customer)Session["Customer"];
        if (cus != null)
        {
            aName.InnerText = cus.UserName;
            aName.HRef = "user.html";
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

        List<Product> list3 = ProductFactory.GetProductsList2();


        rptProduct3.DataSource = list3;
        rptProduct3.DataBind();

        string id = Request.QueryString["id"];
        if (string.IsNullOrEmpty(id))
        {
            Response.Redirect("index.aspx");
        }

        Product prodect = ProductFactory.GetProductById(int.Parse(id));
        PPImg.Src = prodect.ImgPathLarge;
        PPName.InnerText = prodect.Name;
        PPOldprice.InnerText = "£" + prodect.OldPrice.ToString();
        litNewprice.Text = prodect.NewPrice.ToString();
        PPHot.InnerHtml= prodect.NewPrice.ToString();

        List<Product> list = new List<Product>();
        list.Add(prodect);
        rptaddCart.DataSource = list;
        rptaddCart.DataBind();

    }
}