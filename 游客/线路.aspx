<%@ Page Language="C#" AutoEventWireup="true" CodeFile="线路.aspx.cs" Inherits="线路" %>

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
       <p style="font-size:xx-large">线路详细信息</p>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="线路编号" DataSourceID="SqlDataSource2" CssClass="DetailsViewStyle">
            <Fields>
                <asp:BoundField DataField="线路编号" HeaderText="线路编号" InsertVisible="False" ReadOnly="True" SortExpression="线路编号" />
                <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
                <asp:BoundField DataField="联系方式" HeaderText="联系方式" SortExpression="联系方式" />
                <asp:BoundField DataField="天数" HeaderText="天数" SortExpression="天数" />
                <asp:BoundField DataField="线路说明" HeaderText="线路说明" SortExpression="线路说明" />
                <asp:BoundField DataField="类别" HeaderText="类别" SortExpression="类别" />
                <asp:BoundField DataField="评分" HeaderText="评分" SortExpression="评分" />
                <asp:BoundField DataField="出发地" HeaderText="出发地" SortExpression="出发地" />
            </Fields>
        </asp:DetailsView>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [线路编号], [名称], [联系方式], [天数], [线路说明], [类别], [评分], [出发地] FROM [线路] WHERE ([线路编号] = @线路编号)">
            <SelectParameters>
                <asp:QueryStringParameter Name="线路编号" QueryStringField="线路编号" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
        <hr />
        <div id="评价">
             <p style="font-size:xx-large">线路评价</p>
            <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="100%" CssClass="GridViewStyle">
                <Columns>
                    <asp:BoundField DataField="评分" HeaderText="评分" SortExpression="评分" />
                    <asp:BoundField DataField="内容" HeaderText="内容" SortExpression="内容" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [评分], [内容] FROM [线路评价] WHERE ([线路编号] = @线路编号)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="线路编号" QueryStringField="线路编号" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <hr />
        <div id="选择时间">
            <p style="font-size:xx-large">出行日期及价格</p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="100%" CssClass="GridViewStyle">
                <Columns>
                    <asp:BoundField DataField="出发日期" HeaderText="出发日期" SortExpression="出发日期" />
                    <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [出发日期], [价格] FROM [出行时间] WHERE ([线路编号] = @线路编号)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="线路编号" QueryStringField="线路编号" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="Label7" runat="server" Text="所选时间："></asp:Label>
            <asp:TextBox ID="Text1" runat="server"> </asp:TextBox>
        </div>
        <br />
        <div id="选择人数">

            <asp:Label ID="Label8" runat="server" Text="出行人数："></asp:Label>
           
            <asp:TextBox ID="Text2" runat="server" ></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Button ID="Button2" runat="server" Text="收藏" OnClick="like" BackColor="Silver" ForeColor="Black" Height="40px" Width="100px" />
       
            <asp:Button ID="Button1" runat="server" Text="我要预定" OnClick="order" BackColor="Silver" ForeColor="Black" Height="40px" Width="100px" />
        </div>
    </form>
</body>
</html>
