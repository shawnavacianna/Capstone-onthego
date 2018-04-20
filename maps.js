	<link href="maps.css" type="text/css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>	
    <script src="//code.jquery.com/yqlgeo.js"></script>
<script>
    function initMap(){
        var bounds = new google.maps.LatLngBounds;
        var markersArray = [];
        
        function location1(){
          var lattaxi = 17.991172;
          return lattaxi;
        }
        function location2(){
          var lngtaxi = 0 - 76.87005669999999;
          return lngtaxi;
        }
        function location3(){
          var latclient = 18.002985;
          return latclient;
        }
        function location4(){
          var lngclient = 0 -76.7470189;
          return lngclient;
        }

        var taxilocation1 = {lat: location1(), lng: location2()};
        var taxilocation2 = 'Emancipation Park, Jamaica';
 //       var clientlocation1 = 'Trench Town, Jamaica';
        var clientlocation2 = {lat: location3(), lng: location4()};

        var destinationIcon = 'https://chart.googleapis.com/chart?' +
            'chst=d_map_pin_letter&chld=D|FF0000|000000';
        var originIcon = 'https://chart.googleapis.com/chart?' +
            'chst=d_map_pin_letter&chld=O|FFFF00|000000';
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: location3(), lng: location4()},
          zoom: 10
        });
        var geocoder = new google.maps.Geocoder;

        var service = new google.maps.DistanceMatrixService;
        service.getDistanceMatrix({
          origins: [taxilocation1,taxilocation2],
          destinations: [clientlocation2],
          travelMode: 'DRIVING',
          unitSystem: google.maps.UnitSystem.METRIC,
          avoidHighways: false,
          avoidTolls: false
        }, function(response, status) {
          if (status !== 'OK') {
            alert('Error was: ' + status);
          } else {
            var originList = response.originAddresses;
            var destinationList = response.destinationAddresses;
            var outputDiv = document.getElementById('output');
            outputDiv.innerHTML = '';
            deleteMarkers(markersArray);

            var showGeocodedAddressOnMap = function(asDestination) {
              var icon = asDestination ? destinationIcon : originIcon;
              return function(results, status) {
                if (status === 'OK') {
                  map.fitBounds(bounds.extend(results[0].geometry.location));
                  markersArray.push(new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    icon: icon
                  }));
                } else {
                  alert('Geocode was not successful due to: ' + status);
                }
              };
            };

            for (var i = 0; i < originList.length; i++) {
              var results = response.rows[i].elements;
              geocoder.geocode({'address': originList[i]},
                  showGeocodedAddressOnMap(false));
              for (var j = 0; j < results.length; j++) {
                geocoder.geocode({'address': destinationList[j]},
                    showGeocodedAddressOnMap(true));
                outputDiv.innerHTML += 'Your Location:  ' + destinationList[j] + '</br>' + 'Taxi Location: ' + originList[i] + '</br>' +
                    'Distance: ' + results[j].distance.text + ' Estimated Time of Arrival: ' +
                    results[j].duration.text + '</br>' + '</br>';
              }
            }
          }
        });
      }

      function deleteMarkers(markersArray) {
        for (var i = 0; i < markersArray.length; i++) {
          markersArray[i].setMap(null);
        }
        markersArray = [];
      }
 </script> 
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6tUYIw7q-gJN1P7G6HD4TpvNIhOtEEmg
&callback=initMap">
</script>