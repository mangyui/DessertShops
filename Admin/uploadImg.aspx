<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="uploadImg.aspx.cs" Inherits="Admin_uploadImg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .tdCont a:nth-child(8) {
            border-right: none;
            border-left: 4px solid #414141;
            background-color: #ffffff;
            color: #000;
        }

        .lefttable {
            float: left;
        }

        .righttable {
            float: right;
        }

        .tdMo {
            vertical-align: middle;
        }
        .tdMo .PEtable{
            width:80%;
        }
        .PEtable th {
            background: #202d40;
            padding: 20px 10px;
            color: #fff;
        }
        .addtable{
            width:100%;
            border-collapse:collapse;
        }
        .addtable td{
            border-top:1px solid #fff;
        }
        .vtoptd{
            vertical-align:top;
        }
        .abtn{
            margin:5px;
        }
        .addtable td.bgwrite{
            text-align:center;
            height:112px;
            background-color:#fff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <table class="PEtable">
            <tr>
                <th>上传图片</th>
                <th>服务器图片</th>
            </tr>
            <tr>
                <td class="vtoptd">
                    <table class="addtable">
                        <tr>
                            <td>
                                <asp:FileUpload ID="FileUpload1" class="abtn" runat="server" Width="317px" />
                            </td>

                        </tr>
                        <tr>
                             <td>
                                <asp:TextBox ID="txtNewName" class="myinput" runat="server" Width="317px" placeholder="修改图片名称"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="bgwrite">
                                <asp:Label ID="Upload_info" runat="server" ForeColor="Red"></asp:Label><br />
                                <asp:Button ID="Button1" runat="server" Text="上传图片" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table class="addtable">
                        <tr>
                            <td>
                                <asp:DropDownList ID="ddlImgName" class="myinput" runat="server" Height="30px" Width="317px" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlImgName_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="bgwrite">
                                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" />
                            </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>


