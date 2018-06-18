using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer cus = (Customer)Session["Customer"];
        List<Customer> c = new List<Customer>();

        c.Add(cus);
        rptUser.DataSource = c;
        rptUser.DataBind();

        if (cus != null)
        {
            List<DingDan> DDlist = DingDanFactory.GetDDlist(cus);

            rptDingDan.DataSource = DDlist;
            rptDingDan.DataBind();
        }
    }
}