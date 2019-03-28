<%@ Page Language="C#" AutoEventWireup="true" CodeFile="目的地详细.aspx.cs" Inherits="目的地详细" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="用户.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
         <div id="导航" >

            <table style="width:100%;height:40px;border:hidden;margin:0px;">
                <tr>
                    <td ><p><a href="../游客/首页.aspx" >首页</a></p></td>
                    <td><p ><a href="../游客/旅行商城.aspx" >旅行商城</a></p></td>
                    <td><p ><a href="../游客/目的地.aspx" >目的地</a></p></td>
                    <td><p ><a href="../注册用户/我的.aspx" >我的</a></p></td>
                  
                </tr>

            </table>
             <hr />
                  </div>
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="目的地编号" DataSourceID="SqlDataSource1" CssClass="DetailsViewStyle">
                <Fields>
                    <asp:BoundField DataField="目的地编号" HeaderText="目的地编号" InsertVisible="False" ReadOnly="True" SortExpression="目的地编号" />
                    <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
                    <asp:BoundField DataField="攻略" HeaderText="攻略" SortExpression="攻略" />
                    <asp:BoundField DataField="排名" HeaderText="排名" SortExpression="排名" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [目的地编号], [名称], [攻略], [排名] FROM [目的地] WHERE ([目的地编号] = @目的地编号)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="目的地编号" QueryStringField="目的地编号" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    <div >
        <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="目的地编号" DataSourceID="SqlDataSource2" CssClass="DetailsViewStyle">
            <Fields>
                <asp:BoundField DataField="目的地编号" HeaderText="目的地编号" InsertVisible="False" ReadOnly="True" SortExpression="目的地编号" />
                <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
                <asp:BoundField DataField="攻略" HeaderText="攻略" SortExpression="攻略" />
                <asp:BoundField DataField="排名" HeaderText="排名" SortExpression="排名" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [目的地编号], [名称], [攻略], [排名] FROM [目的地] WHERE ([目的地编号] = @目的地编号)">
            <SelectParameters>
                <asp:QueryStringParameter Name="目的地编号" QueryStringField="从属目的地" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
       <div>
           <asp:Button ID="Button1" runat="server" Text="相关游记" OnClick="Button1_Click" Height="40px" Width="150px"/>
       </div>
    </form>
</body>
</html>
