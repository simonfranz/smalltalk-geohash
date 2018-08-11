accessing
at: aKey put: aValue

	"<aKey: hOf SimGeohash, aValue: hOf any>"
	"Add the @aValue at @aKey"

	aKey size > 0
		ifTrue: [ |theFirstCharacter |
			theFirstCharacter := aKey first.
			(self geohashPrefixDictionary at: theFirstCharacter ifAbsentPut: [self class new]) at: aKey allButFirst put: aValue]
		ifFalse: [self valueCollection add: aValue]