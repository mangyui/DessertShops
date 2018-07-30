using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Evaluate 的摘要说明
/// </summary>
public class Evaluate
{
     public int OrderId { get; set; }
    public int UserId { get; set; }
    public string UserName { get; set; }
    public int ProductId { get; set; }
    public string ProductName { get; set; }
    public string Eva{ get; set; }
    public int EvaType { get; set; }
    public string EvaImg { get; set; }
    public DateTime InDate { get; set; }
    public Evaluate(int orderid, int userid, string username, int productid, string productname,
        string eva, int evatype,string evaimg, DateTime inDate)
    {
        this.OrderId=orderid;
        this.UserId = userid;
        this.UserName = username;
        this.ProductId = productid;
        this.ProductName = productname;
        this.Eva = eva;
        this.EvaType = evatype;
        this.EvaImg = evaimg;
        this.InDate = inDate;
    }  
	public Evaluate()
	{
		
	}
}