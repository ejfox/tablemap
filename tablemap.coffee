test = 0
locations = []

tableMap = (gdoc) ->
	console.log gdoc
	locations = gdoc

	makeMap(locations)

makeMap = (locations) ->
	layer = new L.StamenTileLayer("toner");
	map = new L.Map("map", {
	    center: new L.LatLng(37.7, -122.4),
	    zoom: 12
	});
	map.addLayer(layer);

	# lat: 37.78292608704405
	# lng: -122.39318847656249

	marker = L.marker([37.78, -122.39]).addTo(map)

	marker.bindPopup("<b>Hello world!</b><br>I am a popup.")



	map.on('click', (e) ->
		console.log(e.latlng)
	)
