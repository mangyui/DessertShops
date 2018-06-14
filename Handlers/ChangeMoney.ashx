<%@ WebHandler Language="C#" Class="ChangeMoney" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ChangeMoney : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            //获取request中的

            string type = context.Request["type"];         //添加还是删除操作（还可能赋值）
             Customer cu = (Customer)context.Session["Customer"];  
            if (cu == null)
                context.Response.Write("errorcustomer");
            else
            {
                Customer cus;
                if (type == "+")
                {
                    decimal mon = Convert.ToDecimal(context.Request["addmoney"]);
                     cus= CustomerFactory.Recharge(cu.TelNo, mon);
                    context.Session["Customer"] = cus;
                    context.Response.Write("ok"); 
                }
                else
                {
                    ShoppingCart Slist = (ShoppingCart)context.Session["ShoppingCart"];
                    if (Slist == null)
                        context.Response.Write("errorcart");
                    else
                    {
                        if (cu.Balance < Slist.TotalSum)
                            context.Response.Write("errormoney");
                        else
                        {
                            cus = CustomerFactory.CustomerPay(cu.TelNo, Slist.TotalSum);
                            DingDanFactory.AddDingDan(Slist,cus);
                            context.Session["Customer"] = cus;
                            context.Session["ShoppingCart"] = null;
                            context.Response.Write("ok");
                        }                
                    }
                }
 
            }
        }
        catch (Exception)
        {
            context.Response.Write("error");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}