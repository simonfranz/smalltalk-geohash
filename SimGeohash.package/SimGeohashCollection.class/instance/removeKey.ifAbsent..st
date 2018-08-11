accessing
removeKey: aKey ifAbsent: aBlock

	"<aKey: iOf SimGeohash, aBlock: iOf Block>"
	"Remove all objects of the key @aKey"

	^aKey size > 1
		ifTrue: [ |theFirstCharacter theGeohashCollection | 
			theFirstCharacter := aKey first.
			theGeohashCollection := self geohashPrefixDictionary at: theFirstCharacter ifAbsentPut: [].
			theGeohashCollection isNil
				ifTrue: aBlock
				ifFalse: [theGeohashCollection removeKey: aKey ifAbsent: aBlock]]
		ifFalse: [self geohashPrefixDictionary removeKey: aKey]