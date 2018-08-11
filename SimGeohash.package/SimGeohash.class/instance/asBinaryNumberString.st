comparing
asBinaryNumberString

	"<^iOf String>"
	"Answer the IntegerBaseRepresentation of the receiver"
	
	| theStream |
	theStream := WriteStream on: ''.
	(1 to: self size) do: [ :eachIndex | | theCharacter theIndex |
		theCharacter := self geohash at: eachIndex.
		theIndex := (self class base indexOf: theCharacter) - 1.
		theStream nextPutAll: (theIndex printStringRadix: 2 padTo: 5)].
	^theStream contents