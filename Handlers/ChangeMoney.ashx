<%@ WebHandler Language="C#" Class="ChangeMoney" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ChangeMoney : IHttpHandler, IRequiresSessionState
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
                string pwd = context.Request.Form["pwd"];
                if (pwd != cu.UserPwd)
                    context.Response.Write("errorpwd");
                else
                {
                    if (type == "+")            //充值
                    {
                        decimal mon = Convert.ToDecimal(context.Request["addmoney"]);
                        if (DBHelper.ChongZhi(cu.UserId, mon))
                        {
                            cu.Balance += mon;
                            context.Response.Write("ok");
                        }
                        else
                            context.Response.Write("error");
                    }
                    else if (type == "-")                      //付款
                    {
                        int orderid = Convert.ToInt32(context.Request.Form["orderid"]);
                        decimal sum = Convert.ToDecimal(context.Request.Form["price"]);
                        if (cu.Balance >= sum)
                        {
                            if (DBHelper.PayOrder(cu.UserId, orderid))
                            {
                                cu.Balance -= sum;
                                context.Response.Write("ok");
                            }
                            else
                                context.Response.Write("error");
                        }
                        else
                            context.Response.Write("errormoney");
                    }
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