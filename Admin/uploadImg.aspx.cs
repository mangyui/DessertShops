using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_uploadImg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //登录验证代码也可以写在这里 
        //绑定数据到下拉框 
        if (!IsPostBack)
        {
            bindData();
        }

    }
    //上传文件按钮
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (FileUpload1.PostedFile.FileName == "")
            //if (!FileUpload1.HasFile)     //获取一个值，该值指示 System.Web.UI.WebControls.FileUpload 控件是否包含文件。包含文件，则为 true；否则为 false。 
            {
                this.Upload_info.Text = "请选择上传文件！";
                //Page.RegisterStartupScript("key2", "<script>alert('请选择上传文件！')</script>");
            }
            else
            {
                string filepath = FileUpload1.PostedFile.FileName;  //得到的是文件的完整路径,包括文件名，如：C:\Documents and Settings\Administrator\My Documents\My Pictures\20022775_m.jpg 
                //但在IE8下可能只能取得文件名，因安全性问题，ie7+之后浏览器可以设置不允许上传路径了，只允许上传文件名
                //IE internet选项>安全>自定义级别>将上传带上路径勾选   
                if (IsAllowedExtension(filepath) == true)
                {
                    string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);//取文件名，不带路径
                    DateTime dtime = DateTime.Now;
                    string newFileName = dtime.ToString("yyyyMMddhhmmss");//上传时间是文件名的一部分
                    //文件名：p+时间+后缀名 组成
                    newFileName = "p" + newFileName + Path.GetExtension(filename);
                    string serverpath = Server.MapPath("~/images/cake/") + newFileName;//取得文件在服务器上保存的位置 
                    FileUpload1.PostedFile.SaveAs(serverpath);//将上传的文件另存为 
                    //如果要将图片信息保存到数据库中，可在此处写代码。
                    txtNewName.Text = serverpath;
                    bindData();//重新绑定数据到下拉框
                    this.Upload_info.Text = "上传成功！";
                }
                else
                {
                    this.Upload_info.Text = "请上传图片";
                }
            }
        }
        catch (Exception ex)
        {
            this.Upload_info.Text = "上传发生错误！原因是：" + ex.ToString();
        }
    }

    //检查上传的文件的格式,只根据文件的扩展名进行检查
    private static bool IsAllowedExtension(string filename)
    {
        string extension = Path.GetExtension(filename);
        if (extension.ToLower() == ".jpg" || extension.ToLower() == ".bmp" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    //选择框内容改变后
    protected void ddlImgName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Image1.ImageUrl = ddlImgName.SelectedValue;
    }
    //将服务器images\\uploads文件夹下的图片文件路径绑定到下拉框
    protected void bindData()
    {
        //获取images文件夹的物理路径
        string str = Server.MapPath(Request.ApplicationPath) + "\\images\\cake";
        //
        string[] strFiles = System.IO.Directory.GetFiles(str);

        ddlImgName.Items.Clear();

        for (int i = 0; i < strFiles.Length; i++)
        {
            ListItem item = new ListItem(System.IO.Path.GetFileNameWithoutExtension(strFiles[i]), "~\\images\\cake\\" + System.IO.Path.GetFileName(strFiles[i]));
            ddlImgName.Items.Add(item);
        }
        Image1.ImageUrl = ddlImgName.SelectedValue;
    }

}