as yet unclassified
testPrecision6

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t94s'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48.013, 7.85')) < theTestGeohash metricPrecision