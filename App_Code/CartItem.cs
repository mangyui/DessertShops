using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[Serializable]
/// <summary>
/// CartItem 的摘要说明
/// </summary>
public class CartItem
{
    public string Img { get; set; } 
    public int Id { get; set;}
    public string Name { get; set; }
    public decimal Price { get; set; }
    public int Quantity { get; set; }
	public CartItem(int id,string name,decimal price,int quantity,string img)
	{
        this.Img = img;
        this.Id = id;
        this.Name = name;
        this.Price = price;
        this.Quantity = quantity;
	}
}