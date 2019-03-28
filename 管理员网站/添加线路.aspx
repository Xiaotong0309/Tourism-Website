<%@ Page Language="C#" AutoEventWireup="true" CodeFile="添加线路.aspx.cs" Inherits="管理员网站_添加线路" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link rel="stylesheet" href="管理.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="title">
                添加线路
            </p>
        </div>
        <br /><br />
    <div>
        <table style="width:100%">
            <tr>
                <td>
                    <asp:Label class="dark-matter"  ID="Label1" runat="server" Text="名称："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox  ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label class="dark-matter" ID="Label2" runat="server" Text="联系方式："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox  ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td></td>
               
            </tr>
             <tr>
                <td>
                    <asp:Label class="dark-matter" ID="Label10" runat="server" Text="出发地："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox  ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td></td>
               
            </tr>
            <tr>
                <td>
                    <asp:Label class="dark-matter" ID="Label3" runat="server" Text="天数："></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label class="dark-matter" ID="Label4" runat="server" Text="(格式为xxxx-xx-xx)"></asp:Label>
                </td>
                
            </tr>
             <tr>
                <td>
                    <asp:Label class="dark-matter" ID="Label5" runat="server" Text="线路说明："></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td></td>
               
            </tr>
             <tr>
                <td>
                    <asp:Label class="dark-matter" ID="Label6" runat="server" Text="类别："></asp:Label>
                </td>
                <td >
                   <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                        RepeatDirection="Horizontal" Height="10px">
                        <asp:ListItem>一日游</asp:ListItem>
                        <asp:ListItem>多日游</asp:ListItem>
                       <asp:ListItem>半自由行</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td></td>
               
            </tr>
            <tr>
                <td>
                    <asp:Label class="dark-matter" ID="Label7" runat="server" Text="地点："></asp:Label>
                </td>
                <td class="auto-style1">
                    <br /> <br /> <br />
                    <div>
                        <asp:Button  ID="Button4" runat="server" Height="30px" Text="添加地点" Width="130px" OnClick="Button4_Click" />
                       
                        </div>
                    <div>
                        <br /> <br /> <br />
                        <asp:Table ID="Table1" runat="server"></asp:Table>
                    </div>
                </td>
                <td></td>
               
            </tr>
                  <tr>
                <td style="vertical-align:top;">
                    <br /> <br />
                    <asp:Label class="dark-matter" ID="Label9" runat="server" Text="出发日期："></asp:Label>
                    <br />
                     <asp:Label class="dark-matter" ID="Label8" runat="server" Text="对应价格："></asp:Label>
                </td>
                <td class="auto-style1">
                    <div>
                        <asp:Button  ID="Button3" runat="server" Text="添加出行日期" OnClick="Button3_Click" Height="30px" Width="130px" />
                        </div>

                    <div>
                        <asp:Table ID="Table2" runat="server"></asp:Table>
                        <asp:Table ID="Table3" runat="server"></asp:Table>
                    </div>
                </td>
                <td></td>
               
            </tr>
            
            <tr>
                <td></td>
                <td class="auto-style1">
        <div>
            <asp:Button class="dark-matter" ID="Button1" runat="server" Text="添加" OnClick="Button1_Click" Height="40px" Width="150px" />
        </div>
                    </td>
                <td></td>
                </tr>
        </table>
    </div>
       
    </form>
</body>
</html>
