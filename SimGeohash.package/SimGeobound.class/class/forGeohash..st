as yet unclassified
forGeohash: aSimGeohash

	"<aSimGeohash: iOf SimGeohash, ^iOf self>"
	 "Answer the Geobound of the @aSimGeohash"

	| theEvenBit theLatitudeMin theLatitudeMax theLongitudeMin theLongitudeMax |

	theEvenBit := true.
	theLatitudeMin :=  -90.
	theLatitudeMax :=  90.
	theLongitudeMin := -180.
	theLongitudeMax := 180.

	(1 to: aSimGeohash size) do: [ :eachIndex | | theCharacter theIndex |
		theCharacter := aSimGeohash geohash at: eachIndex.
		theIndex := (SimGeohash base indexOf: theCharacter) - 1.
		(SimGeohash base indexOf: theCharacter) = 0
			ifTrue: [self error: 'Invalid geohash'].
		(0 to: 4) reverse do: [ :eachNumber | | theBitN |
			theBitN := (theIndex >> eachNumber) & 1.
			theEvenBit
				ifTrue: [ | theLongitudeMid |
					"longitude"
					theLongitudeMid := ((theLongitudeMin + theLongitudeMax) / 2) asFloat.
					theBitN = 1
						ifTrue: [theLongitudeMin := theLongitudeMid]
						ifFalse: [theLongitudeMax := theLongitudeMid]]
				ifFalse: [ | theLatitudeMid |
					"latitude"
					theLatitudeMid := ((theLatitudeMin + theLatitudeMax) / 2) asFloat.
					theBitN = 1
						ifTrue: [theLatitudeMin := theLatitudeMid]
						ifFalse: [theLatitudeMax := theLatitudeMid]].
			theEvenBit := theEvenBit not]].

	^self new
		southwest: (SimGeolocation latitude: theLatitudeMin longitude: theLongitudeMin);
		northeast: (SimGeolocation latitude: theLatitudeMax longitude: theLongitudeMax);
		yourself.