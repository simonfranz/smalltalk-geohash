as yet unclassified
testPrecision9

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t94swuy'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48.013837, 7.853787')) < theTestGeohash metricPrecision