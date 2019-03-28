<%@ Page Language="C#" AutoEventWireup="true" CodeFile="待评价.aspx.cs" Inherits="待评价" %>

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
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" CssClass="GridViewStyle" DataKeyNames="用户编号">
                <Columns>
                    <asp:BoundField DataField="用户编号" HeaderText="用户编号" SortExpression="用户编号" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="用户名" HeaderText="用户名" SortExpression="用户名" />
                    <asp:HyperLinkField DataNavigateUrlFields="用户编号" DataNavigateUrlFormatString="个人主页.aspx?用户编号={0}" Text="查看主页" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT 用户.用户编号,用户名 FROM 用户 WHERE 用户编号 IN
(SELECT 被关注者编号 FROM 关注 WHERE 关注者编号=@关注者)">
                <SelectParameters>
                    <asp:SessionParameter Name="关注者" SessionField="用户编号" />
                </SelectParameters>
            </asp:SqlDataSource>

    </div>
    </div>
        </td>
            <td>
           <div id="发表" style="float:left; width:100%; height:100%; background:#FFFFFF;">
               <div id="我的导航">
                   <table style="width:100%;height:30px;border:hidden;margin:0px;background-color:gainsboro" >
                <tr>
                    <td ><p><a href="我的.aspx" >我的游记</a></p></td>
                    <td ><p ><a href="订单.aspx" >我的订单</a></p></td>
                    <td ><p ><a href="收藏.aspx" >我的收藏</a></p></td>
                    <td style="background-color:goldenrod"><p ><a href="待评价.aspx" style="color:white">待评价</a></p></td>
                </tr>

            </table>
               </div>
<div id="订单">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="线路编号" DataSourceID="SqlDataSource2" Width="100%" CssClass="GridViewStyle">
        <Columns>
            <asp:BoundField DataField="线路编号" HeaderText="线路编号" InsertVisible="False" ReadOnly="True" SortExpression="线路编号" />
            <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
            <asp:HyperLinkField DataNavigateUrlFields="线路编号" DataNavigateUrlFormatString="写评价.aspx?线路编号={0}" Text="前往" />
        </Columns>
        <HeaderStyle CssClass="GridViewHeaderStyle" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT 线路.线路编号,名称
FROM 线路,用户,预定线路
WHERE  线路.线路编号=预定线路.线路编号 AND 预定线路.用户编号=用户.用户编号 AND 用户.用户编号=@用户编号 AND 线路.线路编号 NOT IN(
SELECT 线路编号 FROM 线路评价 WHERE 用户编号=用户.用户编号
)">
        <SelectParameters>
            <asp:SessionParameter Name="用户编号" SessionField="用户编号" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--对应用户名，线路评价表中没有但线路预定表中有的线路 -->
               </div>
    
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

