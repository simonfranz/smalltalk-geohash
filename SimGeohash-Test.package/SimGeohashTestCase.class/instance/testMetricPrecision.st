as yet unclassified
testMetricPrecision

	| theInitialGeohash theNeighbourGeohash |
	theInitialGeohash := SimGeohash new: 'u0t94'.
	theNeighbourGeohash := theInitialGeohash adjacentForDirection: 'w'.
	self assert: (theNeighbourGeohash asGeolocation distanceTo: theInitialGeohash asGeolocation) < theInitialGeohash metricPrecision 
	