<%@ Page Language="C#" AutoEventWireup="true" CodeFile="管理.aspx.cs" Inherits="管理" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="stylesheet" href="管理.css" type="text/css" />
</head>
<body class="dark-matter">
    <form id="form1" runat="server" >
        <h1 class="dark-matter">
            <p class="title">
                网站管理
            </p>
       </h1>


<asp:Panel ID="Panel2" runat="server">
<label class="dark-matter">
     
<span class="dark-matter">登录名 :</span>
  <asp:TextBox class="dark-matter" ID="txtUsername" runat="server" MaxLength="20" Width="150px" BackColor="#FFFF99" Height="30px" ></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUsername" ErrorMessage="请填写用户名！"></asp:RequiredFieldValidator>
                       
</label>

<label class="dark-matter">
<span class="dark-matter">密码 :</span>
<asp:TextBox class="dark-matter" ID="txtPwd" runat="server" MaxLength="20" TextMode="Password" Width="150px" BackColor="#FFFF99" Height="30px"></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="txtPwd" ErrorMessage="请输入密码！"></asp:RequiredFieldValidator>
</label>

<label class="dark-matter">
<span class="dark-matter">&nbsp;</span>
<asp:Button class="dark-matter" ID="Button4" runat="server" onclick="Button1_Click" Text="登录"   />
</label>
<asp:Label class="dark-matter" id="lblMsg" runat="server"></asp:Label> 
</asp:Panel>
       
     
        <div>
            <asp:Panel ID="Panel3" runat="server" Visible="False">
            <p style="font-size:medium">
                登录成功！
            </p>
                </asp:Panel>
        </div>
        <br /><br /><br />
        <div>
            <asp:Panel ID="Panel1" runat="server" Visible="False">
    <div>
        <asp:Button class="dark-matter" ID="Button1" runat="server" Text="用户管理"  OnClick="Button1_Click1" />
    </div>
        <br /><br /><br />
        <div>
        <asp:Button class="dark-matter" ID="Button2" runat="server" Text="游记管理"  OnClick="Button2_Click" />
    </div>
         <br /><br /><br />
        <div>
        <asp:Button class="dark-matter" ID="Button3" runat="server" Text="商品管理"  OnClick="Button3_Click" />
    </div>
                <br /><br /><br />
                 <div>
        <asp:Button class="dark-matter" ID="Button5" runat="server" Text="注销"  OnClick="Button5_Click" />
    </div>
                </asp:Panel>
            </div>
    </form>
</body>
</html>
