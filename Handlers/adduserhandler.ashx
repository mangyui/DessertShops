<%@ WebHandler Language="C#" Class="adduserhandler" %>

using System;
using System.Web;

public class adduserhandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            Customer c = new Customer();
            c.UserName = context.Request["UserName"];
            //alert(UserName);
            c.UserPwd = context.Request["UserPwd"];
            //c.ReUserPwd = context.Request["ReUserPwd"];
            c.Sex = context.Request["Sex"];
            c.TelNo = context.Request["TelNo"];
            c.Age = Convert.ToInt32(context.Request["Birthday"]);
            c.Address = context.Request["Address"];

            if (DBHelper.AddCustomer(c) != 0)
            {
                context.Response.Write("error");
            }
            else
            {
                context.Response.Write("ok");
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