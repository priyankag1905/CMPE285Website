﻿<!DOCTYPE html>
<html> 
<head> 
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" /> 
  <title>Google Maps Multiple Markers</title> 
  <script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>

  <script type="text/javascript">

      var map;

      // Cretes the map
      function initialize() {
          map = new google.maps.Map(document.getElementById('map'), {
              zoom: 10,
              center: new google.maps.LatLng(-33.92, 151.25),
              mapTypeId: google.maps.MapTypeId.ROADMAP
          });
      }

      // This function takes an array argument containing a list of marker data
      function generateMarkers(locations) {
          for (var i = 0; i < locations.length; i++) {
              new google.maps.Marker({
                  position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                  map: map,
                  title: locations[i][0]
              });
          }
      }
  </script>

</head> 
<body> 
  <div id="map" style="width: 500px; height: 400px;"></div>

  <script type="text/javascript">
      window.onload = function () {
          initialize();
          generateMarkers(
            ['Bondi Beach', -33.890542, 151.274856],
            ['Coogee Beach', -33.923036, 151.259052],
            ['Cronulla Beach', -34.028249, 151.157507],
            ['Manly Beach', -33.800101, 151.287478],
            ['Maroubra Beach', -33.950198, 151.259302]
          );
      };
  </script>
</body>
</html>