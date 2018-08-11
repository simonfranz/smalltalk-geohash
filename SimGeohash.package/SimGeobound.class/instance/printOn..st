accessing
printOn: aStream

	"<aStream: hOf Stream>"
	"Print the receiver onto the @aStream"

	aStream
		nextPutAll: self southwest asString;
		cr;
		nextPutAll: self northeast asString;
		yourself.