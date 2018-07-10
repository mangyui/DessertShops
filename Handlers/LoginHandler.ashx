<%@ WebHandler Language="C#" Class="LoginHandler" %>

using System;
using System.Web;
using System.Web.SessionState;

public class LoginHandler : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string tel = context.Request.Form["tel"];
        string pwd = context.Request.Form["pwd"];
        string type = context.Request.Form["type"];
        string checkcode = context.Request.Form["checkcode"];
        if (checkcode.ToUpper() != context.Session["checkcode"].ToString())
        {
            context.Response.Write("errorcode");
        }
        else
        {
            if (type == "admin")
            {
                if (CustomerFactory.HasAdminByTelNo(tel) == false)
                {
                    context.Response.Write("userIdError");
                }
                else
                {
                    Customer Cus = CustomerFactory.GetAdminByTelNo(tel, pwd);
                    if (Cus != null)
                    {
                        context.Session["Admin"] = Cus;
                        context.Response.Write("ToAdmin");
                    }

                    else
                        context.Response.Write("userPwdError");
                }
            }
            else
            {
                if (CustomerFactory.HasCustomerByTelNo(tel) == false)
                {
                    context.Response.Write("userIdError");
                }
                else
                {
                    Customer Cus = CustomerFactory.GetCustomerByTelNo(tel, pwd);
                    if (Cus != null)
                    {
                        context.Session["Customer"] = Cus;
                        context.Response.Write("ToCustomer");
                    }

                    else
                        context.Response.Write("userPwdError");
                }

            }
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