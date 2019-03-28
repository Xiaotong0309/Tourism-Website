<%@ Page Language="C#" AutoEventWireup="true" CodeFile="旅行商城.aspx.cs" Inherits="旅行商城" %>

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
                <asp:Label ID="Label6" runat="server" Text=" ">
                </asp:Label>
                <asp:Button ID="Button2" runat="server" Text="注销" BackColor="White" BorderColor="White" BorderWidth="0px" ForeColor="#CC9900" OnClick="Button1_Click" />
            </asp:Panel>
           
</div>
         <div id="导航" >

            <table style="width:100%;height:40px;border:hidden;margin:0px">
                <tr>
                    <td ><p><a href="首页.aspx" >首页</a></p></td>
                    <td style="background-color:goldenrod"><p ><a href="旅行商城.aspx" style="color:white">旅行商城</a></p></td>
                    <td><p ><a href="目的地.aspx" >目的地</a></p></td>
                    <td><p ><a href="../注册用户/我的.aspx" >我的</a></p></td>
                </tr>

            </table>

        </div>
        <hr />
         <div id="图片展示">
         <img alt="" src="image/6.jpg"  width=100% height="400px"/>
        </div>
                <hr/>
         
        <div id="选择">

            <asp:Label ID="Label3" runat="server" Text="出发地："></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" Text="目的地："></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

        </div>
        <hr/>
    <div id="筛选">
    <div id="筛选时间">
        <asp:Label ID="Label1" runat="server" Text="出发时间："></asp:Label>
        <asp:CheckBoxList 
            ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" >
            <asp:ListItem Selected="True">不限</asp:ListItem>
            <asp:ListItem >1月</asp:ListItem>
            <asp:ListItem>2月</asp:ListItem>
            <asp:ListItem>3月</asp:ListItem>
            <asp:ListItem >4月</asp:ListItem>
            <asp:ListItem>5月</asp:ListItem>
            <asp:ListItem>6月</asp:ListItem>
            <asp:ListItem >7月</asp:ListItem>
            <asp:ListItem>8月</asp:ListItem>
            <asp:ListItem>9月</asp:ListItem>
            <asp:ListItem >10月</asp:ListItem>
            <asp:ListItem>11月</asp:ListItem>
            <asp:ListItem>12月</asp:ListItem>
        </asp:CheckBoxList>
      
    </div>
        <div id="筛选天数">

            <asp:Label ID="Label2" runat="server" Text="行程天数："></asp:Label>
           <asp:CheckBoxList 
            ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" >
            <asp:ListItem Selected="True">不限</asp:ListItem>
            <asp:ListItem >1天</asp:ListItem>
            <asp:ListItem>2天</asp:ListItem>
            <asp:ListItem>3天</asp:ListItem>
            <asp:ListItem >4天</asp:ListItem>
            <asp:ListItem>5天</asp:ListItem>
            <asp:ListItem>6天</asp:ListItem>
            <asp:ListItem >7天</asp:ListItem>
            <asp:ListItem>8天</asp:ListItem>
            <asp:ListItem>9天</asp:ListItem>
            <asp:ListItem >10天及以上</asp:ListItem>
        </asp:CheckBoxList>
            </div>
        <div id="筛选类型">

            <asp:Label ID="Label5" runat="server" Text="产品类型："></asp:Label>
            <asp:CheckBoxList 
            ID="CheckBoxList3" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True">不限</asp:ListItem>
            <asp:ListItem >一日游</asp:ListItem>
            <asp:ListItem>多日游</asp:ListItem>
            <asp:ListItem>半自由行</asp:ListItem>
                  </asp:CheckBoxList>
        </div>
    </div>
        <hr/>
        <div><asp:Button ID="Button1" runat="server" Text="查找" Height="40" Width="150" OnClick="Button1_Click1" /></div>
        <br /><br />
        <div id="线路列表">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="线路编号" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" Width="100%" CssClass="GridViewStyle" >
                <Columns>
                    <asp:BoundField DataField="线路编号" HeaderText="线路编号" ReadOnly="True" SortExpression="线路编号" />
                    <asp:BoundField DataField="线路名" HeaderText="线路名" SortExpression="线路名" />
                    <asp:BoundField DataField="天数" HeaderText="天数" SortExpression="天数" />
                    <asp:BoundField DataField="线路类型" HeaderText="线路类型" SortExpression="线路类型" ReadOnly="True" />
                    <asp:BoundField DataField="出发月份" HeaderText="出发月份" SortExpression="出发月份" ReadOnly="True" />
                    <asp:BoundField DataField="价格" HeaderText="价格" SortExpression="价格" />
                    <asp:BoundField DataField="出发地" HeaderText="出发地" SortExpression="出发地" />
                    <asp:BoundField DataField="目的地" HeaderText="目的地" SortExpression="目的地" />
                    <asp:BoundField DataField="评分" HeaderText="评分" SortExpression="评分" />
                    <asp:BoundField DataField="销量" HeaderText="销量" SortExpression="销量" />
                    <asp:HyperLinkField DataNavigateUrlFields="线路编号" DataNavigateUrlFormatString="线路.aspx?线路编号={0}" Text="查看" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" />
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT * FROM[线路筛选] " >
            </asp:SqlDataSource>

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
