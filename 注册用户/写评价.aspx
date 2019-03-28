<%@ Page Language="C#" AutoEventWireup="true" CodeFile="写评价.aspx.cs" Inherits="写评价" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
   <link rel="stylesheet" href="../游客/用户.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
         <p class="title">
                线路详情
            </p>
        <div id="线路详情">
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="线路编号" DataSourceID="SqlDataSource1" CssClass="DetailsViewStyle">
                <Fields>
                    <asp:BoundField DataField="线路编号" HeaderText="线路编号" InsertVisible="False" ReadOnly="True" SortExpression="线路编号" />
                    <asp:BoundField DataField="名称" HeaderText="名称" SortExpression="名称" />
                    <asp:BoundField DataField="天数" HeaderText="天数" SortExpression="天数" />
                    <asp:BoundField DataField="线路说明" HeaderText="线路说明" SortExpression="线路说明" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [线路编号], [名称], [天数], [线路说明] FROM [线路] WHERE ([线路编号] = @线路编号)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="线路编号" QueryStringField="线路编号" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    <div>
        <br /> <br />
        <asp:Label ID="Label1" runat="server" Text="评价："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
    <div></div>
        <br /> <br />
        <asp:Label ID="Label2" runat="server" Text="评分（1-10）："></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" Width="80px" ></asp:TextBox>
        <div></div>
        <br /> <br />
        <asp:Button ID="Button1" runat="server" Text="确定" Height="40px" Width="150px" OnClick="ok" />
    </div>
    </form>
</body>
</html>
