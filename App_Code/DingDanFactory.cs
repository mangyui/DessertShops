using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// DingDanFactory 的摘要说明
/// </summary>
public class DingDanFactory
{
    private static List<DingDan> dingdanList=new List<DingDan>();
    private static int id = 0;
    public static void AddDingDan(ShoppingCart cart,Customer cus)
    {
        id++;
        string Id = "1008600" + id;
        DateTime DT = DateTime.Now;
        DingDan Did = new DingDan(Id, DT, cart.TotalQuantity, cart.TotalSum, "完成", cus.UserId);
        dingdanList.Add(Did);
    }
    public static List<DingDan> GetDDlist(Customer cus)
    {
        List<DingDan> ddlist = new List<DingDan>();
        for (int i = 0; i < dingdanList.Count; i++)
        {
            if (dingdanList[i].Userid == cus.UserId )
            {
                ddlist.Add(dingdanList[i]);
            }
        }
        return ddlist;
    }
    public static void RemoveDingDan(Customer cus, string did)
    {
        for (int i = 0; i < dingdanList.Count; i++)
        {
            if (dingdanList[i].Userid==cus.UserId&&dingdanList[i].Id == did)
            {
                dingdanList.RemoveAt(i);
                return;
            }
        }
            ;
    }
}