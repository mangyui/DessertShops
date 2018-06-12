using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer cus = (Customer)Session["Customer"]; 
        List<Customer> c=new List<Customer>();
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
        c.Add(cus);
        rptUser.DataSource = c;
        rptUser.DataBind();
    }
}