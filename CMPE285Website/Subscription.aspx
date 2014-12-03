<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subscription.aspx.cs" Inherits="CMPE285Website.Subscription" %>

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
  <h2>Subscribe to hospitals at <span style="font-weight:bold; color:#333;">Emerge</span></h2>

    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="dsHospitals" runat="server" ConnectionString="<%$ ConnectionStrings:cmpe285ConnectionString %>" ProviderName="<%$ ConnectionStrings:cmpe285ConnectionString.ProviderName %>" SelectCommand="select HOSPITAL.hid, hname,haddress,hphno,a.score
from cmpe285.HOSPITAL join 
(select hID, avg(score) as `Score` from cmpe285.H_RATING
group by hID) a on (HOSPITAL.hID = a.hID);"></asp:SqlDataSource>
        <asp:GridView ID="gdSubscription" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="hid" DataSourceID="dsHospitals" AllowPaging="True" PageSize="15" CellPadding="1">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chkBox" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="hid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="hid" />
                <asp:BoundField DataField="hname" HeaderText="Hospital" SortExpression="hname" />
                <asp:BoundField DataField="haddress" HeaderText="Address" SortExpression="haddress" />
                <asp:BoundField DataField="hphno" HeaderText="Phone No." SortExpression="hphno" />
                <asp:BoundField DataField="score" HeaderText="Score" SortExpression="score" />
            </Columns>
        </asp:GridView>
    </div>
       
        <asp:Button ID="btnSubscribe" runat="server" OnClick="btnSubscribe_Click" Text="Subscribe" />
    </form>
    </div>
  <div id="col2">
      <br />
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cmpe285ConnectionString %>" ProviderName="<%$ ConnectionStrings:cmpe285ConnectionString.ProviderName %>" SelectCommand="SELECT address as `Name`,lat as `latitude`,`long` as `Longitude` from USER_DETAILS where uid=1
 
union 
SELECT `hName` as `Name`, `hLat` as `Latitude`, `hlong` as `longitude` FROM `cmpe285`.`HOSPITAL` where hLat NOT LIKE '?%'"></asp:SqlDataSource>

      <asp:Repeater ID="rptMarkers" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate><div class="hiddenDiv" style="display:none;">
                    <%#Eval("Name") %>:::<%#Eval("Latitude") %>:::<%#Eval("Longitude") %></div>
</ItemTemplate>
</asp:Repeater>
   <script type="text/javascript">

       var markers = new Array();
       $(".hiddenDiv").each(function (i) {
           var divArr = $(this).text().split(":::");
           var c = new Object();
           c.title = divArr[0];
           c.lat = divArr[1];
           c.lng = divArr[2];
           markers.push(c);
       });
       var image = 'images/icon.png';
</script>
<script type="text/javascript">
    window.onload = function () {
        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            if (i == 0) {
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    icon:image,
                    title: data.title
                });
            }
            else {
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
            }
            (function (marker, data) {
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                });
            })(marker, data);
        }
    }
</script>
     


  <div id="dvMap" style="width: 500px; height: 400px;"></div>

  </div>
    <div id="footer"> &copy; 2014 Team 12 | Created by <a href="#">Abhishek, Harini, Pratyusha, Priyanka</a>  </div>
</body>
</html>
