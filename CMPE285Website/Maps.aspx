<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Maps.aspx.cs" Inherits="CMPE285Website.Maps" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
    <title>Google Map</title>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>

    <script src="Scripts/googlemap.js" type="text/javascript"></script>

    <script src="Scripts/jquery.tablednd.js" type="text/javascript"></script>

</head>
<body>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cmpe285ConnectionString %>" ProviderName="<%$ ConnectionStrings:cmpe285ConnectionString.ProviderName %>" SelectCommand="SELECT address as `Name`,lat as `latitude`,`longitude` as `Longitude` from USER_DETAILS where uid=1
 
union 
SELECT `hName` as `Name`, `hLat` as `Latitude`, `hlong` as `longitude` FROM `cmpe285`.`HOSPITAL` where hLat NOT LIKE '?%'"></asp:SqlDataSource>
    <asp:Repeater ID="rptMarkers" runat="server" DataSourceID="SqlDataSource1" >
        <ItemTemplate><div class="hiddenDiv" style="display:none">
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
        // alert('On load');
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
        InitializeMap(map);
    };
    </script>

    <form id="form1" runat="server">
    <div id="dvMap" style="height: 800px; width: 100%;">
    </div>
    <br />
    
        <asp:HiddenField ID="txtAvgSpeed" runat="server" Value="80" />
    <br />
    <br />
    <div align="left" style="width: 100%;">
        <table id="HtmlTable1" width="80%" border="1" style="border-color: #275D18; text-align: center;"
    cellpadding="3" cellspacing="0">
    <tr style="background-color: #D1E8B0;">
        <td style="width: 80px; color: #275D18; font-weight: bold;">
            Sr No.
        </td>
        <td style="width: 80px; color: #275D18; font-weight: bold;">
            Location Name
        </td>
        <td style="width: 100px; color: #275D18; font-weight: bold;">
            Latitude
        </td>
        <td style="width: 100px; color: #275D18; font-weight: bold;">
            Longitude
        </td>
        <td style="width: 100px; color: #275D18; font-weight: bold;">
            Distance (Meters)
        </td>
        <td style="width: 70px; color: #275D18; font-weight: bold;">
            Time (Minutes)
        </td>
        <td style="width: 60px; color: #275D18; font-weight: bold;">
            Delete
        </td>
    </tr>
</table>
</div>
<div align="left" style="width: 100%;">
    <table id="HtmlTable" width="80%" border="1" style="border-color: #275D18; text-align: center;"
    cellpadding="3" cellspacing="0">
</table>
</div>

<script type="text/javascript" language="javascript">
    
    </script>
    </form>
    
</body>
</html>
