accessing
encodeForGeolocation: aSimGeolocation precision: aPrecisionNumber

	"<aSimGeolocation: iOf Geolocation, aPrecisionNumber: hOf Number>"
	"Answer an instance of the receiver for @aSimGeolocation with precision @aPrecisionNumber>"

	| thePrecisionNumber theIndex theBit theEvenBitBoolean theGeohash theLatitudeMin theLatitudeMax theLongitudeMin theLongitudeMax |
	aPrecisionNumber isNil
		ifTrue: [
			1 to: 12 do: [ :eachNumber |
				theGeohash := self encodeForGeolocation: aSimGeolocation precision: eachNumber.
				theGeohash decode = aSimGeolocation
					ifTrue: [^theGeohash]].
			thePrecisionNumber := 12]
		ifFalse: [thePrecisionNumber := aPrecisionNumber].
	aSimGeolocation isValid
		ifFalse: [^self error: 'no valid geolocation'].

	theIndex := 0. "index into base32 map"
	theBit := 0. " each char holds 5 bits"
	theEvenBitBoolean := true.
	theGeohash := self new.

	theLatitudeMin :=  -90.
	theLatitudeMax :=  90.
	theLongitudeMin := -180.
	theLongitudeMax := 180.
	
	[theGeohash size < thePrecisionNumber] whileTrue: [
		theEvenBitBoolean
			ifTrue: [ | theLongitudeMiddle | "bisect E-W longitude"
				theLongitudeMiddle := ((theLongitudeMin + theLongitudeMax) / 2) asFloat.
				aSimGeolocation longitude >= theLongitudeMiddle
					ifTrue: [
						theIndex := (theIndex << 1) + 1.
						theLongitudeMin := theLongitudeMiddle]
					ifFalse: [
						theIndex := (theIndex << 1) + 0.
						theLongitudeMax := theLongitudeMiddle]]
			ifFalse: [ | theLatitudeMiddle | "bisect N-S latitude"
				theLatitudeMiddle := ((theLatitudeMin + theLatitudeMax) / 2) asFloat.
				aSimGeolocation latitude >= theLatitudeMiddle
					ifTrue: [
						theIndex := (theIndex << 1) + 1.
						theLatitudeMin := theLatitudeMiddle]
					ifFalse: [
						theIndex := (theIndex << 1) + 0.
						theLatitudeMax := theLatitudeMiddle]].
		theEvenBitBoolean := theEvenBitBoolean not.
		theBit < 4
			ifTrue: [theBit := theBit + 1]
			ifFalse: [
				theGeohash addPrecision: (self base at: (theIndex + 1)) asString.
				theBit := 0.
				theIndex := 0.]].
	^theGeohash