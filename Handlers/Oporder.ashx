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
                if (type == "shouhuo")                  //收货
                {
                    int orderid = Convert.ToInt32(context.Request.Form["orderid"]);
                    if (DBHelper.ShouHuo(orderid))
                        context.Response.Write("ok");
                    else
                        context.Response.Write("error");
                }
                else if (type == "pingjia")                //评价（交易完成）
                {
                    int orderid = Convert.ToInt32(context.Request.Form["orderid"]);
                    if (DBHelper.PingJia(orderid))
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