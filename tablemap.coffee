test = 0
locations = []
locationList = []

tableMap = (gdoc) ->
	#console.log gdoc
	locations = gdoc

	makeMap(locations)

geocodeLocation = (location) ->
	console.log("Location", location)
	baseUrl = "http://open.mapquestapi.com/nominatim/v1/search.php?format=json&json_callback=placeMarker"
	addr = "&q="+location.location



	url = encodeURI(baseUrl + addr + "&addressdetails=1&limit=1")

	console.log "URL>", url

	$.ajax({
		url: url
		type: "GET"
		dataType: "script"
		cache: true
	})


placesMarked = 0
placeMarker = (result) ->
	console.log("geoReturn", result[0])

	location.lat = result[0].lat
	location.lng = result[0].lon
	marker = L.marker([location.lat, location.lng]).addTo(map)

	thisLocation = _.filter(locationList, (row) -> return row.i == placesMarked)

	console.log("THIS LOCATION?", placesMarked, thisLocation[0])
	marker.bindPopup(ich.locationItem(thisLocation[0], true), {maxHeight: 500})
	placesMarked++

makeMap = (locations) ->
	locationList = []

	_.each(locations, (location, i) ->
		#console.log "LOCATION", location
		#console.log "Location=>", location, "HTML=>", $(locationHtml)

		location.i = i
		locationList.push(location)

		geocodeLocation(location)

		locationHtml = ich.locationItemLi(location)
		$("#location-list").append($(locationHtml))

	layer = new L.StamenTileLayer("toner");
	window.map = new L.Map("map", {
	    center: new L.LatLng(37.8, -122.4),
	    zoom: 10
	});
	map.addLayer(layer);





	)




	# lat: 37.78292608704405
	# lng: -122.39318847656249

	map.on('click', (e) ->
		console.log(e.latlng)
	)
