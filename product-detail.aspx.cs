using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class product_detail2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        PPHot.InnerHtml = prodect.NewPrice.ToString();
        PId.InnerText = prodect.Id.ToString();
    }
}