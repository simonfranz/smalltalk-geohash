accessing
size

	"<^iOf Integer>"
	"Answer the size of the receiver"

	^self valueCollection size + (self geohashPrefixDictionary values inject: 0 into: [ :theResult :eachGeoHashCollection | theResult + eachGeoHashCollection size])