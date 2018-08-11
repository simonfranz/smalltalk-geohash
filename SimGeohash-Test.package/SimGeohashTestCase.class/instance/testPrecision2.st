as yet unclassified
testPrecision2
	
	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '47.8, 6')) < theTestGeohash metricPrecision