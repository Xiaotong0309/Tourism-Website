<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td> <div>
       
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />
         <asp:Table ID="Table1" runat="server"></asp:Table>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    </div></td>
                
            </tr>
            <tr>
                <td> <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" />
            
            <asp:Table ID="Table2" runat="server"></asp:Table>
            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></td>
                
            </tr>
           
        </table>
   

        <div>
            <asp:RadioButtonList 
            ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Selected="True">A</asp:ListItem>
            <asp:ListItem>B</asp:ListItem>
                <asp:ListItem>C</asp:ListItem>
        </asp:RadioButtonList>
            <asp:Button ID="Button4" runat="server" Text="Button" OnClick="Button4_Click" />
            <asp:Label ID="Label9" runat="server" Text=" "></asp:Label>
        </div>

    </form>
</body>
</html>

