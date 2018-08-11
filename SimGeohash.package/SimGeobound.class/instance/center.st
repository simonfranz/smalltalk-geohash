accessing
center

	"<^iOf SimGeolocation>"
	"Answer the center of the receiver"

	| theLatitudeMin theLongitudeMin theLatitudeMax theLongitudeMax theLatitude theLongitude theLatitudeDigits theLongitudeDigits theLatitudeRoundPrecision theLongitudeRoundPrecision |
	theLatitudeMin := self latitudeMin.
	theLongitudeMin := self longitudeMin.
	theLatitudeMax := self latitudeMax.
	theLongitudeMax := self longitudeMax.

	"cell centre"
	theLatitude := ((theLatitudeMin + theLatitudeMax) / 2) asFloat.
	theLongitude := ((theLongitudeMin + theLongitudeMax) / 2) asFloat.
	
	theLatitudeDigits := (2 - ((theLatitudeMax - theLatitudeMin) abs log: 10)) floor.
	theLatitudeRoundPrecision := 1.
	theLatitudeDigits timesRepeat: [theLatitudeRoundPrecision := theLatitudeRoundPrecision / 10].
	theLongitudeDigits := (2 - ((theLongitudeMax - theLongitudeMin) abs log: 10)) floor.
	theLongitudeRoundPrecision := 1.
	theLongitudeDigits timesRepeat: [theLongitudeRoundPrecision := theLongitudeRoundPrecision / 10].
	
	^SimGeolocation
		latitude: (theLatitude roundTo: (theLatitudeRoundPrecision asFloat))
		longitude: (theLongitude roundTo: (theLongitudeRoundPrecision asFloat)).