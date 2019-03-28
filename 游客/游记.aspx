<%@ Page Language="C#" AutoEventWireup="true" CodeFile="游记.aspx.cs" Inherits="游记" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="用户.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:right" id="验证">
            <asp:Panel ID="Panel1" runat="server">
                <p ><a href="登录.aspx" >登录</a>|<a href="注册.aspx" >注册</a></p>
                 </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <asp:Label ID="Label6" runat="server" Text=" ">
                </asp:Label>
            </asp:Panel>
</div>
         <div id="导航" >

            <table style="width:100%;height:40px;border:hidden;margin:0px;">
                <tr>
                    <td ><p><a href="首页.aspx" >首页</a></p></td>
                    <td><p ><a href="旅行商城.aspx" >旅行商城</a></p></td>
                    <td><p ><a href="目的地.aspx" >目的地</a></p></td>
                    <td><p ><a href="../注册用户/我的.aspx" >我的</a></p></td>
                  
                </tr>

            </table>
             <hr />

        </div>
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" Height="100%" Width="100%" AutoGenerateRows="False" DataKeyNames="游记编号" DataSourceID="SqlDataSource1" CssClass="DetailsViewStyle">
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
                <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" />
            </Fields>
        </asp:DetailsView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [游记编号], [题目], [发表时间], [人均花费], [出行时间], [出行人数], [出行方式], [正文], [浏览次数], [收藏次数] ,用户名 FROM [游记],用户 WHERE ([游记编号] = @游记编号) AND 用户编号=发布者">
            <SelectParameters>
                <asp:QueryStringParameter Name="游记编号" QueryStringField="游记编号" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
        <div>
            <asp:Panel ID="Panel3" runat="server"><asp:Button ID="Button2" runat="server" BackColor="Silver" Height="40px" OnClick="Button2_Click" Text="关注作者" Width="100px" />
          <asp:Button ID="Button1" runat="server" Text="收藏" OnClick="like" BackColor="Silver" ForeColor="Black" Height="40px" Width="100px" />
                 
                 </asp:Panel>
              </div>
    </form>
</body>
</html>
