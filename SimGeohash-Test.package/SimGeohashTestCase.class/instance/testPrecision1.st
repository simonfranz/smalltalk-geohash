as yet unclassified
testPrecision1

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '68.0, 22.0')) < theTestGeohash metricPrecision 