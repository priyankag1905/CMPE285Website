<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CMPE285Website.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="MyStyles.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <a href="Login.aspx">Login.aspx</a><p/>
        <a href="SignUp.aspx">SignUp.aspx</a><p />
        <a href="Subscription.aspx">Subscription.aspx</a><p />
        <a href="Maps.aspx">Maps.aspx</a><p />
        <asp:Button ID="btnHelp" runat="server" Text="Help" OnClick="btnHelp_Click" />
    </div>
    </form>
</body>
</html>
