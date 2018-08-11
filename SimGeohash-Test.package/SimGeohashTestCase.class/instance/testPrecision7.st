as yet unclassified
testPrecision7

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t94sw'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48.0137, 7.8532')) < theTestGeohash metricPrecision