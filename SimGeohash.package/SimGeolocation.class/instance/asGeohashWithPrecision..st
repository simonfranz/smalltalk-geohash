comparing
asGeohashWithPrecision: aNumber

	"<aNumber: hOf Number, ^iOf SimGeohash>"
	"Answer the Geohash representation of the receiver with precision @aNumber"

	^SimGeohash encodeForGeolocation: self precision: aNumber