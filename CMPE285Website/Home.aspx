<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CMPE285Website.Home" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
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
  <h2>Welcome to <span style="font-weight:bold; color:#333;">Emerge</span>, Your Saviour</h2>
  <p>Be prepared for Emergencies by registering at Emerge. It will get help to you, guide you to the nearest hospital and notify your subscribed hospital.</p>
    <div runat="server" id="loggedIn">
  <div class='box'>
    <div class='boxtop'>
      <div></div>
    </div>
      <!--
    <div class='boxcontent'>
      <blockquote>This page has been tested in Mozilla and IE7. The page validates as XHTML 1.0 Transitional using valid CSS. For more FREE CSS templates visit <a href="http://www.mitchinson.net" title="my website">my website</a>.</blockquote>
    </div>
    <div class='boxbottom'>
      <div></div>
    </div>-->
  </div>
  <!--<p>Corner images from <a href="http://wigflip.com/cornershop/">Cornershop</a></p>-->
  <h2>Your Account</h2>
    <asp:Repeater ID="rptUserDetails" runat="server">
         <ItemTemplate>
             <div class="repeater">
                    Name:   <%#Eval("fName") %> <%#Eval("lName") %><br />
                    Email:  <%#Eval("emailID") %> <br />
                    Ph.:    <%#Eval("phNo") %><br />
                    Address:<%#Eval("address") %><br />
             </div>
         </ItemTemplate>
    </asp:Repeater>
        <br />
    <div class='box'>
    <div class='boxtop'>
      <div></div>
    </div>
      <!--
    <div class='boxcontent'>
      <blockquote>This page has been tested in Mozilla and IE7. The page validates as XHTML 1.0 Transitional using valid CSS. For more FREE CSS templates visit <a href="http://www.mitchinson.net" title="my website">my website</a>.</blockquote>
    </div>
    <div class='boxbottom'>
      <div></div>
    </div>-->
  </div>
  <!--<p>Corner images from <a href="http://wigflip.com/cornershop/">Cornershop</a></p>-->
  <h2>Your EMERGENCY CONTACT</h2>
  <asp:Repeater ID="rptEmergency" runat="server">
      <ItemTemplate>
             <div class="repeater">
                    Name:   <%#Eval("eName") %><br />
                    Email:  <%#Eval("eEmailID") %> <br />
                    Ph.:    <%#Eval("ePhNo") %><br />
             </div>
         </ItemTemplate>
  </asp:Repeater>
        <br />
    <div class='box'>
    <div class='boxtop'>
      <div></div>
    </div>
      <!--
    <div class='boxcontent'>
      <blockquote>This page has been tested in Mozilla and IE7. The page validates as XHTML 1.0 Transitional using valid CSS. For more FREE CSS templates visit <a href="http://www.mitchinson.net" title="my website">my website</a>.</blockquote>
    </div>
    <div class='boxbottom'>
      <div></div>
    </div>-->
  </div>
  <!--<p>Corner images from <a href="http://wigflip.com/cornershop/">Cornershop</a></p>-->
  <h2>Your Subscriptions</h2>
    <asp:GridView ID="grdSubscriptions" runat="server" AutoGenerateColumns="true">

    </asp:GridView>
        <br />
        </div>
</div>
<div id="col2">
  <div class='box'>
    <div class='boxtop'>
      <div></div>
    </div>
    <div class='boxcontent'>
      <h3>Notify Contact</h3>
      <p>
          <asp:ImageButton ID="btnNotifyEContact" runat="server" ImageUrl="images/mail.png" AlternateText="Notify Contact" ToolTip="Emergency Contact" OnClick="btnNotifyEContact_Click" /></p>
    </div>
    <div class='boxbottom'>
      <div></div>
    </div>
  </div>
  <!--<p><a href="#">Read Articles</a></p>-->
    <p></p>
  <div class='box'>
    <div class='boxtop'>
      <div></div>
    </div>
    <div class='boxcontent'>
      <h3>Hospital Guide</h3>
     <p>
         <asp:ImageButton ID="btnHospitalGuide" runat="server" ImageUrl="images/docs.png" AlternateText="Hospital Guide" ToolTip="Guide to nearby hospitals" OnClick="btnHospitalGuide_Click" /></p>
    </div>
    <div class='boxbottom'>
      <div></div>
    </div>
  </div>
  <!--<p><a href="#">Link to Resources</a></p>-->
    <p></p>
</div>
<div id="col3">
  <div class='box'>
    <div class='boxtop'>
      <div></div>
    </div>
    <div class='boxcontent'>
        <h3>Notify Hospitals</h3>
      <p><asp:ImageButton ID="btnNotifyHospital" runat="server" ImageUrl="images/mail.png" AlternateText="Notify Hospital" ToolTip="email the hospital" OnClick="btnNotifyHospital_Click" /></p>
    </div>
    <div class='boxbottom'>
      <div></div>
    </div>
  </div>
    <p></p>
  <!--<p><a href="#">Photo Gallery</a></p>-->
  <div class='box'>
    <div class='boxtop'>
      <div></div>
    </div>
    <div class='boxcontent'>
      <h3>MEDICAL INFO</h3>
              <p><asp:ImageButton ID="btnMedicalInfo" runat="server" ImageUrl="images/docs.png" AlternateText="Get Medical Information" ToolTip="Get Medical Info" OnClick="btnMedicalInfo_Click" /></p>
    </div>
    <div class='boxbottom'>
      <div></div>
    </div>
  </div>
    <p></p>
  <!--<p><a href="#">Contact us</a></p>-->
  
  <!--<p>The above images are my attempt at creating web icons.</p>-->
</div>
<div id="footer"> &copy; 2014 Team 12 | Created by 2 | Created by <a href="#">Abhishek, Harini, Pratyusha, Priyanka</a>  </div>
</form>
</body>
</html>
