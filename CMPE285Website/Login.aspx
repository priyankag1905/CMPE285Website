<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CMPE285Website.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emerge</title>
    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
   <form runat="server">
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
<div id="col1">
  <h2>Login to <span style="font-weight:bold; color:#333;">Emerge</span></h2>
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
      <div id="footer"> &copy; 2014 Team 12 | Created by <a href="#">Abhishek, Harini, Pratyusha, Priyanka</a>  </div>
</body>
</html>
