<%@ Page Language="C#" AutoEventWireup="true" CodeFile="用户管理.aspx.cs" Inherits="管理员网站_用户管理" %>

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
             <h1 class="dark-matter">
            <p class="title">
                用户管理
            </p>
                 </h1>
        </div>
        <br /><br />
        <label class="dark-matter">
    <span class="dark-matter">用户量 :</span>
        <asp:Label class="dark-matter" ID="Label2" runat="server" ></asp:Label>
   </label>
        <br /><br />
        <div>
           <asp:Label class="dark-matter" ID="Label3" runat="server" Text="优质用户："></asp:Label>
            <asp:Label class="dark-matter" ID="Label1" runat="server" ></asp:Label>
        </div>
        <br /><br />
        <div class="cent"><!--按积分排序 -->
          <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" align="center"  CssClass="GridViewStyle" AllowPaging="True" AllowSorting="True" DataKeyNames="用户编号" >
                <Columns>
                    <asp:BoundField DataField="用户编号" HeaderText="用户编号" SortExpression="用户编号" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" />
                    <asp:BoundField DataField="手机号" HeaderText="手机号" SortExpression="手机号" />
                    <asp:BoundField DataField="积分" HeaderText="积分" SortExpression="积分" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [用户编号], [用户名], [手机号], [积分] FROM [用户] ORDER BY [积分] DESC"></asp:SqlDataSource>
       
            </div>
        <br />
        <div>
            <asp:Button CssClass="dark-matter" ID="Button2" runat="server" Text="返回首页" Height="40px" Width="150px" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>