<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ProductsSales.aspx.cs" Inherits="Admin_ProductsSales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .tdCont a:nth-child(3) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff;  color:#000;
        }
        #ContentPlaceHolder1_Button1
        {
            float:right ;
            color: #fff;
    background-color: #449d44;
    border-color: #398439;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <asp:TextBox ID="txtKey" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [SaleProdect] ORDER BY [销量] DESC, [收入总额] DESC"></asp:SqlDataSource>
 <asp:Button ID="Button1" runat="server" Text="下载此页数据" OnClick="Button1_Click" />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="商品ID" DataSourceID="SqlDataSource1" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
      
     
        <EmptyDataTemplate>
            <table runat="server" style="" >
                <tr>
                    <td>未返回数据。</td>
                </tr>
            </table>
        </EmptyDataTemplate>
             
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="商品IDLabel" runat="server" Text='<%# Eval("商品ID") %>' />
                </td>
                <td>
                    <asp:Label ID="商品名Label" runat="server" Text='<%# Eval("商品名") %>' />
                </td>
                <td>
                    <asp:Label ID="商品类别Label" runat="server" Text='<%# Eval("商品类别") %>' />
                </td>
                <td>
                    <asp:Label ID="销量Label" runat="server" Text='<%# Eval("销量") %>' />
                </td>
                <td>
                    <asp:Label ID="收入总额Label" runat="server" Text='<%# Eval("收入总额") %>' />
                </td>

            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server"  class="PEtable">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" style=""  class="tableEdit PEtable"  border="0" >
                            <tr runat="server" style="">
                                <th runat="server">商品ID</th>
                                <th runat="server">商品名</th>
                                <th runat="server">商品类别</th>
                                <th runat="server">销量</th>
                                <th runat="server">收入总额</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </td>
                </tr>                
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
    
  
    
    </asp:ListView>
    <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="ListView1">
        <Fields>
          <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
           <asp:NumericPagerField />
           <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>

</asp:Content>


