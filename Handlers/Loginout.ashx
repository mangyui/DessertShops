<%@ WebHandler Language="C#" Class="Loginout" %>

using System;
using System.Web;
using System.Web.SessionState;

public class Loginout : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        Customer cus=(Customer)context.Session["Customer"];
        if (cus != null)
        {  
            string type = context.Request["work"];
            if (type == "logout")
            {
                context.Session["Customer"] = null;
                context.Response.Write("ok");
            }
            else if (type == "update")
            {
                string oldpwd = context.Request["oldPwd"];
                if (oldpwd == cus.UserPwd)
                {
                    Customer c = new Customer();
                    string newpwd=context.Request["newPwd"];
                    if (newpwd != "")
                        c.UserPwd = newpwd;
                    else
                        c.UserPwd = oldpwd; 
                    c.UserName = context.Request["UserName"];           
                    c.TelNo = context.Request["TelNo"];
                    c.Age = Convert.ToInt32(context.Request["Age"]);
                    c.Address = context.Request["Address"];
                    if (DBHelper.UpdateCustomer(cus.UserId, c))
                    {
                        Customer newCus = DBHelper.GetCustomer(cus.UserId);
                        context.Session["Customer"] = newCus; 
                        context.Response.Write("ok");
                    }
                    else
                        context.Response.Write("error");                     
                }
                else
                    context.Response.Write("errorpwd");   
            }
        }
        else context.Response.Write("errorcustomer");                
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}