using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

[Serializable]
/// <summary>
/// ShoppingCart 的摘要说明
/// </summary>
public class ShoppingCart
{
    public Hashtable htCartItems = new Hashtable();
    //返回所有商品
    public ICollection CartItems
    {
        get { return htCartItems.Values; }
 
    }
    //计算并返回总价
    public decimal TotalSum
    {
        get 
        {
            decimal sum = 0;
            foreach(CartItem item in htCartItems.Values)
            {
                sum += item.Price * item.Quantity;
            }
            return sum;
        }
    }
    //计算并返回总数
    public int TotalQuantity
    {
        get
        {
            int num = 0;
            foreach (CartItem item in htCartItems.Values)
            {
                num += item.Quantity;
            }
            return num;
        }
    }
    //添加商品到购物车
    public void AddItem(string img,int id, string name, decimal price, int quantity)
    {
        CartItem item = (CartItem)htCartItems[id];
        if (item == null)
        {
            htCartItems.Add(id, new CartItem(id, name, price, quantity,img));
        }
        else
        {
            item.Quantity += quantity;
            htCartItems[id] = item;
        }
    }  
    public void AddItem(CartItem cartitem)
    {
        CartItem item = (CartItem)htCartItems[cartitem.Id];
        if (item == null)
        {
            htCartItems.Add(cartitem.Id, cartitem);
        }
        else
        {
            item.Quantity += cartitem.Quantity;
            htCartItems[cartitem.Id] = item;
        }
    }
    //购物车删除商品
    public void RemoveItem(int id,int quantity)
    {
        CartItem item = (CartItem)htCartItems[id];
        if (item == null)
            return;
        item.Quantity -= quantity;
        if (item.Quantity <= 0)
        {
            htCartItems.Remove(id);
        }
        else
        {
            htCartItems[id] = item;
        }
    }    
    public void RemoveItem(int id)
    {
        CartItem item = (CartItem)htCartItems[id];
        if (item != null) 
            htCartItems.Remove(id);  
    }
}