<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maps.aspx.cs" Inherits="CMPE285Website.Maps" %>
<!DOCTYPE html>

<html> 

<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <!DOCTYPE html>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.js"></script>

</head> 
<body> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cmpe285ConnectionString %>" ProviderName="<%$ ConnectionStrings:cmpe285ConnectionString.ProviderName %>" SelectCommand="SELECT `hName` as `Name`, `hLat` as `Latitude`, `hlong` as `longitude`, `haddress` as `description` FROM `cmpe285`.`HOSPITAL` where hLat NOT LIKE '?%'"></asp:SqlDataSource>
    <asp:Repeater ID="rptMarkers" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate><div class="hiddenDiv">
                    <%#Eval("Name") %>:::<%#Eval("Latitude") %>:::<%#Eval("Longitude") %></div>
</ItemTemplate>
</asp:Repeater>
   <script type="text/javascript">

       var markers = new Array();
       alert($(".hiddenDiv").text());
       $(".hiddenDiv").each(function (i) {
           var divArr = $(this).text().split(":::");
           var c = new Object();
           c.title = divArr[0];
           c.lat = divArr[1];
           c.lng = divArr[2];
           markers.push(c);
       });
</script>
<script type="text/javascript">
    window.onload = function () {
        alert('On load');
        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        alert(markers.length);
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title
            });
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

  
</body>
</html>