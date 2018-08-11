comparing
= aSimGeolocation

	"<aSimGeolocation: iOf SimGeolocation, ^(true | false)>"
	"Answer if the receiver is the same as @aSimGeolocation"

	^self longitude = aSimGeolocation longitude
		and: [self latitude = aSimGeolocation longitude]