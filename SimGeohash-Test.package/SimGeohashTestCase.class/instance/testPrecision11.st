as yet unclassified
testPrecision11

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t94swuyz4'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48.0138541, 7.853801')) < theTestGeohash metricPrecision 