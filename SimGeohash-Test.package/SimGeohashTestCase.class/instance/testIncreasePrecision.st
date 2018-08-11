as yet unclassified
testIncreasePrecision

	| theGeohash theSecondGeohash theFirstDistance theSecondDistance |
	theGeohash := (SimGeohash new: 'u0t2zy188').
	self assert: (theGeohash adjacentForDirection: 'e') = (SimGeohash new: 'u0t2zy189').
	self assert: ((SimGeolocation fromString: '47.977402,7.725513') asGeohashWithPrecision: 9) = (SimGeohash new: 'u0t2zy189').
	self assert: (theGeohash asGeolocation sameAs: (SimGeolocation fromString: '47.977402,7.725513') withPrecision: theGeohash metricPrecision).
	
	theGeohash := SimGeohash new: 'u0t2zy1'.
	theSecondGeohash := SimGeohash new: 'u0t2zvcx'.
	theFirstDistance := theGeohash asGeolocation distanceTo: theSecondGeohash asGeolocation.
	theGeohash := SimGeohash new: 'u0t2zy18'.
	theSecondDistance := theGeohash asGeolocation distanceTo: theSecondGeohash asGeolocation.
	self assert: (theFirstDistance > theSecondDistance).