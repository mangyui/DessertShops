<%@ WebHandler Language="C#" Class="ChangeMoney" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ChangeMoney : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {       
            string type = context.Request.Form["type"];         //充值还是付款操作
             Customer cu = (Customer)context.Session["Customer"];  
            if (cu == null)
                context.Response.Write("errorcustomer");
            else
            {
                Customer cus;
                if (type == "+")            //充值
                {
                    decimal mon = Convert.ToDecimal(context.Request["addmoney"]);
                    // cus= CustomerFactory.Recharge(cu.TelNo, mon);
                    //context.Session["Customer"] = cus;
                    //context.Response.Write("ok"); 
                }
                else                      //下单付款
                {
                   int orderid = Convert.ToInt32(context.Request.Form["orderid"]);
                   if(DBHelper.PayOrder(cu.UserId, orderid))
                    context.Response.Write("ok"); 
                   else
                    context.Response.Write("error");                        
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