as yet unclassified
testBetweenAnd

	| theGeoHashes |
	theGeoHashes := SimGeohash  geohashesBetween: (SimGeohash new: '9q8ye')  and: (SimGeohash new: '9q8yh').
	self assert: theGeoHashes size = 4.
	self assert: (theGeoHashes collect: [ :eachGeohash | eachGeohash geohash]) asSet = #('9q8ye' '9q8yf' '9q8yg' '9q8yh') asSet.
	
	theGeoHashes := SimGeohash  geohashesBetween: (SimGeohash new: '9q8yh')  and: (SimGeohash new: '9q8ye').
	self assert: theGeoHashes size = 4.
	self assert: (theGeoHashes collect: [ :eachGeohash | eachGeohash geohash]) asSet = #('9q8ye' '9q8yf' '9q8yg' '9q8yh') asSet.