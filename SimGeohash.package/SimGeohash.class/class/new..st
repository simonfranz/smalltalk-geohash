accessing
new: aString

	"<aString; iOf String, ^iOf self>"
	"Answer an instance of the receiver parsed out of @aString>"

	^self new geohash: aString asLowercase