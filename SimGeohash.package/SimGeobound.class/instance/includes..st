accessing
includes: aSimGeoLocation

	"<aSimGeoLocation: iOf SimGeoLocation, ^(true | false)>"
	"Answer if @aSimGeoLocation is included in the receiver"

	^((aSimGeoLocation latitude between: self latitudeMin and: self latitudeMax)
		or: [aSimGeoLocation latitude between: self latitudeMax and: self latitudeMin])
			and: [(aSimGeoLocation longitude between: self longitudeMin and: self longitudeMax)
				or: [aSimGeoLocation longitude between: self longitudeMax and: self longitudeMin]]