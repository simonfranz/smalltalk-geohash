as yet unclassified
testSearchRange

	| theStarthash theSearchRanges theGeohashSet theNeighbours |
	
	theStarthash := SimGeohash new: '9q8ye'.	
	theSearchRanges := theStarthash searchRanges.
	self assert: theSearchRanges size = 4.
	
	self assert: (theSearchRanges at: 1) first  = (SimGeohash new: '9q8y6').
	self assert: (theSearchRanges at: 1) second  = (SimGeohash new: '9q8y8').
	
	self assert: (theSearchRanges at: 2) first  = (SimGeohash new: '9q8yd').
	self assert: (theSearchRanges at: 2) second  = (SimGeohash new: '9q8yh').
	
	self assert: (theSearchRanges at: 3) first  = (SimGeohash new: '9q8yk').
	self assert: (theSearchRanges at: 3) second  = (SimGeohash new: '9q8ym').
	
	self assert: (theSearchRanges at: 4) first  = (SimGeohash new: '9q8ys').
	self assert: (theSearchRanges at: 4) second  = (SimGeohash new: '9q8yv').
	
	theGeohashSet := theSearchRanges
		inject: Set new
		into: [ :theResultSet :eachRange |
			theResultSet
				addAll: (SimGeohash geohashesBetween: eachRange first and: eachRange second);
				yourself.].
	theNeighbours := theStarthash neighbours.
	self assert: (theNeighbours allSatisfy: [ :eachNeighbourGeohash | theGeohashSet includes: eachNeighbourGeohash])