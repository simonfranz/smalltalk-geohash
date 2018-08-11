tests
testIncludesGeolocation

	self assert: ((SimGeohash new: 'u0t8fr') bound includes: (SimGeolocation latitude: 47.986972 longitude: 7.833831)).