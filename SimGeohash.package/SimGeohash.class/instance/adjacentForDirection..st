comparing
adjacentForDirection: aString

	"<aString: iOf String, ^iOf SeimGeohash>"
	"Answer the neighbour SimGeohash in the direction @aString"

	 | theDirection theNeighbours theBorders theLastCharacter theParent theType |
	 theDirection := aString asString.
	self size = 0
		ifTrue: [self error: 'Invalid geohash'].
	('nsew' indexOf: theDirection) >= 0
		ifFalse: [ self error: 'Invalid direction'].

	theNeighbours := Dictionary new
		at: 'n' put: #('p0r21436x8zb9dcf5h7kjnmqesgutwvy' 'bc01fg45238967deuvhjyznpkmstqrwx');
		at: 's' put: #('14365h7k9dcfesgujnmqp0r2twvyx8zb' '238967debc01fg45kmstqrwxuvhjyznp');
		at: 'e' put: #('bc01fg45238967deuvhjyznpkmstqrwx' 'p0r21436x8zb9dcf5h7kjnmqesgutwvy');
		at: 'w' put: #('238967debc01fg45kmstqrwxuvhjyznp' '14365h7k9dcfesgujnmqp0r2twvyx8zb');
		yourself.
	theBorders := Dictionary new
		at: 'n' put: #('prxz' 'bcfguvyz');
		at: 's' put: #('028b' '0145hjnp');
		at: 'e' put: #('bcfguvyz' 'prxz');
		at: 'w' put: #('0145hjnp' '028b');
		yourself.
	theLastCharacter := self geohash last. "last character of hash"	
	theParent := self parentGeohash. "hash without last character"
	theType := (self size \\ 2) + 1 .

	"check for edge-cases which don't share common prefix"
	((((((theBorders at: theDirection) at: theType) indexOf: theLastCharacter) = 0) not ) and: [theParent geohash notEmpty])
		ifTrue: [theParent := theParent adjacentForDirection: aString].

	"append letter for direction to parent"
	^theParent addPrecision: (self class base at: (((theNeighbours at: theDirection) at: theType) indexOf: theLastCharacter)) asString