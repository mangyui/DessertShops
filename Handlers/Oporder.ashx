<%@ WebHandler Language="C#" Class="Oporder" %>

using System;
using System.Web;
using System.Web.SessionState;

public class Oporder : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string type = context.Request.Form["type"];         //充值还是付款操作
            Customer cu = (Customer)context.Session["Customer"];
            if (cu == null)
                context.Response.Write("errorcustomer");
            else
            {
                int orderid = Convert.ToInt32(context.Request.Form["orderid"]);               
                if (type == "shouhuo")                  //收货
                {

                    if (DBHelper.updateOrder("待收货","待评价",orderid))
                        context.Response.Write("ok");
                    else
                        context.Response.Write("error");
                }
                else if (type == "pingjia")                //评价（交易完成）
                {
                    if (DBHelper.updateOrder("待评价","交易完成",orderid))
                        context.Response.Write("ok");
                    else
                        context.Response.Write("error");
                } 
                else if (type == "delete")                //取消订单
                {
                    if (DBHelper.deleteOrder(orderid))
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

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}