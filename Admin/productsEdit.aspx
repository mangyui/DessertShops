<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="productsEdit.aspx.cs" Inherits="Admin_productsEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .tdCont a:nth-child(5) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff;color:#000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     关键字：<asp:TextBox ID="txtKey" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [商品ID], [商品名], [现价], [图片], [商品类别], [日期], [销量] FROM [Product]"></asp:SqlDataSource>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="商品ID" DataSourceID="SqlDataSource1" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
               
      
        <EmptyDataTemplate>
            <table runat="server" style="" >
                <tr>
                    <td>未返回数据。</td>
                </tr>
            </table>
        </EmptyDataTemplate>
         
         
        <ItemTemplate>
            <tr style="" >
                <td>
                    <asp:Label ID="商品IDLabel" runat="server" Text='<%# Eval("商品ID") %>' />
                </td>
                <td>
                    <asp:Label ID="商品名Label" runat="server" Text='<%# Eval("商品名") %>' />
                </td>
                <td>
                    <asp:Label ID="现价Label" runat="server" Text='<%# Eval("现价") %>' />
                </td>
                <td>
                      <asp:Image ID="Image1" ImageUrl='<%# Eval("图片") %>' width="100px" Height="100px" runat="server" />
                    <%--<asp:Label ID="图片Label" runat="server" Text='<%# Eval("图片") %>' />--%>
                </td>
                <td>
                    <asp:Label ID="商品类别Label" runat="server" Text='<%# Eval("商品类别") %>' />
                </td>
                <td>
                    <asp:Label ID="日期Label" runat="server" Text='<%# Eval("日期") %>' />
                </td>
                <td>
                    <asp:Label ID="销量Label" runat="server" Text='<%# Eval("销量") %>' />
                </td>
                 <td class="opTd">
                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%# Eval("商品ID") %>' OnClientClick="return confirm('确定删除此记录吗？');" OnClick="LinkButtonDelete_Click" >删除</asp:LinkButton>
                    ｜<a href="updateProduct.aspx?id=<%# Eval("商品ID") %>">修改</a>
                </td>

            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" >
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" class="tableEdit" style="" border="0">
                            <tr runat="server" style="">
                                <th runat="server">商品ID</th>
                                <th runat="server">商品名</th>
                                <th runat="server">现价</th>
                                <th runat="server">图片</th>
                                <th runat="server">商品类别</th>
                                <th runat="server">日期</th>
                                <th runat="server">销量</th>
                               <th runat="server">操作</th>
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
    <asp:DataPager ID="DataPager1" runat="server" PageSize="2" PagedControlID="ListView1">
        <Fields>
          <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
           <asp:NumericPagerField />
           <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
    
</asp:Content>


