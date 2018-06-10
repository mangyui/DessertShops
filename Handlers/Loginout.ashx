<%@ WebHandler Language="C#" Class="Loginout" %>

using System;
using System.Web;
using System.Web.SessionState;

public class Loginout : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        string type = context.Request.QueryString["work"];

        if (type == "logout")
        {
            context.Session["Customer"] = null;
            context.Response.Write("ok");
        }
        else    context.Response.Write("error");                
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}