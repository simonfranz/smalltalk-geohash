accessing
geohashesBetween: aStartSimGeohash and: aEndSimGeohash

	"<aStartSimGeohash: iOf SimGeohash, aEndSimGeohash: iOf SimGeohash, ^hOf Collection of: {iOf SimGeohash}>"
	"Answer the nodes between @aStartSimGeohash and @aEndSimGeohash, both geohash must have the same precision"

	| theResultCollection theFirstSimGeohash theEndSimGeohash theBinaryNumberStringSize theStartSimGeohashDecimalNumber theEndSimGeohashDecimalNumber |
	aStartSimGeohash size = aEndSimGeohash size
		ifFalse: [self error: 'nodes need to have same precision'].
	aStartSimGeohash = aEndSimGeohash
		ifTrue: [^OrderedCollection with: aEndSimGeohash].
	theResultCollection := OrderedCollection new.
	theStartSimGeohashDecimalNumber := aStartSimGeohash asDecimalNumber.
	theEndSimGeohashDecimalNumber := aEndSimGeohash asDecimalNumber.
	theStartSimGeohashDecimalNumber < theEndSimGeohashDecimalNumber
		ifTrue: [
			theFirstSimGeohash := theStartSimGeohashDecimalNumber.
			theEndSimGeohash := theEndSimGeohashDecimalNumber.]
		ifFalse: [
			theFirstSimGeohash := theEndSimGeohashDecimalNumber.
			theEndSimGeohash := theStartSimGeohashDecimalNumber.].
	theBinaryNumberStringSize := aStartSimGeohash asBinaryNumberString size.
	(theFirstSimGeohash to: theEndSimGeohash) do: [ :eachInteger | | theBinaryNumberString |
		theBinaryNumberString := eachInteger printStringRadix: 2 padTo: theBinaryNumberStringSize.
		theResultCollection add: (SimGeohash fromBinaryNumberString: theBinaryNumberString)].
	^theResultCollection