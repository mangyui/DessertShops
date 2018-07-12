using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_OrdersEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["selectCmd"] != null)//确保查询结果分页能正确显示
        {
            SqlDataSource1.SelectCommand = ViewState["selectCmd"].ToString();
        }

    }
    //删除记录
    protected void LinkButtonDelete_Click(object sender, EventArgs e)
    {

        LinkButton lbn = (LinkButton)sender;
        string id = lbn.CommandArgument;//订单ID
        //ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('" + lbn.CommandArgument + "');</script>");
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String cmd = "delete from [orderDetails] where 订单号=@id";
        SqlCommand mycmd = new SqlCommand(cmd, connection);
        mycmd.Parameters.AddWithValue("@id", id);
        mycmd.Connection.Open();
        int iResult = 0;//影响的记录数
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('该订单无法删除');</script>");
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult > 0 )
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('删除成功。');window.location.href='OrdersEdit.aspx';</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('没有记录被删除。');</script>");
        }

    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string selectCmd = "select * from [orders]";//不输入关键字，则查所有
        if (txtKey.Text.Trim().Length != 0)//输入了关键字，则在此按商品名和商品描述 模糊查找
        {
            selectCmd += " where 订单号 like '%" + txtKey.Text.Trim() + "%' or 用户号 like '%" + txtKey.Text.Trim() + "%'or 订单状态 like '%" + txtKey.Text.Trim() + "%'";
        }

        SqlDataSource1.SelectCommand = selectCmd;
        ViewState["selectCmd"] = selectCmd;//保存查询命令，以便翻页时用。
    }
    //查询分页显示
    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        if (ViewState["selectCmd"] != null)
            SqlDataSource1.SelectCommand = ViewState["selectCmd"].ToString();
    }

    protected void LinkButtonfh_Click(object sender, EventArgs e)
    {
        LinkButton lbn = (LinkButton)sender;
        string id = lbn.CommandArgument;//订单ID
        //ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('" + lbn.CommandArgument + "');</script>");
        //string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //SqlConnection connection = new SqlConnection(connectionString);

        //String cmd = "update  [orders] set 订单状态='待收货' where 订单号=@id and 订单状态='已付款'";
        //SqlCommand mycmd = new SqlCommand(cmd, connection);
        //mycmd.Parameters.AddWithValue("@id", id);
        //mycmd.Connection.Open();
        //int iResult = 0;//影响的记录数
        //try
        //{
        //    iResult = mycmd.ExecuteNonQuery();
        //}
        //catch (Exception ee)
        //{
        //    ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('发货错误。');</script>");
        //}
        //finally
        //{
        //    mycmd.Connection.Close();
        //}
        if (DBHelper.updateOrder("已付款","待收货",int.Parse(id)))
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('发货成功。');window.location.href='OrdersEdit.aspx';</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('不满足发货条件。');</script>");
        }
    }
}