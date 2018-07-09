<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="productsAdd.aspx.cs" Inherits="Admin_productsAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .tdCont a:nth-child(3) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff; color:#000;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr><td>Name</td><td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td></tr>
        <tr><td>typeid</td><td><asp:DropDownList ID="ddlTypeid" runat="server" DataSourceID="SqlDataSource1" DataTextField="类别名" DataValueField="类别ID"></asp:DropDownList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>

            </td></tr>
        <tr><td>price</td><td><asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td></tr>
        <tr><td>imgpath</td><td><asp:DropDownList ID="ddlImgpath" runat="server" OnSelectedIndexChanged="ddlImgpath_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
            <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" />
            </td></tr>
        <tr><td>[desc]</td><td><asp:TextBox ID="txtDesc" runat="server" Height="79px" TextMode="MultiLine" Width="345px"></asp:TextBox></td></tr>

    </table>
        <asp:Button ID="Button1" runat="server" Text="增加商品" OnClick="Button1_Click" />
</asp:Content>



