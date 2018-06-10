using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///CustomerFactory 的摘要说明
/// </summary>
public class CustomerFactory
{
    private static List<Customer> customersList;
    public static List<Customer> GetCustomersList()
    {
        customersList = new List<Customer>();
        
        Customer c = new Customer("101","余会明","cool","男",new DateTime(1990-1-21),"绍兴文理学院","18857518492",10000M,"浙江省","绍兴市");
        customersList.Add(c);
        c = new Customer("102", "Tom", "123", "男", new DateTime(2006 - 5 - 22), "绍兴文理学院", "13856569696", 10000M, "浙江省", "绍兴市");
        customersList.Add(c);

        return customersList;
    }
    public static Customer GetCustomerByUserId(string id)
    {
        List<Customer> customers = CustomerFactory.GetCustomersList();
        Customer customer = new Customer();
        customer = null;
        for (int i = 0; i < customers.Count; i++)
        {
            if (customers[i].UserId == id)
            {
                customer = customers[i];
                break;
            }
        }
        return customer;
    }

    public static Customer GetCustomerByTelNo(string telNo,string pwd)
    {
        List<Customer> customers = CustomerFactory.GetCustomersList();

        for (int i = 0; i < customers.Count; i++)
        {
            if (customers[i].TelNo == telNo && customers[i].UserPwd == pwd)
            {
               return  customers[i];
            }
        }
        return null;
    }
    public static bool HasCustomerByTelNo(string telNo)
    {
        List<Customer> customers = CustomerFactory.GetCustomersList();

        for (int i = 0; i < customers.Count; i++)
        {
            if (customers[i].TelNo == telNo)
            {
               return  true;
            }
        }
        return false;
    }
}