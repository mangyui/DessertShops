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

        String insertcmd = "insert into Customers(用户名,密码,性别,电话,年龄,地址) values(@UserName,@UserPwd,@Sex,@TelNo,@Birthday,@Address)";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //可在此判断参数是否正确，密码是否相同
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
            if (reader["省份"].ToString() != "")
                c.Province = reader["省份"].ToString();
            if (reader["城市"].ToString() != "")
                c.City = reader["城市"].ToString();
            list.Add(c);
        }
        connection.Close();
        return list;
    }
    public static List<Customer> GetAdminsList()
    {
        List<Customer> list = new List<Customer>();
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM [admin]";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        Customer c = null;
        while (reader.Read())
        {
            c = new Customer();
            c.UserName = reader["管理员名"].ToString();
            c.UserPwd = reader["密码"].ToString();
            list.Add(c);
        }
        connection.Close();
        return list;
    }
    public static Customer GetCustomer(string userid)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM Customers where 用户ID=@id";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@id", userid);
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
            if (reader["省份"].ToString() != "")
                c.Province = reader["省份"].ToString();
            if (reader["城市"].ToString() != "")
                c.City = reader["城市"].ToString();
        }
        connection.Close();
        return c;
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
            if (reader["原价"].ToString() != "")
                p.OldPrice = decimal.Parse(reader["原价"].ToString());
            //p.ImgPath = reader["ImgPath"].ToString();
            p.ImgPath = reader["图片"].ToString().Replace("~\\", "");
            p.TypeId = int.Parse(reader["商品类别"].ToString());
            p.DeSCC = reader["简介"].ToString();
            p.Label=reader["标签"].ToString();
            p.InDate=DateTime.Parse(reader["日期"].ToString());
            p.Sale=int.Parse(reader["销量"].ToString());
         //   p.Img1 = p.Img2 = p.Img3 = p.ImgPath;//请根据自己定义的模型进行赋值

            list.Add(p);
        }
        connection.Close();
        return list;
    }
public static List<Product> GetProductsList2(int typeid)
    {
        List<Product> list = new List<Product>();

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM Product where 商品类别=@id";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@id", typeid);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Product p = new Product();
            p.Id = int.Parse(reader["商品ID"].ToString());
            p.Name = reader["商品名"].ToString();
            p.NewPrice = decimal.Parse(reader["现价"].ToString());
            //if (reader["原价"].ToString() != null)
            //    p.OldPrice = decimal.Parse(reader["原价"].ToString());
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

    public static List<Type> GetTypeList()
    {
        List<Type> list = new List<Type>();

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM [Category]";
        SqlCommand command = new SqlCommand(queryString, connection);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Type t = new Type();
            t.TypeId = int.Parse(reader["类别ID"].ToString());
            t.TypeName = reader["类别名"].ToString();
            list.Add(t);
        }
        connection.Close();
        return list;
    }
    public static List<Order> GetOriderList(string userid)
    {
        List<Order > list = new List<Order>();

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM [orders] where 用户号=@id order by 订单号 desc";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@id", userid);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            Order  o = new Order ();
            o.Id = int.Parse(reader["订单号"].ToString());
            o.State = reader["订单状态"].ToString();
            o.Price = decimal.Parse(reader["总价"].ToString());
            o.Userid = reader["用户号"].ToString();
            o.InDate = DateTime.Parse(reader["下单日期"].ToString());
            list.Add(o);
        }
        connection.Close();
        return list;
    }
    public static List<OrderDetails> GetODList(string orderid)
    {
        List<OrderDetails> list = new List<OrderDetails>();

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM [orderDetails] where 订单号=@id";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@id", orderid);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            OrderDetails od = new OrderDetails();
            od.OrderId = int.Parse(reader["订单号"].ToString());
            od.Price = decimal.Parse(reader["小计总价"].ToString());
            od.Name = reader["商品名"].ToString();
            od.Img = reader["商品图"].ToString();
            od.Peoductid = int.Parse(reader["商品号"].ToString());
            od.Num = int.Parse(reader["数量"].ToString());
            list.Add(od);
        }
        connection.Close();
        return list;
    }
    public static Order GetOrder(int orderid)
    {

        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM [orders] where 订单号=@id";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@id", orderid);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        Order o = new Order();
        while (reader.Read())
        {          
            o.Id = int.Parse(reader["订单号"].ToString());
            o.State = reader["订单状态"].ToString();
            o.Price = decimal.Parse(reader["总价"].ToString());
            o.Userid = reader["用户号"].ToString();
            o.InDate = DateTime.Parse(reader["下单日期"].ToString());
                    
        }connection.Close(); 
        return o;
    }
    public static int createOrder(string userid, ShoppingCart cart)
    {
        //创建连接对象
        string cnnstr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(cnnstr);
        string cmdstr = "insert into orders(用户号,下单日期,总价, 订单状态) values(@userid,@date,@totalprice,@status)";
        SqlCommand sqlcmd = new SqlCommand(cmdstr, connection);
        sqlcmd.Parameters.AddWithValue("@userid", userid);
        sqlcmd.Parameters.AddWithValue("@date", DateTime.Now.ToString());
        sqlcmd.Parameters.AddWithValue("@totalprice", cart.TotalSum);
        sqlcmd.Parameters.AddWithValue("@status", "待付款");
        SqlTransaction tran = null;
        string orderid = "";
        try
        {
            connection.Open();
            //开启一个事务，并返回给tran
            tran = connection.BeginTransaction();
            sqlcmd.Transaction = tran;//指定sqlcmd对象属于tran事务
            sqlcmd.ExecuteNonQuery();//插入记录（生成订单）

            //向订单明细表中插入记录
            cmdstr = "exec get_Orderid @userid"; //降序排序后输出第一个orderid，即最新的。            **** //存储过程get_Orderid******
            sqlcmd.CommandText = cmdstr;
            sqlcmd.Parameters.Clear();//清空原来的sql参数，以便重新加入
            sqlcmd.Parameters.AddWithValue("@userid", userid);
            orderid = sqlcmd.ExecuteScalar().ToString();//查自动生成的订单id值。因只查一个值，所以使用了标量查询。

            //向订单明细表中插入记录
            cmdstr = "insert into orderDetails(订单号,商品号,商品名,商品图,数量,小计总价) values(@orderid,@pid,@pname,@pimg,@number,@totalprice)";
            sqlcmd.CommandText = cmdstr;

            //将购买的商品的信息一一添加到订单明细表中
            foreach (CartItem item in cart.CartItems)
            //for (int i = 0; i < cart.CartItems.Count; i++)
            {
                sqlcmd.Parameters.Clear();//清空原来的sql参数，以便重新加入
                sqlcmd.Parameters.AddWithValue("@pid", item.Id);
                sqlcmd.Parameters.AddWithValue("@pname", item.Name);
                sqlcmd.Parameters.AddWithValue("@pimg", item.Img);
                sqlcmd.Parameters.AddWithValue("@orderid", orderid);
                sqlcmd.Parameters.AddWithValue("@number", item.Quantity);
                sqlcmd.Parameters.AddWithValue("@totalprice", item.Quantity * item.Price);
                sqlcmd.ExecuteNonQuery();//插入记录（生成订单详细）
            }

            tran.Commit();//提交事务
            return int.Parse(orderid);
        }
        catch (Exception ex)//出错时
        {
            //回滚事务，数据库不作任务修改
            tran.Rollback();
            //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
            return -1;
        }
        finally
        {   //如果连接打开，则关闭连接
            if (connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
            }
        }
    }
    public static bool PayOrder(string userid, int orderid)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        String insertcmd = "exec Order_User @userid,@orderid";         //****Order_User存储过程*********

        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //
        mycmd.Parameters.AddWithValue("@userid", userid);
        mycmd.Parameters.AddWithValue("@orderid", orderid);
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            return false;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult > 0)
        {
           return true;
        }
        else
        {
           return false;           
        }
    }
    public static bool deleteOrder(int orderid)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String cmd = "delete from [orderDetails] where 订单号=@id";
        SqlCommand mycmd = new SqlCommand(cmd, connection);
        mycmd.Parameters.AddWithValue("@id", orderid);
        mycmd.Connection.Open();
        int iResult = 0;//影响的记录数
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            return false;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static bool updateOrder(string oldstate,string newstate,int orderid)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
       // String insertcmd = "update  [orders] set 订单状态='交易完成' where 订单号=@orderid and 订单状态='待评价'";
        String insertcmd = "exec Update_Order @oldstate,@newstate,@orderid";             //****Update_Order存储过程*********

        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //
        mycmd.Parameters.AddWithValue("@oldstate", oldstate);
        mycmd.Parameters.AddWithValue("@newstate", newstate);
        mycmd.Parameters.AddWithValue("@orderid", orderid);
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            return false;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    public static bool ChongZhi(string userid,decimal money)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        String insertcmd = "update  Customers set 余额=余额+@money where 用户ID=@userid";        

        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //
        mycmd.Parameters.AddWithValue("@userid", userid);
        mycmd.Parameters.AddWithValue("@money", money);
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            return false;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult > 0)
        {
           return true;
        }
        else
        {
           return false;           
        }
    }
    public static bool UpdateCustomer(string userid,Customer cus)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);
        String insertcmd = "update Customers set 用户名=@name,年龄=@age,电话=@telno,地址=@adss,密码=@pwd where 用户ID=@id";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //
        mycmd.Parameters.AddWithValue("@name", cus.UserName);
        mycmd.Parameters.AddWithValue("@age", cus.Age);
        mycmd.Parameters.AddWithValue("@telno", cus.TelNo);
        mycmd.Parameters.AddWithValue("@adss", cus.Address);
        mycmd.Parameters.AddWithValue("@pwd", cus.UserPwd);
        mycmd.Parameters.AddWithValue("@id", userid);
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {       
            return false;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}