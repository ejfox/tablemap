// Generated by CoffeeScript 1.3.3
var geocodeLocation, locations, makeMap, tableMap, test;

test = 0;

locations = [];

tableMap = function(gdoc) {
  console.log(gdoc);
  locations = gdoc;
  return makeMap(locations);
};

geocodeLocation = function(location) {};

makeMap = function(locations) {
  var layer, map;
  layer = new L.StamenTileLayer("toner");
  map = new L.Map("map", {
    center: new L.LatLng(37.8, -122.4),
    zoom: 10
  });
  map.addLayer(layer);
  console.log("location count", locations);
  _.each(locations, function(location, i) {
    var locationHtml;
    console.log("LOCATION", location);
    locationHtml = ich.locationItemLi(location);
    console.log("Location=>", location, "HTML=>", $(locationHtml));
    $("#location-list").append($(locationHtml));
    return GMaps.geocode({
      address: location.location,
      callback: function(results, status) {
        var latlng, marker;
        if (results !== null) {
          latlng = results[0].geometry.location;
          location.lat = latlng.lat();
          location.lng = latlng.lng();
          console.log(i, "latlng", latlng.lat(), latlng.lng(), location.location);
          marker = L.marker([latlng.lat(), latlng.lng()]).addTo(map);
          marker.bindPopup(ich.locationItem(location, true), {
            maxHeight: 500
          });
          console.log("MARKER", $(ich.locationItem(location)).html(), ich.locationItem(location, true));
          if (i === 0) {
            return map.setView([latlng.lat(), latlng.lng()], 14);
          }
        } else if (status === "OVER_QUERY_LIMIT") {
          return console.log("GMAPS ERROR", results, status);
        }
      }
    });
  });
  return map.on('click', function(e) {
    return console.log(e.latlng);
  });
};
