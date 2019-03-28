<%@ Page Language="C#" AutoEventWireup="true" CodeFile="首页.aspx.cs" Inherits="header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="用户.css" type="text/css" />
</head>
<body >
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
        <div id="导航" >

            <table style="width:100%;height:40px;border:hidden;margin:0px">
                <tr>
                    <td style="background-color:goldenrod"><p><a href="首页.aspx" style="color:white">首页</a></p></td>
                    <td><p ><a href="旅行商城.aspx" >旅行商城</a></p></td>
                    <td><p ><a href="目的地.aspx" >目的地</a></p></td>
                    <td><p ><a href="../注册用户/我的.aspx" >我的</a></p></td>
                  
                </tr>

            </table>

        </div>
        <hr />
        <div id="图片展示">
         <img alt="" src="image/2.jpg"  width="100%" height="400px"/>
        </div>


        
          
    <table style="width:100%;height:100%">
        <tr>
            <td><div id="游记推荐" style="float:left; width:100%; height:100%; "><!--查找浏览次数最多的游记前10名列出 -->

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="游记编号" DataSourceID="SqlDataSource1" Width="100%" CssClass="GridViewStyle">
                    <Columns>
                        <asp:BoundField DataField="游记编号" HeaderText="游记编号" ReadOnly="True" SortExpression="游记编号" InsertVisible="False" />
                        <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" />
                        <asp:BoundField DataField="发表时间" HeaderText="发表时间" SortExpression="发表时间" />
                        <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数" />
                        <asp:BoundField DataField="收藏次数" HeaderText="收藏次数" SortExpression="收藏次数" />
                        <asp:HyperLinkField DataNavigateUrlFields="游记编号" DataNavigateUrlFormatString="游记.aspx?游记编号={0}" Text="查看" />
                    </Columns>
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [游记编号], [题目], [发表时间], [浏览次数], [收藏次数] FROM [游记] ORDER BY [收藏次数] DESC, [浏览次数] DESC"></asp:SqlDataSource>

        </div></td>
            <td><div id ="商品推荐"  style="float:left; width:100%; height:100%;"><!--查找评分最高的线路前10名列出 -->

                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="线路编号" DataSourceID="SqlDataSource2" Width="100%" CssClass="GridViewStyle">
                      <Columns>
                          <asp:BoundField DataField="线路编号" HeaderText="线路编号" ReadOnly="True" SortExpression="线路编号" InsertVisible="False" />
                          <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
                          <asp:BoundField DataField="天数" HeaderText="天数" SortExpression="天数" />
                          <asp:BoundField DataField="评分" HeaderText="评分" SortExpression="评分" />
                          <asp:HyperLinkField DataNavigateUrlFields="线路编号" DataNavigateUrlFormatString="线路.aspx?线路编号={0}" Text="查看" />
                      </Columns>
                      <HeaderStyle CssClass="GridViewHeaderStyle" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [线路编号], [名称], [天数], [评分] FROM [线路] ORDER BY [评分] DESC"></asp:SqlDataSource>
      </div></td>
        </tr>
    </table>
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
