as yet unclassified
geohashCollection

	| theGeohashCollection theHashes |
	theGeohashCollection := SimGeohashCollection  new.
	theHashes := OrderedCollection new
		add: 'b';
		add: 'bb';
		add: 'bc';
		add: 'bd';
		add: 'c';
		add: 'cb';
		add: 'cc';
		add: 'cd';
		add: 'd';
		add: 'db';
		add: 'dc';
		add: 'dd';
		yourself.
	theHashes doWithIndex: [ :eachString :eachIndex|
		theGeohashCollection at: (SimGeohash new: eachString ) put: eachIndex].
	^theGeohashCollection.