using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProductsSales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["selectCmd"] != null)//确保查询结果分页能正确显示
        {
            SqlDataSource1.SelectCommand = ViewState["selectCmd"].ToString();
        }

    }
    //删除记录
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string selectCmd = "select * from SaleProdect ";//不输入关键字，则查所有
        if (txtKey.Text.Trim().Length != 0)//输入了关键字，则在此按商品名和商品描述 模糊查找
        {
            selectCmd += " where 商品ID like '%" + txtKey.Text.Trim() + "%' or 商品名 like '%" + txtKey.Text.Trim() + "%'or 商品类别 like '%" + txtKey.Text.Trim() + "%' order by 销量 desc,收入总额 desc";
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        ExportToExcel(ListView1);
    }
    //将listview,gridview等控件的内容输出成为Excel,word等文件的方法 
    //1.将下面的两个函数复制到你的页面的 后台文件（.cs文件）中
    //要将控件的内容输出成为excel等，以下函数不可省略
    public override void VerifyRenderingInServerForm(Control control)
    {
        // Confirms that an HtmlForm control is rendered for        the specified ASP.NET server control at run time.
    }
    //将控件的内容输出到excel word等的函数，函数参数的类型为要输出的内容所在的控件的类型，以下定义的是输出listview的内容
    //注意：上面的“VerifyRenderingInServerForm”函数不可缺少
    protected void ExportToExcel(ListView lv) //参数类型是listview。如要输出gridview控件的内容，此处参数类型改为gridview即可
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "utf-8";
        //下面这行很重要，  attachment 参数表示作为附件下载，您可以改成 online在线打开
        //filename=FileFlow.xls 指定输出文件的名称，注意其扩展名和指定文件类型相符，可以为：.doc || .xls || .txt ||.htm
        Response.AppendHeader("Content-Disposition", "attachment;filename=FileFlow.xls");
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");
        //Response.ContentType指定文件类型 可以为application/ms-excel || application/ms-word || application/ms-txt || application/ms-html || 或其他浏览器可直接支持文档
        Response.ContentType = "application/ms-excel";
        this.EnableViewState = false;
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
        //渲染控件，生成可输出的内容
        lv.RenderControl(oHtmlTextWriter);
        //this 表示输出本页，你也可以绑定datagrid,或其他支持obj.RenderControl()属性的控件
        Response.Write(oStringWriter.ToString());
        Response.End();
    }
}