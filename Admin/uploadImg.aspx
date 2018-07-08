<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="uploadImg.aspx.cs" Inherits="Admin_uploadImg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .tdCont p:nth-child(4) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin-bottom: 20px; font-size: 20px; text-align: center; color: blue;">
        <b>商品图片上传</b></div>
    <div>
        <table style="margin: 0 auto; text-align: center">
            <tr>
                <td>
                    服务器已存在的图片
                    <asp:DropDownList ID="ddlImgName" runat="server" Height="27px" Width="317px" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlImgName_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    显示选中的图片<asp:Image ID="Image1" runat="server" Height="156px" Width="192px" />
                </td>
            </tr>
            <tr>
                <td>
                    上传到服务器后的图片的名称<asp:TextBox ID="txtNewName" runat="server" Width="317px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    本地要上传的图片的路径
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="317px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Upload_info" runat="server" ForeColor="Red"></asp:Label><br />
                    <asp:Button ID="Button1" runat="server" Text="上传图片" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>


