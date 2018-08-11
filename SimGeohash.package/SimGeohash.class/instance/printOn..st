accessing
printOn: aStream

	"<aStream: hOf Stream>"
	"Print the receiver onto the @aStream"

	aStream
		nextPutAll: self geohash;
		nextPutAll: ' (a ';
		nextPutAll: self class name;
		yourself.