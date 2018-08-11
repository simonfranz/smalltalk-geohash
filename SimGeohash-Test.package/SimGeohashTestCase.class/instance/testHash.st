as yet unclassified
testHash

	| theGeohash theSet theNewGeohash |
	theGeohash := (SimGeohash new: 'u0t2zy1884s').
	theSet := Set new.
	theSet add: theGeohash.
	theNewGeohash := (SimGeohash new: 'u0t2zy1884s').
	self assert: (theSet includes: theNewGeohash)