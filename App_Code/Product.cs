using System;
using System.Collections.Generic;

/// <summary>
///Product——产品类
/// </summary>
public class Product
{
    public int Id { get; set; }
    public int TypeId { get; set; }
    public int SmallTypeId { get; set; }
    public string Name { get; set; }
    public decimal OldPrice { get; set; }
    public decimal NewPrice { get; set; }
    public string Desc { get; set; }
    public string ImgPath { get; set; }
    public string ImgPathLarge { get; set; }
    public DateTime InDate { get; set; }
    public int Num { get; set; }

    public Product()
    {
    }

    public Product(int id, string name, decimal oldprice,decimal newprice, string imgPath, string imgPathLarge, DateTime inDate)
    {
        this.Id = id;
        this.Name = name;
        this.NewPrice = newprice;
        this.OldPrice = oldprice;
        this.ImgPath = imgPath;
        this.ImgPathLarge = imgPathLarge;
        this.InDate = inDate;
    }
    public Product(int id, string name, decimal oldprice, decimal newprice, string imgPath, string imgPathLarge, DateTime inDate,int num)
    {
        this.Id = id;
        this.Name = name;
        this.NewPrice = newprice;
        this.OldPrice = oldprice;
        this.ImgPath = imgPath;
        this.ImgPathLarge = imgPathLarge;
        this.InDate = inDate;
        this.Num = num;
    }
}