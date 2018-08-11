as yet unclassified
testPrecision5

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t94'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48.0, 7.8')) < theTestGeohash metricPrecision