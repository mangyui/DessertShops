using System;
using System.Collections.Generic;

/// <summary>
///ProductFactory 产品工厂类
/// </summary>
public class ProductFactory
{

    private static List<Product> productsList1;
    private static List<Product> productsList2;
    private static List<Product> productsList3;
    private static List<Product> cartsList;
    /// <summary>
    /// 获取所有产品信息
    /// </summary>
    /// <returns>产品对象列表</returns>
    public static List<Product> GetProductsList(int n)
    {
        productsList1 = new List<Product>();
        productsList2 = new List<Product>();
        Product p = new Product(1, "CUPCAKE GLORY", 25.00m, 20.00m, "/images/cake/img-cake-2.jpg", "/images/cake/img-cake-2.jpg", new DateTime(2018, 4, 16));
        productsList2.Add(p);

        p = new Product(2, "CUPCAKE GLORY 2", 25.00m, 15.00m, "/images/cake/img-cake-1.jpg", "/images/cake/img-cake-1.jpg", new DateTime(2018, 5, 16));
        productsList2.Add(p);

        p = new Product(3, "CUPCAKE QUEEN", 25.00m, 24.00m, "/images/cake/img-cake-12.jpg", "/images/cake/img-cake-12.jpg", new DateTime(2018, 4, 16));
        productsList1.Add(p);

        p = new Product(4, "CUPCAKE QUEEN 2", 25.00m, 15.00m, "/images/cake/img-cake-8.jpg", "/images/cake/img-cake-8.jpg", new DateTime(2018, 5, 16));
        productsList1.Add(p);

        p = new Product(5, "ICE CREAM PRINCE", 25.00m, 24.00m, "/images/cake/img-cake-7.jpg", "/images/cake/img-cake-7.jpg", new DateTime(2018, 5, 16));
        productsList1.Add(p);

        p = new Product(6, "CUTE DECORATIONS", 25.00m, 15.00m, "/images/cake/img-cake-4.jpg", "/images/cake/img-cake-4.jpg", new DateTime(2018, 5, 16));
        productsList1.Add(p);

        p = new Product(7, "ICE CREAM PRINCESS", 25.00m, 24.00m, "/images/cake/img-cake-0.png", "/images/cake/img-cake-0.png", new DateTime(2018, 5, 16));
        productsList1.Add(p);

        p = new Product(8, "CUTE DECORATIONS 2", 25.00m, 15.00m, "/images/cake/img-cake-5.jpg", "/images/cake/img-cake-5.jpg", new DateTime(2018, 5, 16));
        productsList2.Add(p);

        p = new Product(9, "RED SUGAR FLOWER", 25.00m, 20.00m, "/images/cake/img-cake-3.jpg", "/images/cake/img-cake-3.jpg", new DateTime(2018, 5, 16));
        productsList2.Add(p);

        p = new Product(10, "AMAZIN’ GLAZIN’", 50.00m, 40.00m, "/images/cake/img-cake-9.jpg", "/images/cake/img-cake-9.jpg", new DateTime(2018, 5, 16));
        productsList1.Add(p);

        p = new Product(11, "ANYTIME CAKES", 50.00m, 40.00m, "/images/cake/img-cake-11.jpg", "/images/cake/img-cake-11.jpg", new DateTime(2018, 5, 16));
        productsList1.Add(p);

        p = new Product(12, "ANYTIME CAKES 2", 50.00m, 35.00m, "/images/cake/img-cake-10.jpg", "/images/cake/img-cake-10.jpg", new DateTime(2018, 5, 16));
        productsList1.Add(p);

        p = new Product(13, "ICE CREAM QUEEN", 25.00m, 15.00m, "/images/cake/img-cake-6.jpg", "/images/cake/img-cake-6.jpg", new DateTime(2018, 5, 16));
        productsList2.Add(p);
     
        if(n==1)
        return productsList1;
        return productsList2;
    }
    /// <summary>
    /// 获取产品2
    /// </summary>
    /// <returns></returns>
    public static List<Product> GetProductsList2()
    {
        productsList3 = new List<Product>();
        Product p = new Product(21, "BREAD CAKE", 30.00m, 24.00m, "/images/cake/img-cr-1.jpg", "/images/cake/img-cr-1.jpg", new DateTime(2018, 5, 16));
        productsList3.Add(p);

        p = new Product(22, "BREAD CAKE 1", 30.00m, 24.00m, "/images/cake/img-cr-2.jpg", "/images/cake/img-cr-2.jpg", new DateTime(2018, 5, 16));
        productsList3.Add(p);

        p = new Product(23, "BREAD CAKE 2", 30.00m, 24.00m, "/images/cake/img-cr-3.jpg", "/images/cake/img-cr-3.jpg", new DateTime(2018, 5, 16));
        productsList3.Add(p);

        p = new Product(24, "BREAD CAKE 3", 30.00m, 24.00m, "/images/cake/img-cr-4.jpg", "/images/cake/img-cr-4.jpg", new DateTime(2018, 5, 16));
        productsList3.Add(p);


        return productsList3;
    }
    /// <summary>
    /// 创建并获取默认购物车产品
    /// </summary>
    /// <returns></returns>
    public static List<Product> GetCartsList()
    {
        return cartsList;
    }
    /// <summary>
    /// 根据Id获取单个产品信息
    /// </summary>
    /// <param name="id">产品编号</param>
    /// <returns>产品对象</returns>
    public static Product GetProductById(int id)
    {
        List<Product> products = ProductFactory.GetProductsList(1);
        Product p = new Product();
        for (int i = 0; i < products.Count; i++)
        {
          if (products[i].Id == id)
          {
            p = products[i];
            break;
          }
        }
        products = ProductFactory.GetProductsList(2);
        for (int i = 0; i < products.Count; i++)
        {
            if (products[i].Id == id)
            {
                p = products[i];
                break;
            }
        }
        products = ProductFactory.GetProductsList2();
        for (int i = 0; i < products.Count; i++)
        {
            if (products[i].Id == id)
            {
                p = products[i];
                break;
            }
        }
        return p;
    }

}
