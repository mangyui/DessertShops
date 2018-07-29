<%@ WebHandler Language="C#" Class="addCollection" %>

using System;
using System.Web;
using System.Web.SessionState;

public class addCollection : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            int id = Convert.ToInt32(context.Request.Form["collid"]);
            string type = context.Request.Form["type"];
            Customer cus = (Customer)context.Session["Customer"];
            if (type == "add")
            {
                Product product = ProductFactory.GetProductById(id);
                int reault = DBHelper.AddCollcection(cus, product);
                if (reault == 1)
                    context.Response.Write("ok");
                else if (reault == -1)
                    context.Response.Write("errora");
                else
                    context.Response.Write("errorb");
            }
            else if(type=="remove")
            {
                if(DBHelper.deleteCollection(id,cus))
                  context.Response.Write("ok");
                else
                    context.Response.Write("error");    
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