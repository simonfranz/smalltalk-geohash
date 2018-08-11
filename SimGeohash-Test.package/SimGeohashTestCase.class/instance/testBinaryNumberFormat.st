as yet unclassified
testBinaryNumberFormat

	| theIntegerString theGeohash theGeolocation |
	theIntegerString := '110100000011001010010010011000111001101011110111110010000111'.
	theGeohash := SimGeohash fromBinaryNumberString: theIntegerString.
	theGeolocation := theGeohash decode.
	self assert: theGeolocation asGeohash asBinaryNumberString = theIntegerString.
	