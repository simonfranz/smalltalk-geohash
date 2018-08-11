comparing
addPrecision: aStringOrCharacter

	"<aStringOrCharacter: iOf (String | Character), ^self>"
	"Add the precision to the receiver"

	self geohash: (self geohash, aStringOrCharacter asString)