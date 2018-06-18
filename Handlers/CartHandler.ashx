<%@ WebHandler Language="C#" Class="CartHandler" %>

using System;
using System.Web;
using System.Web.SessionState;

public class CartHandler : IHttpHandler ,IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) 
    {

        context.Response.ContentType = "text/plain";
        try
        {
            //获取request中的id，quantity
            int id = Convert.ToInt32(context.Request.Form["id"]);
            int quantity = Convert.ToInt32(context.Request.Form["quantity"]);
            string work = context.Request["work"];         //添加还是删除操作（还可能赋值）

            ShoppingCart cart = (ShoppingCart)context.Session["ShoppingCart"];
            if (cart == null)
                cart = new ShoppingCart();

            if (work == "+")
            {
                Product product = ProductFactory.GetProductById(id);
                CartItem cartitem = new CartItem(id, product.Name, product.NewPrice, quantity, product.ImgPath);
                cart.AddItem(cartitem);
            }
            else
            {
                if (quantity==0)
                    cart.RemoveItem(id);
                else
                    cart.RemoveItem(id, quantity);
            }
            context.Session["ShoppingCart"] = cart;

            context.Response.Write(cart.TotalQuantity);
        }
        catch (Exception)
        {
            context.Response.Write("error");
        }
       
        //context.Response.Write("Hello World");
    }
 
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}