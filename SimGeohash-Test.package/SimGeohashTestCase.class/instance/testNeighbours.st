as yet unclassified
testNeighbours

	| theStarthash |
	theStarthash := SimGeohash new: 'u0t8fr'.
	theStarthash asGeolocation.
	self assert: (theStarthash adjacentForDirection: 'n') geohash "'u0t8f2'" = 'u0t942'.
	self assert: (theStarthash adjacentForDirection: 's') geohash  "'u0t8fq'" = 'u0t8fq'.
	self assert: (theStarthash adjacentForDirection: 'w') geohash "'u0t8fp'" = 'u0t8fp'.
	self assert: (theStarthash adjacentForDirection: 'e') geohash "'u0t8fx'" = 'u0t8fx'.