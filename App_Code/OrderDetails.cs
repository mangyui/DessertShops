using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// OrderDetails 的摘要说明
/// </summary>
public class OrderDetails
{
    public int OrderId { get; set; }
    public decimal Price { get; set; }
    public int Num { get; set; }
    public string Name { get; set; }
    public string Img { get; set; }
    public int Peoductid { get; set; }
	public OrderDetails()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
}