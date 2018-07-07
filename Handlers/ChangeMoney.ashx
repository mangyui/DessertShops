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
                     cus= CustomerFactory.Recharge(cu.TelNo, mon);
                    context.Session["Customer"] = cus;
                    context.Response.Write("ok"); 
                }
                else                      //下单付款
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
                            DingDanFactory.AddDingDan(Slist,cus);       //生成订单
                            context.Session["Customer"] = cus;        
                            context.Session["ShoppingCart"] = null;      //清空购物车  
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