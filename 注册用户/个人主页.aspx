<%@ Page Language="C#" AutoEventWireup="true" CodeFile="个人主页.aspx.cs" Inherits="注册用户_个人主页" %>

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
                个人主页
            </p>
        </div>
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="GridViewStyle" DataKeyNames="游记编号" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="游记编号" HeaderText="游记编号" InsertVisible="False" ReadOnly="True" SortExpression="游记编号" />
                <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" />
                <asp:BoundField DataField="发表时间" HeaderText="发表时间" SortExpression="发表时间" />
                <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数" />
                <asp:BoundField DataField="收藏次数" HeaderText="收藏次数" SortExpression="收藏次数" />
                <asp:BoundField DataField="发布者" HeaderText="发布者" SortExpression="发布者" />
                <asp:HyperLinkField DataNavigateUrlFields="游记编号" DataNavigateUrlFormatString="../游客/游记.aspx?游记编号={0}" Text="查看" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [游记编号], [题目], [发表时间], [浏览次数], [收藏次数], [发布者] FROM [游记] WHERE ([发布者] = @发布者)">
            <SelectParameters>
                <asp:QueryStringParameter Name="发布者" QueryStringField="用户编号" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
