<%@ Page Language="C#" AutoEventWireup="true" CodeFile="游记列表.aspx.cs" Inherits="游记列表" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="用户.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="游记编号" DataSourceID="SqlDataSource1" Height="100%" Width="100%" CssClass="GridViewStyle">
            <Columns>
                <asp:BoundField DataField="游记编号" HeaderText="游记编号" InsertVisible="False" ReadOnly="True" SortExpression="游记编号" />
                <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" />
                <asp:BoundField DataField="发表时间" HeaderText="发表时间" SortExpression="发表时间" />
                <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数" />
                <asp:BoundField DataField="收藏次数" HeaderText="收藏次数" SortExpression="收藏次数" />
                <asp:HyperLinkField DataNavigateUrlFields="游记编号" DataNavigateUrlFormatString="游记.aspx?游记编号={0}" Text="查看" />
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT 游记.游记编号, 题目, 发表时间, 浏览次数, 收藏次数 
FROM [游记],游记目的地 
WHERE [目的地编号] = @目的地编号 AND 游记.游记编号=游记目的地.游记编号">
            <SelectParameters>
                <asp:QueryStringParameter Name="目的地编号" QueryStringField="a" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
