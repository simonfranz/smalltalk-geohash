instance creation
fromString: aString

	"<aString: iOf String>"
	"Anser an instance of the receiver parsed out of @aString"

	| theNumberParts |
	theNumberParts := aString splitOn: $,.
	^self
		latitude: (Float readFrom: theNumberParts first trim)
		longitude: (Float readFrom: theNumberParts last trim)