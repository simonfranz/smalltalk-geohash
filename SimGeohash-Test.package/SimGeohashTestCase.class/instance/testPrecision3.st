as yet unclassified
testPrecision3

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '49, 8')) < theTestGeohash metricPrecision