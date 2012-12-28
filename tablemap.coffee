test = 0
locations = []

tableMap = (gdoc) ->
	console.log gdoc
	locations = gdoc

	makeMap(locations)

makeMap = (locations) ->

	layer = new L.StamenTileLayer("toner");
	map = new L.Map("map", {
	    center: new L.LatLng(37.8, -122.4),
	    zoom: 10
	});
	map.addLayer(layer);

	_.each(locations, (location, i) ->
		console.log "LOCATION", location

		GMaps.geocode({
			address: location.location,
			callback: (results, status) ->
				latlng = results[0].geometry.location

				location.lat = latlng.lat()
				location.lng = latlng.lng()

				console.log "latlng", latlng.lat(), latlng.lng()
				marker = L.marker([latlng.lat(), latlng.lng()]).addTo(map)
				marker.bindPopup(location.caption)

				if i is 0
					map.setView([latlng.lat(), latlng.lng()], 14)

		})


	)




	# lat: 37.78292608704405
	# lng: -122.39318847656249





	map.on('click', (e) ->
		console.log(e.latlng)
	)
