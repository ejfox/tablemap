test = 0
locations = []

tableMap = (gdoc) ->
	console.log gdoc
	locations = gdoc

	makeMap(locations)

geocodeLocation = (location) ->


makeMap = (locations) ->

	layer = new L.StamenTileLayer("toner");
	map = new L.Map("map", {
	    center: new L.LatLng(37.8, -122.4),
	    zoom: 10
	});
	map.addLayer(layer);

	console.log "location count", locations
	_.each(locations, (location, i) ->
		console.log "LOCATION", location

		locationHtml = ich.locationItemLi(location)

		console.log "Location=>", location, "HTML=>", $(locationHtml)

		$("#location-list").append($(locationHtml))

		GMaps.geocode({
			address: location.location,
			callback: (results, status) ->
				if results isnt null
					latlng = results[0].geometry.location

					location.lat = latlng.lat()
					location.lng = latlng.lng()

					console.log i, "latlng", latlng.lat(), latlng.lng(), location.location
					marker = L.marker([latlng.lat(), latlng.lng()]).addTo(map)
					marker.bindPopup(ich.locationItem(location, true), {maxHeight: 500})
					console.log "MARKER", $(ich.locationItem(location)).html(), ich.locationItem(location, true)
					if i is 0
						map.setView([latlng.lat(), latlng.lng()], 14)
				else if status is "OVER_QUERY_LIMIT"
					console.log "GMAPS ERROR", results, status
		})

	)




	# lat: 37.78292608704405
	# lng: -122.39318847656249





	map.on('click', (e) ->
		console.log(e.latlng)
	)
