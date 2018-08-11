comparing
sameAs: aSimGeolocation withPrecision: aNumber

	"<aSimGeolocation: iOf SimGeolocation, aNumber: hOf Number, ^(true | false)>"
	"Answer if the @aSimGeolocation is nearer than the distance in @aNumber"

	^(self distanceTo: aSimGeolocation) < aNumber