<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CMPE285Website.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Emerge</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
    </head>
<body>
<div id="header">
  <ul id="menu">
    <li class="menupadding"><a href="Home.aspx">Home</a></li>
      <li class="menupadding"><a href="Login.aspx">Login</a></li>
    <li class="menupadding"><a href="SignUp.aspx">SignUp</a></li>
    <li class="menupadding"><a href="Subscription.aspx">Subscription</a></li>
    <li class="menupadding"><a href="Maps.aspx">Maps</a></li>
    <li class="menupadding"><a href="#">Contact</a></li>
  </ul>
  <h1><span style="color: #CCCC9A;font-size:40px"> Emerge</span> </h1>
</div>
<div id="gutter"></div>
    <form id="form1" runat="server">
<div id="col1">
  <h2>Sign up for <span style="font-weight:bold; color:#333;">Emerge</span></h2>

    
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
            <td><asp:Label ID="lblEPhNo" runat="server" Text="Phone No.:"></asp:Label></td>
            <td><asp:TextBox ID="txtEPhNo" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblEEmail" runat="server" Text="Email Id:"></asp:Label></td>
            <td><asp:TextBox ID="txtEEmail" runat="server"></asp:TextBox></td>
        </tr>
    </table>
        <table>
        <tr><td colspan="2">Medical Information</td></tr>
        <tr>
            <td><asp:Label ID="lblBgrp" runat="server" Text="Blood Group"></asp:Label></td>
            <td><asp:TextBox ID="txtBgrp" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblAllergies" runat="server" Text="Allergies:"></asp:Label></td>
            <td><asp:TextBox ID="txtAllergies" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblIProvider" runat="server" Text="Insurance Provider:"></asp:Label></td>
            <td><asp:TextBox ID="txtIProvider" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblIId" runat="server" Text="Insurance ID:"></asp:Label></td>
            <td><asp:TextBox ID="txtIId" runat="server"></asp:TextBox></td>
        </tr>
    </table>
        <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
        <asp:Label ID="lblMessage" ForeColor="Red" runat="server" Text=""></asp:Label>
    </div>
        </div>
<div id="footer"> &copy; 2014 Team 12 | Created by <a href="#">Abhishek, Harini, Pratyusha, Priyanka</a>  </div>
    </form>
</body>
</html>
