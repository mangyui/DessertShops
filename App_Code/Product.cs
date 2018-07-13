using System;
using System.Collections.Generic;

/// <summary>
///Product——产品类
/// </summary>
public class Product
{
    public int Id { get; set; }
    public int TypeId { get; set; }
    public string Name { get; set; }
    public decimal OldPrice { get; set; }
    public decimal NewPrice { get; set; }
    public string DeSCC{ get; set; }
    public string ImgPath { get; set; }
    public string ImgPathLarge { get; set; }
    public DateTime InDate { get; set; }
    public string Label{ get; set; }
    public int Sale{ get; set; }    
    public Product(int id,int typeid, string name, decimal oldprice, decimal newprice,
        string imgPath, string imgPathLarge, DateTime inDate,string label)
    {
        this.Id = id;
        this.TypeId = typeid;
        this.Name = name;
        this.NewPrice = newprice;
        this.OldPrice = oldprice;
        this.ImgPath = imgPath;
        this.ImgPathLarge = imgPathLarge;
        this.InDate = inDate;
        this.Label = label;
    }  
    public Product()
    {
    }
}