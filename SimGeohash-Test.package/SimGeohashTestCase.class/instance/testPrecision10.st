as yet unclassified
testPrecision10

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t94swuyz'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48.01386, 7.8538')) < theTestGeohash metricPrecision 