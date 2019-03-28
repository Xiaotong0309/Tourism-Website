<%@ Page Language="C#" AutoEventWireup="true" CodeFile="收藏.aspx.cs" Inherits="收藏" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 <link rel="stylesheet" href="../游客/用户.css" type="text/css" />
    <style>
        label{
display: block;
margin: 0px 0px 5px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
         <div id="导航" >

            <table style="width:100%;height:40px;border:hidden;margin:0px">
                <tr>
                    <td ><p><a href="../游客/首页.aspx" >首页</a></p></td>
                    <td ><p ><a href="../游客/旅行商城.aspx" >旅行商城</a></p></td>
                    <td ><p ><a href="../游客/目的地.aspx" >目的地</a></p></td>
                    <td style="background-color:goldenrod"><p ><a href="我的.aspx" style="color:white">我的</a></p></td>
                </tr>

            </table>

        </div>
         <div id="图片展示">
         <img alt="" src="image/5.jpg"  width="100%" height="400px"/>
        </div>

         <table style="width:100%;height:100%">
        <tr >
            <td style="width:30%;height:100%">
    <div id="信息" >
    <div id="账户" >

         <p style="font-size:large">我的信息</p>
        <table style="width: 100%;">
            <tr>
                <td>用户名</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td>手机号</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
            <tr>
                <td>积分</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
        </table>
    </div>
        <hr />
        <div id="关注" style="width:100%; height:100%;">
            <p style="font-size:large">我的关注</p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="100%" CssClass="GridViewStyle" DataKeyNames="用户编号">
                <Columns>
                    <asp:BoundField DataField="用户编号" HeaderText="用户编号" SortExpression="用户编号" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" />
                    <asp:HyperLinkField DataNavigateUrlFields="用户编号" DataNavigateUrlFormatString="个人主页.aspx?用户编号={0}" Text="查看主页" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT 用户.用户编号,用户名 FROM 用户 WHERE 用户编号 IN
(SELECT 被关注者编号 FROM 关注 WHERE 关注者编号=@关注者)">
                <SelectParameters>
                    <asp:SessionParameter Name="关注者" SessionField="用户编号" />
                </SelectParameters>
            </asp:SqlDataSource>

    </div>
    </div>
        </td>
            <td>
           <div id="发表" style="float:left; width:100%; height:100%;" >
               <div id="我的导航">
                   <table style="width:100%;height:30px;border:hidden;margin:0px;background-color:gainsboro" >
                <tr>
                    <td ><p><a href="我的.aspx" >我的游记</a></p></td>
                    <td ><p ><a href="订单.aspx" >我的订单</a></p></td>
                    <td style="background-color:goldenrod"><p ><a href="收藏.aspx" style="color:white">我的收藏</a></p></td>
                    <td ><p ><a href="待评价.aspx" >待评价</a></p></td>
                </tr>

            </table>
               </div>
<div id="收藏" >
    <p class="title">收藏游记</p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="游记编号" DataSourceID="SqlDataSource1" Height="100%" style="margin-bottom: 0px" Width="100%" CssClass="GridViewStyle">
        <Columns>
            <asp:BoundField DataField="游记编号" HeaderText="游记编号" InsertVisible="False" ReadOnly="True" SortExpression="游记编号" />
            <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" />
            <asp:BoundField DataField="发表时间" HeaderText="发表时间" SortExpression="发表时间" />
            <asp:BoundField DataField="浏览次数" HeaderText="浏览次数" SortExpression="浏览次数" />
            <asp:BoundField DataField="收藏次数" HeaderText="收藏次数" SortExpression="收藏次数" />
            <asp:HyperLinkField DataNavigateUrlFields="游记编号" DataNavigateUrlFormatString="../游客/游记.aspx?游记编号={0}" Text="查看" />
        </Columns>
        <HeaderStyle CssClass="GridViewHeaderStyle" />
    </asp:GridView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT 游记编号,题目,发表时间,浏览次数,收藏次数 FROM 游记 WHERE 游记编号 IN
(SELECT 游记编号 FROM 游记收藏 WHERE 用户编号=@用户编号)">
                   <SelectParameters>
                       <asp:SessionParameter Name="用户编号" SessionField="用户编号" />
                   </SelectParameters>
    </asp:SqlDataSource>
               </div>
               <p class="title">收藏线路</p>
               <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="线路编号" DataSourceID="SqlDataSource3" Width="100%" CssClass="GridViewStyle">
                   <Columns>
                       <asp:BoundField DataField="线路编号" HeaderText="线路编号" InsertVisible="False" ReadOnly="True" SortExpression="线路编号" />
                       <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
                       <asp:BoundField DataField="天数" HeaderText="天数" SortExpression="天数" />
                       <asp:HyperLinkField DataNavigateUrlFields="线路编号" DataNavigateUrlFormatString="../游客/线路.aspx?线路编号={0}" Text="查看" />
                   </Columns>
                   <HeaderStyle CssClass="GridViewHeaderStyle" />
               </asp:GridView>
    
               <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT 线路编号,名称,天数 FROM 线路 WHERE 线路编号 IN
(SELECT 线路编号 FROM 线路收藏 WHERE 用户编号=@用户编号)">
                   <SelectParameters>
                       <asp:SessionParameter Name="用户编号" SessionField="用户编号" />
                   </SelectParameters>
               </asp:SqlDataSource>
    
    </div>
       </td>
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
