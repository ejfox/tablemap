// Generated by CoffeeScript 1.3.3
var locations, makeMap, tableMap, test;

test = 0;

locations = [];

tableMap = function(gdoc) {
  console.log(gdoc);
  locations = gdoc;
  return makeMap(locations);
};

makeMap = function(locations) {
  var layer, map, marker;
  layer = new L.StamenTileLayer("toner");
  map = new L.Map("map", {
    center: new L.LatLng(37.7, -122.4),
    zoom: 12
  });
  map.addLayer(layer);
  marker = L.marker([37.78, -122.39]).addTo(map);
  marker.bindPopup("<b>Hello world!</b><br>I am a popup.");
  return map.on('click', function(e) {
    return console.log(e.latlng);
  });
};
