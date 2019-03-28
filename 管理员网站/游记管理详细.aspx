<%@ Page Language="C#" AutoEventWireup="true" CodeFile="游记管理详细.aspx.cs" Inherits="管理员网站_游记管理详细" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="管理.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <br /><br />
    <div style="margin:0px auto;width:1100px;">

        <asp:DetailsView CssClass="DetailsViewStyle" ID="DetailsView1" runat="server" Height="90%" Width="80%" AutoGenerateRows="False" DataKeyNames="游记编号" DataSourceID="SqlDataSource1">
            <Fields>
                <asp:BoundField DataField="游记编号" HeaderText="游记编号" InsertVisible="False" ReadOnly="True" SortExpression="游记编号" />
                <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" />
                <asp:BoundField DataField="发表时间" HeaderText="发表时间" SortExpression="发表时间" />
                <asp:BoundField DataField="人均花费" HeaderText="人均花费" SortExpression="人均花费" />
                <asp:BoundField DataField="出行时间" HeaderText="出行时间" SortExpression="出行时间" />
                <asp:BoundField DataField="出行人数" HeaderText="出行人数" SortExpression="出行人数" />
                <asp:BoundField DataField="出行方式" HeaderText="出行方式" SortExpression="出行方式" />
                <asp:BoundField DataField="正文" HeaderText="正文" SortExpression="正文" />
                <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数" />
                <asp:BoundField DataField="收藏次数" HeaderText="收藏次数" SortExpression="收藏次数" />
                <asp:BoundField DataField="发布者" HeaderText="发布者" SortExpression="发布者" />
            </Fields>
            
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT * FROM [游记] WHERE ([游记编号] = @游记编号)">
            <SelectParameters>
                <asp:QueryStringParameter Name="游记编号" QueryStringField="游记编号" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
        <br /><br /><br />
        <div>
            <asp:Button  class="dark-matter" ID="Button1" runat="server" Text="删除" Height="40px" Width="150px" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
