comparing
neighbours

	"<iOf Dictionary of: {key: iOf String, value: iOf SimGeohash>"
	"Answer the neighbours of the receiver"

	| theNorthGeoHash theSouthGeoHash |
	theNorthGeoHash := self adjacentForDirection: 'n'.
	theSouthGeoHash := self adjacentForDirection: 's'.
	^Dictionary new
		at: 'n' put: theNorthGeoHash;
		at: 'ne' put: (theNorthGeoHash adjacentForDirection: 'e');
		at: 'nw' put: (theNorthGeoHash adjacentForDirection: 'w');
		at: 's' put:  theSouthGeoHash;
		at: 'se' put: (theSouthGeoHash adjacentForDirection: 'e');
		at: 'sw' put: (theSouthGeoHash adjacentForDirection: 'w');
		at: 'e' put:  (self adjacentForDirection: 'e');
		at: 'w' put: (self adjacentForDirection: 'w');
		yourself.