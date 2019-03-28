<%@ Page Language="C#" AutoEventWireup="true" CodeFile="线路订单填写.aspx.cs" Inherits="线路订单填写" %>

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
                填写订单
            </p>
        </div>
    <div>
        <asp:Table ID="HolderTable"  runat="server" Width="100%"></asp:Table>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                        RepeatDirection="Horizontal" Height="10px">
                        <asp:ListItem>直接支付</asp:ListItem>
                        <asp:ListItem>积分抵现</asp:ListItem>
                    </asp:RadioButtonList>
        <asp:Button ID="Button1" runat="server" Text="提交" OnClick="order" Height="40px" Width="150px" />
    </div>
    </form>
</body>
</html>
