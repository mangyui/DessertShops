using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Customer 的摘要说明
/// </summary>
public class Customer
{
    public string UserId { get; set; }
    public string  UserName { get; set; }
    public string  UserPwd { get; set; }
    public string  Sex { get; set; }
    public int Age { get; set; }
    public string  Address { get; set; }
    public string  TelNo { get; set; }
    public decimal Balance { get; set; }
    public string Province { get; set; }
    public string  City { get; set; }
    public Customer(string userId,string userName,string userPwd,string sex,
int birthday,string address,string telNo,decimal balance,string province,string city)
    {
        this.UserId = userId;
        this.UserName = userName;
        this.UserPwd = userPwd;
        this.Sex = sex;
        this.Age = birthday;
        this.Address = address;
        this.TelNo = telNo;
        this.Balance = balance;
        this.Province = province;
        this.City = city;
    }

    public Customer()
    {
    }
}