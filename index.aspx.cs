using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Product> list1 = ProductFactory.GetProductsList();
        List<Product> list3 = ProductFactory.GetProductsList2();

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

        rptProduct1.DataSource = list1;
        rptProduct1.DataBind();


        rptProduct3.DataSource = list3;
        rptProduct3.DataBind();


    }
}