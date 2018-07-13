<%@ WebHandler Language="C#" Class="PlaceOrder" %>

using System;
using System.Web;
using System.Web.SessionState;

public class PlaceOrder : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string type = context.Request.Form["type"]; 
        Customer customer = (Customer)context.Session["Customer"];
        if (customer != null)
        {
            ShoppingCart cart = (ShoppingCart)context.Session["ShoppingCart"];
            if (cart == null)
                context.Response.Write("errorcart");
            else
            {
                int toid=DBHelper.createOrder(customer.UserId, cart);
                if ( toid>= 0)
                {
                    context.Session["ShoppingCart"] = null;
                    context.Response.Write(toid);
                }
                else
                {
                     context.Response.Write("error");
                }
            }
        }
        else
        {
            context.Response.Write("errorcustomer");
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}