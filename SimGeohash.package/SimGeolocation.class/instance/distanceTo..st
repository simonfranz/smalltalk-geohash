comparing
distanceTo: aSimGeolocation

	"<aSimGeolocation: iOf SimGeolocation, ^hOf Number>"
	"Answer the distance between the receiver and @aSimGeolocation in meter"
	
	| theLatitudeReceiverRadian theLongitudeReceiverRadian theLatitudeSimGeolocationRadian theLaongitudeSimGeolocationRadian
	 theLatitudeDifference theLongitudeDifference theLatitudeDifferenceSinSquared theLongitudeDifferenceSinSquared theLatitudesCosinus
	 theInterimResult |

	theLatitudeReceiverRadian := self latitude * Float pi / 180.
	theLongitudeReceiverRadian := self longitude * Float pi / 180.
	theLatitudeSimGeolocationRadian := aSimGeolocation latitude * Float pi / 180.
	theLaongitudeSimGeolocationRadian := aSimGeolocation longitude * Float pi / 180.

	"Haversines"	
	theLatitudeDifference := theLatitudeSimGeolocationRadian - theLatitudeReceiverRadian.
	theLongitudeDifference := theLaongitudeSimGeolocationRadian - theLongitudeReceiverRadian.
	theLatitudeDifferenceSinSquared := (theLatitudeDifference / 2) sin squared.
	theLongitudeDifferenceSinSquared := (theLongitudeDifference / 2) sin squared.
	theLatitudesCosinus := theLatitudeSimGeolocationRadian cos * theLatitudeReceiverRadian cos.
	theInterimResult := theLatitudeDifferenceSinSquared + (theLatitudesCosinus * theLongitudeDifferenceSinSquared).
	^ 6371000 * (2 * theInterimResult sqrt arcSin). 