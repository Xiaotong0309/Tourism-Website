<%@ Page Language="C#" AutoEventWireup="true" CodeFile="登录.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<script runat="server">

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="用户.css" type="text/css" />
    <style>
        table{display:block;margin:0 auto;width:900px;height:200px}
         body{text-align:center;}
         td{font:200;font-family:迷你简美黑}
    </style>
</head>
<body style="background-image:url(image/7.jpg)">
    <form id="form1" runat="server">
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <br /><br /><br />
    <div >

      <table class="style1" style="align-self:center;width:35%;height:70%">
                        <tr>
                            <td >
               <label class="dark-matter">
     
<span class="dark-matter">登录名 :</span>                   
                                <asp:TextBox ID="txtUsername"  class="dark-matter"
                        runat="server" MaxLength="20" Width="150px" BackColor="#FFFF99" Height="30px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUsername" ErrorMessage="请填写用户名！"></asp:RequiredFieldValidator>
                           </label>
                    </td>
                        </tr>
                        <tr>
                            <td >
                              <label class="dark-matter">
<span class="dark-matter">密码 :</span>
                                <asp:TextBox  class="dark-matter"
                        ID="txtPwd" runat="server" MaxLength="20" TextMode="Password" Width="150px" BackColor="#FFFF99" Height="30px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtPwd" ErrorMessage="请输入密码！"></asp:RequiredFieldValidator>
                            </label>
                                  </td>
                        </tr>
                        <tr>
                            <td>
                    <asp:Button class="dark-matter" ID="Button1" runat="server" onclick="Button1_Click" Text="登录" BackColor="#CC9900" Height="40px" Width="158px" />
                            </td>
                           
                        </tr>
           <tr>
                   
                            <td style="text-align: left">
                    <asp:Label class="dark-matter" id="lblMsg" runat="server"></asp:Label> 
                            </td>
                        </tr>
                    </table>
    </div>
    </form>
</body>
</html>
