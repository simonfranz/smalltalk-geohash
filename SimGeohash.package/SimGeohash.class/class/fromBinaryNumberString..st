accessing
fromBinaryNumberString: aString

	"<aString: iOf String, ^iOf self>"
	"Anser an instance of the receiver parsed from @aString"

	| theString theCollection theStream |
	theString := aString.
	theCollection := OrderedCollection new.
	[theString notEmpty] whileTrue: [
		theCollection add: (theString copyFrom: ((theString size-4) max: 1) to: theString size).
		theString := theString copyFrom: 1 to: (theString size - 5)].
	theStream := WriteStream on: ''.
	theCollection do: [ :eachNumberTuple | | theNumber |
		theNumber := Integer readFrom: eachNumberTuple base: 2.
		theStream nextPut: (self base at: (theNumber + 1))].
	^self new: theStream contents reverse