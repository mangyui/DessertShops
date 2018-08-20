<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Tocustomers.aspx.cs" Inherits="Admin_Tocustomers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .tdCont a:nth-child(4) {
            border-right:none;
            border-left:4px solid #414141;
            background-color:#ffffff;  color:#000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="txtKey" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ToCustomers]"></asp:SqlDataSource>

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="用户ID" DataSourceID="SqlDataSource1" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" >
                   
           
           
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
                    <asp:Label ID="用户IDLabel" runat="server" Text='<%# Eval("用户ID") %>' />
                </td>
                <td>
                    <asp:Label ID="用户名Label" runat="server" Text='<%# Eval("用户名") %>' />
                </td>
                <td>
                    <asp:Label ID="性别Label" runat="server" Text='<%# Eval("性别") %>' />
                </td>
                <td>
                    <asp:Label ID="年龄Label" runat="server" Text='<%# Eval("年龄") %>' />
                </td>
                <td>
                    <asp:Label ID="地址Label" runat="server" Text='<%# Eval("地址") %>' />
                </td>
                <td >
                    <asp:Label ID="电话Label" runat="server" Text='<%# Eval("电话") %>' />
                </td>

                <td>
                    <asp:Label ID="下单次数Label" runat="server" Text='<%# Eval("下单次数") %>' />
                </td>

            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="PEtable" >
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server"  class="tableEdit PEtable" style="" border="0" >
                            <tr runat="server" style="">
                                <th runat="server">用户ID</th>
                                <th runat="server">用户名</th>
                                <th runat="server">性别</th>
                                <th runat="server">年龄</th>
                                <th runat="server">地址</th>
                                <th runat="server">电话</th>
                                <th runat="server">下单次数</th>
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

