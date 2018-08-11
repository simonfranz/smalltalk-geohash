comparing
printOn: aStream

	"<aStream: hOf Stream>"
	"Print the receiver onto the @aStream"

	aStream
		nextPutAll: self latitude asString;
		nextPutAll: ', ';
		nextPutAll: self longitude asString;
		yourself.