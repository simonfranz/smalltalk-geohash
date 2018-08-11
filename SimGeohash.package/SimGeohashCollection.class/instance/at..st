accessing
at: aKey

	"<aKey: iOf SimGeohash, ^iOf Set of: {iOf any}>"
	"Answer the values of @aKey"

	^aKey size > 0
		ifTrue: [ | theChildCollection |
			theChildCollection := self geohashPrefixDictionary at: aKey first ifAbsent: [].
			theChildCollection isNil
				ifTrue: [Set new]
				ifFalse: [theChildCollection at: aKey allButFirst]]
		ifFalse: [self allChildValues]