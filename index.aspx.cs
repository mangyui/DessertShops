using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string typeid = Request.QueryString["typeId"];
        List<Product> list1;
        if (string.IsNullOrEmpty(typeid))
        {
            list1 = ProductFactory.GetProductsList();
        }
        else
        {
            list1 = ProductFactory.GetProductByTypeId(typeid);
        }

        List<Product> list3 = ProductFactory.GetProductsList2();

        rptProduct1.DataSource = list1;
        rptProduct1.DataBind();

        rptProduct3.DataSource = list3;
        rptProduct3.DataBind();
    }
}