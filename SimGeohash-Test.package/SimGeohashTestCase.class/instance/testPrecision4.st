as yet unclassified
testPrecision4

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t9'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48, 8')) < theTestGeohash metricPrecision