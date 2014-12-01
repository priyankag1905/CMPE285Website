<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CMPE285Website.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td><asp:Label ID="lblemail" runat="server" Text="Email Id:"></asp:Label></td>
            <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label></td>
            <td><asp:TextBox ID="txtPassword"  runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label></td>
            <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label></td>
            <td><asp:TextBox ID="txtLastName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPhno" runat="server" Text="Phone no.:"></asp:Label></td>
            <td><asp:TextBox ID="txtPhNo" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label></td>
            <td><asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
        </tr>
        </table>
        <table>
        <tr><td colspan="2">Emergency contact</td></tr>
        <tr>
            <td><asp:Label ID="lblEName" runat="server" Text="Name:"></asp:Label></td>
            <td><asp:TextBox ID="txtEName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPhNo" runat="server" Text="Phone No.:"></asp:Label></td>
            <td><asp:TextBox ID="txtEPhNo" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblEEmail" runat="server" Text="Email Id:"></asp:Label></td>
            <td><asp:TextBox ID="txtEEmail" runat="server"></asp:TextBox></td>
        </tr>
    </table>
        <asp:Button ID="btnSignUp" runat="server" Text="Button" OnClick="btnSignUp_Click" />
        <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
