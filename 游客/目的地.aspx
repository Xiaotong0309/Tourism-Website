<%@ Page Language="C#" AutoEventWireup="true" CodeFile="目的地.aspx.cs" Inherits="_Default" %>

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
            <asp:Panel ID="Panel2" runat="server" Visible="False">
                <asp:Label ID="Label1" runat="server" Text=" ">
                </asp:Label>
                <asp:Button ID="Button1" runat="server" Text="注销" BackColor="White" BorderColor="White" BorderWidth="0px" ForeColor="#CC9900" OnClick="Button1_Click" />
            </asp:Panel>
           
</div>
         <div id="导航" style="a">

            <table style="width:100%;height:40px;border:hidden;margin:0px">
                <tr>
                    <td ><p><a href="首页.aspx" >首页</a></p></td>
                    <td ><p ><a href="旅行商城.aspx" >旅行商城</a></p></td>
                    <td style="background-color:goldenrod"><p ><a href="目的地.aspx" style="color:white">目的地</a></p></td>
                    <td><p ><a href="../注册用户/我的.aspx" >我的</a></p></td>
                </tr>

            </table>

        </div>
        <hr />
                <div id="图片展示">
         <img alt="" src="image/4.jpg"  width="100%" height="400px"/>
        </div>
    <div id="热门目的地"><!--查找每个国家目的地排名前5名列出 -->
        <p style="font-size:x-large">热门目的地</p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" CssClass="GridViewStyle">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="从属目的地" DataNavigateUrlFormatString="目的地详细.aspx?目的地详细={0}" DataTextField="国家" HeaderText="国家" />
                <asp:HyperLinkField DataNavigateUrlFields="目的地编号" DataNavigateUrlFormatString="目的地详细.aspx?目的地编号={0}" DataTextField="城市" HeaderText="城市" />
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT * FROM [热门目的地] ORDER BY [从属目的地]"></asp:SqlDataSource>
    </div>
 <div id="当季精选" style="background-color:#efeeee"><!--查找游记目的地表与游记表每月最多的出行目的地前5名列出 -->
        <p style="font-size:x-large">
            当季精选      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%" CssClass="GridViewStyle">
                <Columns>
                    <asp:BoundField DataField="月份" HeaderText="月份" SortExpression="月份" />
                    <asp:HyperLinkField DataNavigateUrlFields="从属目的地" DataNavigateUrlFormatString="目的地详细.aspx?从属目的地={0}" DataTextField="国家" HeaderText="国家" />
                    <asp:HyperLinkField DataNavigateUrlFields="目的地编号" DataNavigateUrlFormatString="目的地详细.aspx?目的地编号={0}" DataTextField="城市" HeaderText="城市" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
        </asp:GridView>
    
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [月份], [国家], [城市], [目的地编号], [从属目的地] FROM [当季精选] ORDER BY [月份], [提及数] DESC"></asp:SqlDataSource>
    
    </div>
        <div id="主题精选"><!--查找游记目的地表与游记表每种出行类别最多的出行目的地前5名列出 -->
        <p style="font-size:x-large">主题精选</p>
    
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="100%" CssClass="GridViewStyle">
            <Columns>
                <asp:BoundField DataField="出行方式" HeaderText="出行方式" SortExpression="出行方式" />
                <asp:HyperLinkField DataNavigateUrlFields="从属目的地" DataNavigateUrlFormatString="目的地详细.aspx?从属目的地={0}" DataTextField="国家" HeaderText="国家" />
                <asp:HyperLinkField DataNavigateUrlFields="目的地编号" DataNavigateUrlFormatString="目的地详细.aspx?目的地编号={0}" DataTextField="城市" HeaderText="城市" />
            </Columns>
            <HeaderStyle CssClass="GridViewHeaderStyle" />
        </asp:GridView>
    
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [出行方式], [国家], [城市], [目的地编号], [从属目的地] FROM [主题精选] ORDER BY [出行方式], [提及数] DESC"></asp:SqlDataSource>
    
    </div>
         <div id="关于" style="width:100%; height:100px;background-color:#41413f; ">
             <p style="color:white">
			Copyright &copy; &nbsp;&nbsp;2008-2013&nbsp; 
			某某科技有限公司 ALL RIGHT RESERVED<br/>
			联系方式：moumou@gmail.com<br/>
			ICP:湘ICP备05021949</p>
        </div>
    </form>
</body>
</html>
