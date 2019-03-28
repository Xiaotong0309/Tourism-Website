<%@ Page Language="C#" AutoEventWireup="true" CodeFile="线路管理详细.aspx.cs" Inherits="管理员网站_线路管理详细" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style>   
        body{text-align:center;}
        a {text-decoration: none;color:black}  
         p{font:600;font-family:迷你简美黑;font-size:xx-large} 
        table{display:block;margin:0 auto;width:500px;height:200px}
    </style> 
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px"></asp:DetailsView>
    </div>
        <br /><br /><br />
        <div>
            <asp:Button ID="Button1" runat="server" Text="删除" Height="40px" Width="150px" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
