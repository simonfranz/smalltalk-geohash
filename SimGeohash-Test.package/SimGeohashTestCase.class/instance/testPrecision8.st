as yet unclassified
testPrecision8

	| theTestGeohash |
	theTestGeohash := SimGeohash new: 'u0t94swu'.
	self assert: (theTestGeohash asGeolocation distanceTo: (SimGeolocation fromString: '48.01377, 7.85368')) < theTestGeohash metricPrecision