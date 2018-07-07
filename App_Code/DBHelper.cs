using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// DBHelper 的摘要说明
/// </summary>
public class DBHelper
{
	public DBHelper()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static int AddCustomer(Customer c)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "insert into Customers(用户ID,用户名,密码,性别,电话,年龄,地址) values(@userid,@UserName,@UserPwd,@Sex,@TelNo,@Birthday,@Address)";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //可在此判断参数是否正确，密码是否相同
        mycmd.Parameters.AddWithValue("@userid", c.UserId);
        mycmd.Parameters.AddWithValue("@UserName", c.UserName);
        mycmd.Parameters.AddWithValue("@UserPwd", c.UserPwd);
        mycmd.Parameters.AddWithValue("@Sex", c.Sex);
        mycmd.Parameters.AddWithValue("@TelNo", c.TelNo);
        mycmd.Parameters.AddWithValue("@Birthday", c.Age);
        mycmd.Parameters.AddWithValue("@Address", c.Address);
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            //Label1.Text = ee.Message;
            return -1;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            return 0;
        }
        else
        {
            return -1; ;
        }
    }
    public static List<Customer> GetCustomersList()
    {
        List<Customer> list = new List<Customer>();
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM Customers";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        Customer c = null;
        while (reader.Read())
        {
            c = new Customer();
            c.UserId = reader["用户ID"].ToString();//或 c.UserId = reader[0].ToString();
            c.UserName = reader["用户名"].ToString();
            c.UserPwd = reader["密码"].ToString();
            c.Sex = reader["性别"].ToString();
            c.TelNo = reader["电话"].ToString();
            c.Age = Convert.ToInt32(reader["年龄"]);
            c.Address = reader["地址"].ToString();
            c.Balance = decimal.Parse(reader["余额"].ToString());
            list.Add(c);
        }
        connection.Close();
        return list;
    }
    public static List<Product> GetProductsList()
    {
        List<Product> list = new List<Product>();

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM Product";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Product p = new Product();
            p.Id = int.Parse(reader["商品ID"].ToString());
            p.Name = reader["商品名"].ToString();
            p.NewPrice = decimal.Parse(reader["现价"].ToString());
            //p.ImgPath = reader["ImgPath"].ToString();
            p.ImgPath = reader["图片"].ToString().Replace("~\\", "");
            p.TypeId = int.Parse(reader["商品类别"].ToString());
            p.DeSCC = reader["简介"].ToString();
            p.Label=reader["标签"].ToString();
         //   p.Img1 = p.Img2 = p.Img3 = p.ImgPath;//请根据自己定义的模型进行赋值

            list.Add(p);
        }
        connection.Close();
        return list;
    }


}