<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CMPE285Website.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="MyStyles.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>Email ID:</td><td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox> </td>
        </tr>
        <tr>
            <td>Password:</td><td>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox> </td>
        </tr>
    </table>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
