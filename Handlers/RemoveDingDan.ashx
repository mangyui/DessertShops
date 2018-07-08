<%@ WebHandler Language="C#" Class="RemoveDingDan" %>

using System;
using System.Web;
using System.Web.SessionState;

public class RemoveDingDan : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            //获取request中的
            string id = context.Request.Form["did"];
            Customer cus = (Customer)context.Session["Customer"];
            if (cus != null)
            {
                OrderFactory.RemoveDingDan(cus,id);
               context.Response.Write("ok");               
            }
            
            else context.Response.Write("error");
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