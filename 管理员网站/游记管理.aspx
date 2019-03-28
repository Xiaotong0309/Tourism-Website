<%@ Page Language="C#" AutoEventWireup="true" CodeFile="游记管理.aspx.cs" Inherits="游记管理" %>

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
                游记管理
            </p>
        </div>
        <br /><br />
        <table style="width: 100%;">
            <tr>
                <td><div>
            <asp:Button CssClass="dark-matter" ID="Button2" runat="server" Text="返回首页" Height="40px" Width="150px" OnClick="Button2_Click" />
        </div></td>
               
            </tr>
            <tr>
                <td><div class="cent"><!--按照发布时间由后到前列出 -->
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="游记编号" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" CssClass="GridViewStyle"  height="300px" Width="1105px" >
            <Columns>
                <asp:BoundField DataField="游记编号" HeaderText="游记编号" InsertVisible="False" ReadOnly="True" SortExpression="游记编号" />
                <asp:BoundField DataField="题目" HeaderText="题目" SortExpression="题目" />
                <asp:BoundField DataField="发表时间" HeaderText="发表时间" SortExpression="发表时间" />
                <asp:BoundField DataField="发布者" HeaderText="发布者" SortExpression="发布者" />
                <asp:HyperLinkField DataNavigateUrlFields="游记编号" DataNavigateUrlFormatString="游记管理详细.aspx?游记编号={0}" Text="查看" />
                 
                <asp:CommandField ShowDeleteButton="True" />
                 
            </Columns>

           <EmptyDataTemplate>
                <asp:Button ID="Button1" runat="server" Text="删除" CommandName="Delete" CommandArgument='<%#Bind("游记编号") %>' />
            </EmptyDataTemplate>

            <HeaderStyle CssClass="GridViewHeaderStyle" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TravelConnectionString %>" SelectCommand="SELECT [游记编号], [题目], [发表时间], [发布者] FROM [游记]" OnDeleted="SqlDataSource1_Deleted">
        </asp:SqlDataSource>
    </div></td>
                
            </tr>
           
        </table>
    
        
    </form>
</body>
</html>
