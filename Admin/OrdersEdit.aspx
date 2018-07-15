<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="OrdersEdit.aspx.cs" Inherits="Admin_OrdersEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .tdCont a:nth-child(7) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff;  color:#000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     关键字：<asp:TextBox ID="txtKey" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [orders] order by 订单号 desc"></asp:SqlDataSource>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="订单号" DataSourceID="SqlDataSource1" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
      
           
        <EmptyDataTemplate>
            <table runat="server" style="" >
                <tr>
                    <td>未找到数据。</td>
                </tr>
            </table>
        </EmptyDataTemplate>
         
         
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="订单号Label" runat="server" Text='<%# Eval("订单号") %>' />
                </td>
                <td>
                    <asp:Label ID="用户号Label" runat="server" Text='<%# Eval("用户号") %>' />
                </td>
                <td>
                    <asp:Label ID="下单日期Label" runat="server" Text='<%# Eval("下单日期") %>' />
                </td>
                <td>
                    <asp:Label ID="总价Label" runat="server" Text='<%# Eval("总价") %>' />
                </td>
                <td>
                    <asp:Label ID="订单状态Label" runat="server" Text='<%# Eval("订单状态") %>' />
                </td>
                <td class="opTd" >
                    <asp:LinkButton ID="LinkButtonDelete" runat="server" CommandArgument='<%# Eval("订单号") %>' OnClientClick="return confirm('确定删除此记录吗？');" OnClick="LinkButtonDelete_Click" >删除</asp:LinkButton>
                    ｜<asp:LinkButton ID="LinkButtonfh" runat="server" CommandArgument='<%# Eval("订单号") %>' OnClientClick="return confirm('确定确定发货么？');" OnClick="LinkButtonfh_Click" >发货</asp:LinkButton>
                </td>

            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server"  class="PEtable">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server"  class="tableEdit PEtable" style="" >
                            <tr runat="server" style="">
                                <th runat="server">订单号</th>
                                <th runat="server">用户号</th>
                                <th runat="server">下单日期</th>
                                <th runat="server">总价</th>
                                <th runat="server">订单状态</th>
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
    <asp:DataPager ID="DataPager1" runat="server" PageSize="5" PagedControlID="ListView1">
        <Fields>
          <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
           <asp:NumericPagerField />
           <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
    
</asp:Content>

