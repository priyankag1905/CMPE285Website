<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalInfo.aspx.cs" Inherits="CMPE285Website.MedicalInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Emerge</title>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.js"></script>

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
<div id="col1">
  <h2>Medical Information</h2>

    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="dsMedicalInfo" runat="server" ConnectionString="<%$ ConnectionStrings:cmpe285ConnectionString %>" ProviderName="<%$ ConnectionStrings:cmpe285ConnectionString.ProviderName %>" SelectCommand="SELECT bGrp, allergies, insPvdr, insID FROM MEDICAL_ER WHERE (uID = @uid)">
            <SelectParameters>
                <asp:SessionParameter Name="uid" SessionField="userid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
       
      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsMedicalInfo">
        <ItemTemplate><div class="hiddenDiv"">
                    Blood Group: <%#Eval("bGrp") %><br />
                    Allergies: <%#Eval("allergies") %><br />
                    Insurance Provider: <%#Eval("insPvdr") %><br />
                    Insurance ID: <%#Eval("insID") %></div>
        </ItemTemplate>
    </asp:Repeater>
  
    </div>
       
      
        </form>
  </div>
    
    <div id="footer"> &copy; 2014 Team 12 | Created by <a href="#">Abhishek, Harini, Pratyusha, Priyanka</a>  </div>
    
</body>
</html>
