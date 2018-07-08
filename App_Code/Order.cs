using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// DingDan 的摘要说明
/// </summary>
public class Order
{
    public int Id { get; set; }
    public decimal Price { get; set; }
    public DateTime InDate { get; set; }
    public int Num { get; set; }
    public string State { get; set; }
    public string Userid { get; set; }

    public Order(int id, DateTime inDate,int num,decimal price,  string state,string uid)
    {
        this.Id = id; 
        this.InDate = inDate;
        this.Price = price;
        this.Num = num;
        this.State = state;
        this.Userid = uid;
    }
	public Order()
	{
		//
	}
}