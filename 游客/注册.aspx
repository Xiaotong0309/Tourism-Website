<%@ Page Language="C#" AutoEventWireup="true" CodeFile="注册.aspx.cs" Inherits="reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="用户.css" type="text/css" />
    <style>
        table{display:block;margin:0 auto;width:500px;height:200px}
         body{text-align:center;}
         td{font:200;font-family:迷你简美黑}
    </style>
</head>
<body style="background-image:url(image/7.jpg)">
    <form id="form1" runat="server">
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />


                   
                    <table style="width:60%;height:90%">
              
                        <tr>
                            <td> <label class="dark-matter">用 户 名:</label>
                                </td><td>
                    <input class="dark-matter" type="text" id="name" name="name"  autocomplete="off"
                           placeholder="您的账户名和登录名"  /></td>
                            </tr>
                            <tr>
                            <td><label class="dark-matter">设置密码:</label>
                                 </td><td>
                    <input class="dark-matter" type="password" name="pwd" id="pwd" 
                           placeholder="请输入6至18位密码"  /></td>
                                </tr>
                               
                                    <tr>
 
                            <td><label class="dark-matter">手  机  号:</label>
                                 </td><td>
                            <input class="dark-matter" type="text" name="phone" id="phone" class="field ignore" autocomplete="off"
                                   placeholder="建议使用常用手机号"  /></td>
                                        </tr>
                                            <tr>
                            <td><label class="dark-matter">生      日:</label>
                                 </td><td>

                         <input class="dark-matter" id="birth" name="birth" type="text" placeholder="输入格式为xxxx-xx-xx"/>
                            </td>
                              </tr>
                               <tr>
                            <td><label class="dark-matter">性      别:</label>
                                 </td><td>

                               
                                       <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                        RepeatDirection="Horizontal" Height="10px">
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:RadioButtonList>

                               
                            </td>
                              </tr>
                        <tr>
                            <td>

                            </td>
                            <td>
 <asp:Button class="dark-matter" ID="Button1" runat="server" BackColor="#CC9900" ForeColor="White" Height="30px" Text="注册" Width="150px" OnClick="btnsubmit_Click"/>
                    
                            </td>
                        </tr>
                    </table>
                   
                
                
         
              
    </form>
</body>
</html>
