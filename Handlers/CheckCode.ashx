<%@ WebHandler Language="C#" Class="CheckCode" %>

using System;
using System.Web;
using System.Drawing;
using System.Web.SessionState;

public class CheckCode : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "image/png";// "text/plain";
        //context.Response.Write("Hello World");
        // 创建一个包含随机内容的验证码文本 
        System.Random rand = new Random();
        int len = rand.Next(4, 4);
        char[] chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
        System.Text.StringBuilder myStr = new System.Text.StringBuilder();
        for (int iCount = 0; iCount < len; iCount++)
        {
            myStr.Append(chars[rand.Next(chars.Length)]);
        }
        string text = myStr.ToString();
        // 保存验证码到 session 中以便其他模块使用 
        context.Session["checkcode"] = text;
        Size ImageSize = Size.Empty;
        Font myFont = new Font("MS Sans Serif", 20);
        // 计算验证码图片大小 
        using (Bitmap bmp = new Bitmap(10, 10))
        {
            using (Graphics g = Graphics.FromImage(bmp))
            {
                SizeF size = g.MeasureString(text, myFont, 10000);
                ImageSize.Width = (int)size.Width + 8;
                ImageSize.Height = (int)size.Height + 8;
            }
        }
        // 创建验证码图片 
        using (Bitmap bmp = new Bitmap(ImageSize.Width, ImageSize.Height))
        {
            // 绘制验证码文本 
            using (Graphics g = Graphics.FromImage(bmp))
            {
                g.Clear(Color.White);
                using (StringFormat f = new StringFormat())
                {
                    f.Alignment = StringAlignment.Near;
                    f.LineAlignment = StringAlignment.Center;
                    f.FormatFlags = StringFormatFlags.NoWrap;
                    g.DrawString(
                    text,
                    myFont,
                    Brushes.Black,
                    new RectangleF(
                    0,
                    0,
                    ImageSize.Width,
                    ImageSize.Height),
                    f);
                }//using 
            }//using 
            // 制造噪声 杂点面积占图片面积的 30% 
            int num = ImageSize.Width * ImageSize.Height * 30 / 100;
            for (int iCount = 0; iCount < num; iCount++)
            {
                // 在随机的位置使用随机的颜色设置图片的像素 
                int x = rand.Next(ImageSize.Width);
                int y = rand.Next(ImageSize.Height);
                int r = rand.Next(255);
                int g = rand.Next(255);
                int b = rand.Next(255);
                Color c = Color.FromArgb(r, g, b);
                bmp.SetPixel(x, y, c);
            }//for 
            // 输出图片 
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            bmp.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
            //context.Response.ContentType = "image/png";
            ms.WriteTo(context.Response.OutputStream);
            ms.Close();
        }//using 
        myFont.Dispose();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}
