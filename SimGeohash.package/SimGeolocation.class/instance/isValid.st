comparing
isValid

	"<^(true | false>"
	"Check wether the receiver is a valid Geolocation"

	^self latitude notNil and: [self longitude notNil]