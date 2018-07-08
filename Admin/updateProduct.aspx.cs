using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_updateProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //绑定数据到下拉框 
        if (!IsPostBack)
        {
            bindData();
            bindRecord();
        }
    }

    //根据传递过来的id查找记录，将记录的各列值绑定到页面控件中
    protected void bindRecord()
    {
        string id = Request["id"];
        if (id == null)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('参数错误！');</script>");
            return;
        }
        //查找记录
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM Product where 商品ID=@id";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@id", id);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            txtID.Text = reader["商品ID"].ToString();
            txtName.Text = reader["商品名"].ToString();
            txtDesc.Text = reader["简介"].ToString();
            txtPrice.Text = reader["现价"].ToString();
            ddlImgpath.SelectedValue = reader["大图"].ToString();
            Image1.ImageUrl = ddlImgpath.SelectedValue;
            ddlTypeid.SelectedValue = reader["商品类别"].ToString();
        }
        connection.Close();
    }

    //选择框内容改变后
    protected void ddlImgpath_SelectedIndexChanged(object sender, EventArgs e)
    {
        Image1.ImageUrl = ddlImgpath.SelectedValue;
    }

    //将服务器images\\uploads文件夹下的图片文件路径绑定到下拉框
    protected void bindData()
    {
        //获取images文件夹的物理路径
        string str = Server.MapPath(Request.ApplicationPath) + "\\images\\cake";
        //
        string[] strFiles = System.IO.Directory.GetFiles(str);

        ddlImgpath.Items.Clear();

        for (int i = 0; i < strFiles.Length; i++)
        {
            ListItem item = new ListItem(System.IO.Path.GetFileNameWithoutExtension(strFiles[i]), "~\\images\\cake\\" + System.IO.Path.GetFileName(strFiles[i]));
            ddlImgpath.Items.Add(item);
        }
        Image1.ImageUrl = ddlImgpath.SelectedValue;
    }
    //修改
    protected void Button1_Click(object sender, EventArgs e)
    {
        GetOldPrice();
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "update Product set 商品名=@name,现价=@price,简介=@desc,图片=@imgpath,商品类别=@typeid where 商品ID=@id";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //
        mycmd.Parameters.AddWithValue("@name", txtName.Text.Trim());
        mycmd.Parameters.AddWithValue("@price", txtPrice.Text.Trim());
        mycmd.Parameters.AddWithValue("@desc", txtDesc.Text.Trim());
        mycmd.Parameters.AddWithValue("@imgpath", ddlImgpath.SelectedValue);
        mycmd.Parameters.AddWithValue("@typeid", ddlTypeid.SelectedValue);
        mycmd.Parameters.AddWithValue("@id", txtID.Text.Trim());
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('错误！');</script>");
            return;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('修改记录成功！');window.location.href='productsEdit.aspx';</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('命令执行完成，但没有记录被修改！');window.location.href='productsEdit.aspx';</script>");
        }
    }
    public void GetOldPrice()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "update Product set 原价=现价 where 商品ID=@id";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
       
        mycmd.Parameters.AddWithValue("@id", txtID.Text.Trim());
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('错误！');</script>");
            return;
        }
        finally
        {
            mycmd.Connection.Close();
        }
    }

}