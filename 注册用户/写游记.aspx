z<%@ Page Language="C#" AutoEventWireup="true" CodeFile="写游记.aspx.cs" Inherits="注册用户_写游记" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link rel="stylesheet" href="../游客/用户.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="title">
                上传我的游记
            </p>
        </div>
        <br /><br />
    <div>
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="题目："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="人均花费："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td></td>
               
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="出行时间："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="(格式为xxxx-xx-xx)"></asp:Label>
                </td>
                
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="出行人数："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td></td>
               
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="出行方式："></asp:Label>
                </td>
                <td class="auto-style1">
                   <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                        RepeatDirection="Horizontal" Height="10px">
                        <asp:ListItem>一个人</asp:ListItem>
                        <asp:ListItem>和朋友</asp:ListItem>
                       <asp:ListItem>家庭游</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td></td>
               
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="地点："></asp:Label>
                </td>
                <td class="auto-style1">
                    <div>
                        <br /> <br /><br />
                        <asp:Button ID="Button2" runat="server" Text="添加目的地" OnClick="Button2_Click" Height="35px" Width="150px" />
                        </div>
                    <div>
                        <br /><br />
                        <asp:Table ID="Table1" runat="server"></asp:Table>
                    </div>
                </td>
                <td></td>
               
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="正文："></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Height="500px" Width="600px"></asp:TextBox>
                </td>
                <td></td>
               
            </tr>
             <tr>
                <td>
                </td>
                <td class="auto-style1">
                    <br /> <br /> <br />
        <div>
            <asp:Button ID="Button1" runat="server" Text="上传" OnClick="Button1_Click" Height="40px" Width="150px" />
        </div>
                </td>
                <td></td>
               
            </tr>
        </table>
    </div>
       
    </form>
</body>
</html>
