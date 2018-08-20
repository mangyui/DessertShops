<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="productsAdd.aspx.cs" Inherits="Admin_productsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .tdCont a:nth-child(5) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff; color:#000;
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
        <tr><td>商品名</td><td><asp:TextBox ID="txtName"  class="myinput" runat="server"></asp:TextBox></td></tr>
        <tr><td>商品类型</td><td><asp:DropDownList ID="ddlTypeid" class="myinput" Width="220" runat="server" DataSourceID="SqlDataSource1" DataTextField="类别名" DataValueField="类别ID"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>

            </td></tr>
        <tr><td>价格</td><td><asp:TextBox ID="txtPrice" class="myinput" runat="server"></asp:TextBox></td></tr>
        <tr><td>图片</td><td><asp:DropDownList ID="ddlImgpath" class="myinput" runat="server" OnSelectedIndexChanged="ddlImgpath_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
            </td></tr>
        <tr><td>简介</td><td><asp:TextBox ID="txtDesc" class="myinput" runat="server" Height="79px" TextMode="MultiLine" Width="345px"></asp:TextBox></td></tr>
    </table>
    <asp:Button ID="Button1" runat="server" Text="增加商品" OnClick="Button1_Click" />
</asp:Content>



