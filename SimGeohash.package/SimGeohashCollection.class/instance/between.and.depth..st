accessing
between: aFirstKey and: aSecondKey depth: anInteger

	"<aFirstKey: iOf SimGeohash, aSecondKey: iOf SimGeohash, anInteger: iOf Integer>"
	"Answer values for geoHashes between @aFirstKey and @aSecondKey"

	| theBase theFirstIndex theCharactesToSearch theSecondIndex theResultSet |
	theBase := SimGeohash base.
	theFirstIndex := aFirstKey isEmpty
		ifTrue: [1]
		ifFalse: [theBase indexOf: (aFirstKey first)].
	theSecondIndex := aSecondKey isEmpty
		ifTrue: [theBase size]
		ifFalse: [theBase indexOf: (aSecondKey first)].
	theResultSet := Set new.
	
	theCharactesToSearch := theBase copyFrom: theFirstIndex to: theSecondIndex.
	theCharactesToSearch = theBase
		ifTrue: [^self allChildValues].
	theCharactesToSearch doWithIndex: [ :eachCharacter :eachIndex | | theDictionary |
		theDictionary := self geohashPrefixDictionary at: eachCharacter ifAbsent: [].
		theDictionary isNil
			ifFalse: [ | theStartString theEndString |
				theStartString := aFirstKey.
				theEndString := aSecondKey.
				theCharactesToSearch size > 1
					ifTrue: [
						eachIndex = 1
							ifTrue: [theEndString := ''].
						(eachIndex = 1 or: [eachIndex = theCharactesToSearch size])
							ifFalse: [theEndString := ''. theStartString := ''].
						eachIndex = theCharactesToSearch size
							ifTrue: [theStartString := '']].
				theResultSet addAll: (theDictionary
					between: (theStartString isEmpty ifTrue: [''] ifFalse: [theStartString allButFirst])
					and: (theEndString isEmpty ifTrue: [''] ifFalse: [theEndString allButFirst])
					depth: (anInteger+1))]].
	^theResultSet
		
		