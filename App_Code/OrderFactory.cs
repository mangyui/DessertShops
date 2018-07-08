using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// DingDanFactory 的摘要说明
/// </summary>
public class OrderFactory
{
    private static List<Order> dingdanList=new List<Order>();
    private static int id = 0;
    public static void AddDingDan(ShoppingCart cart,Customer cus)
    {
        id++;
        int Id = int.Parse("1008600" + id);
        DateTime DT = DateTime.Now;
        Order Did = new Order(Id, DT, cart.TotalQuantity, cart.TotalSum, "完成", cus.UserId);
        dingdanList.Add(Did);
    }
    public static List<Order> GetDDlist(Customer cus)
    {
        //List<Order> ddlist = new List<Order>();
        //for (int i = 0; i < dingdanList.Count; i++)
        //{
        //    if (dingdanList[i].Userid == cus.UserId )
        //    {
        //        ddlist.Add(dingdanList[i]);
        //    }
        //}
        //return ddlist;
        return DBHelper.GetOriderList(cus.UserId);
    }
    public static void RemoveDingDan(Customer cus, string did)
    {
        for (int i = 0; i < dingdanList.Count; i++)
        {
            if (dingdanList[i].Userid==cus.UserId&&dingdanList[i].Id == int.Parse(did))
            {
                dingdanList.RemoveAt(i);
                return;
            }
        }
            ;
    }
}