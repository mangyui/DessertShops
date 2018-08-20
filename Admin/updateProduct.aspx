<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="updateProduct.aspx.cs" Inherits="Admin_updateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            height: 60px;
        }
        .tdCont a:nth-child(6) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff;color:#000;
        }
        .tdMo{
            vertical-align:middle;
        }
        .addtable{
            margin-bottom:20px;
            border-collapse:collapse;
        }
        .addtable td{
           border:1px solid #ccc;
           padding:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="addtable">
        <tr><td>Id</td><td><asp:TextBox ID="txtID"  runat="server" Enabled="false"></asp:TextBox></td></tr>
        <tr><td class="auto-style1">商品名</td><td><asp:TextBox ID="txtName" class="myinput"  runat="server"></asp:TextBox></td></tr>
        <tr><td class="auto-style2">商品类型</td><td><asp:DropDownList ID="ddlTypeid" class="myinput" width="218" runat="server" DataSourceID="SqlDataSource1" DataTextField="类别名" DataValueField="类别ID"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>

            </td></tr>
        <tr><td>商品价格</td><td><asp:TextBox ID="txtPrice" class="myinput"  runat="server"></asp:TextBox></td></tr>
        <tr><td>商品图片</td><td><asp:DropDownList ID="ddlImgpath" class="myinput"  runat="server" OnSelectedIndexChanged="ddlImgpath_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
            </td></tr>
        <tr><td>简介</td><td><asp:TextBox ID="txtDesc" class="myinput"  runat="server" Height="79px" TextMode="MultiLine" Width="345px"></asp:TextBox></td></tr>

    </table>
        <asp:Button ID="Button1" runat="server" Text="修改" OnClick="Button1_Click" />
</asp:Content>


