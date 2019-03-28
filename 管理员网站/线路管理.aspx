<%@ Page Language="C#" AutoEventWireup="true" CodeFile="线路管理.aspx.cs" Inherits="管理员网站_线路管理" %>

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
            <p class="title">
                商品管理
            </p>
        </div>
        <br /><br />
        <table >
             <tr>
                <td><div>
            <asp:Button CssClass="dark-matter" ID="Button1" runat="server" Text="添加线路" Height="40" Width="150" OnClick="Button1_Click" />
                    <asp:Button CssClass="dark-matter" ID="Button2" runat="server" Text="返回首页" Height="40px" Width="150px" OnClick="Button2_Click" />
        </div></td>
                
            </tr>
            <tr>
                <td><div ><!--按照线路编号列出 -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" CssClass="GridViewStyle" AllowPaging="True" AllowSorting="True" Height="1110px" Width="1200">
            <Columns>
                <asp:BoundField DataField="线路编号" HeaderText="线路编号" SortExpression="线路编号" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
                <asp:BoundField DataField="联系方式" HeaderText="联系方式" SortExpression="联系方式" />
                <asp:BoundField DataField="天数" HeaderText="天数" SortExpression="天数" />
                <asp:BoundField DataField="线路说明" HeaderText="线路说明" SortExpression="线路说明" />
                <asp:BoundField DataField="类别" HeaderText="类别" SortExpression="类别" ReadOnly="True" />
                <asp:BoundField DataField="评分" HeaderText="评分" SortExpression="评分" />
                <asp:BoundField DataField="出发日期" HeaderText="出发日期" SortExpression="出发日期" />
                <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT 线路.线路编号,名称,联系方式,天数,线路说明,CASE WHEN 类别=0 THEN '一日游' WHEN 类别=0 THEN '多日游' ELSE '半自由行' END AS 类别,评分,出发日期,价格 FROM 线路,出行时间 WHERE 线路.线路编号=出行时间.线路编号 ORDER BY 线路.线路编号" DeleteCommand="delete 出行时间 where 线路编号=@线路编号 and 出发日期=@出发日期">
            <DeleteParameters>
                <asp:Parameter Name="线路编号" />
                <asp:Parameter Name="出发日期" />
            </DeleteParameters>
                    </asp:SqlDataSource>
    </div></td>
                
            </tr>
           
           
        </table>

        
    </form>
</body>
</html>