accessing
searchRanges

	"<hOf Collection of: {hOf Collection of: {iOf SimGeohash}}>"
	"Answer the searchRanges for SimGeohash as IntegerStringRepresentation"

	| theSearchCollection theRangesCollection theSortedCollection theResultRanges theCurrentRange |
	theSearchCollection := OrderedCollection new 
		addAll: self neighbours;
		add: self;
		yourself.
	theRangesCollection := OrderedCollection new.
	theSearchCollection collect: [ :eachGeolocation | | theIntegerNumber theIntegerBaseNumber theNumber |
		theIntegerBaseNumber := eachGeolocation asBinaryNumberString.
		theNumber := (Number readFrom: theIntegerBaseNumber base: 2) + 1.
		theIntegerNumber := theNumber printStringRadix: 2 padTo: theIntegerBaseNumber size.
		theRangesCollection add: (OrderedCollection with: eachGeolocation asBinaryNumberString with: theIntegerNumber)].	
		
	"Sorting and merging for less sets with larger ranges"
	theSortedCollection := theRangesCollection asSortedCollection: [ :firstRange :secondRange | firstRange first < secondRange first].
	theResultRanges := OrderedCollection with: theSortedCollection first.
	
	2 to: theSortedCollection size do: [ :eachIndex | | theFirst theSecond |
		theCurrentRange := theSortedCollection at: eachIndex.
		theFirst := (Number readFrom: (theResultRanges last last) base: 2) + 1  .
		theSecond := (Number readFrom: theCurrentRange first base: 2).
		theFirst >= theSecond
			ifTrue: [theResultRanges last at: 2 put: theCurrentRange last]
			ifFalse: [theResultRanges add: theCurrentRange.]].
	^theResultRanges collect: [ :eachRangeCollection |
		OrderedCollection
			with: (SimGeohash fromBinaryNumberString: eachRangeCollection first)
			with: (SimGeohash fromBinaryNumberString: eachRangeCollection second)]