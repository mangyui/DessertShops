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
        string id = Request.QueryString["id"];
        Customer cus = (Customer)Session["Customer"];
        List<Customer> c = new List<Customer>();
        if (string.IsNullOrEmpty(id) == false && cus != null)
        {
            List<OrderDetails> list = DBHelper.GetODList(id);
            rptOrderC.DataSource = list;
            rptOrderC.DataBind();

            rptiItemPing.DataSource = list;
            rptiItemPing.DataBind();

            Order order = DBHelper.GetOrder(int.Parse(id));
            SpanOId.InnerText = order.Id.ToString();
            OrderSum.InnerText = order.Price.ToString();
            OrderState.InnerText = order.State;
        }



        c.Add(cus);
        rptUser.DataSource = c;
        rptUser.DataBind();
        rptUpcus.DataSource = c;
        rptUpcus.DataBind();
        if (cus != null)     //若客户登录了，获取该客户已存在的订单
        {
            List<Order> DDlist = OrderFactory.GetDDlist(cus);

            rptDingDan.DataSource = DDlist;
            rptDingDan.DataBind();

            List<Product> collist = DBHelper.GetColltionList(cus.UserId);

            rptCollection.DataSource = collist;
            rptCollection.DataBind();
        }
    }
}