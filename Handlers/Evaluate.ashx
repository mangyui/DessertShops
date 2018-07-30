<%@ WebHandler Language="C#" Class="Evaluate" %>

using System;
using System.Web;
using System.Web.SessionState;

public class Evaluate : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            string orderid = context.Request.Form["orderid"];            
            string id = context.Request.Form["id"];
            string str = context.Request.Form["evaluate"];
            Customer cus = (Customer)context.Session["Customer"];
            Product pro = ProductFactory.GetProductById(int.Parse(id));
            if(DBHelper.AddEvaluate(cus, pro, orderid, str))
            context.Response.Write("ok");
            else
            context.Response.Write("error");                                
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