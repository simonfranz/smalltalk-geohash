as yet unclassified
testFullSearch

	| theDepartmentsDictionary theGeohashCollection theGeolocation theGeohash theNeighbours theNeighbourStrings theNumberOfNeededDigits
	theSearchRanges theResultSet theNameToLocationDictionary theNodesIn25000Meters |
	
	theDepartmentsDictionary := self germanFiredepartments.
	theGeohashCollection := SimGeohashCollection new.
	theNameToLocationDictionary := Dictionary new.
	theDepartmentsDictionary keysAndValuesDo: [ :eachKey :eachValue |
		theNameToLocationDictionary at: eachValue put: eachKey.
		theGeohashCollection at: eachKey asGeohash put: eachValue].
	
	
	self assert: theGeohashCollection size = theDepartmentsDictionary keys size.
	
	theGeolocation := SimGeolocation fromString: '48.0201341,7.8282147'.
	theGeohash :=  theGeolocation asGeohash.
	self assert: 'u0t94ju3d9gc' = theGeohash geohash.
	theNeighbours := theGeohash neighbours.
	theNeighbourStrings := #('u0t94ju3d9gd'	'u0t94ju3d9gf'	'u0t94ju3d9u4' 
										'u0t94ju3d9g9'	'u0t94ju3d9gc'	'u0t94ju3d9u1'
										'u0t94ju3d9g8'	'u0t94ju3d9gb'	'u0t94ju3d9u0').
	self assert: ((theNeighbours values asSet add: theGeohash; yourself) collect: [ :eachGeohash |eachGeohash geohash]) = theNeighbourStrings asSet.
	
	theNumberOfNeededDigits := SimGeohash precisionForMeter: 25000.
	theGeohash := theGeolocation asGeohashWithPrecision: theNumberOfNeededDigits.
	self assert: theNumberOfNeededDigits = 4.
	self assert: theGeohash geohash = 'u0t9'.
	theNeighbours := theGeohash neighbours.
	theNeighbourStrings := #('u0t6'	'u0td'	'u0tf'
										'u0t3'	'u0t9'	'u0tc'
										'u0t2'	'u0t8'	'u0tb').
	self assert: ((theNeighbours values asSet add: theGeohash; yourself) collect: [ :eachGeohash |eachGeohash geohash]) = theNeighbourStrings asSet.
	
	theSearchRanges := theGeohash searchRanges.
	self assert: theSearchRanges size = 2.
	self assert: (SimGeohash geohashesBetween: theSearchRanges first first and:  theSearchRanges first second) size = 3.
	self assert: (SimGeohash geohashesBetween: theSearchRanges second first and:  theSearchRanges second second) size = 10.
	
	theResultSet := theSearchRanges inject: Set new into: [ :theResult :eachRange |
		theResult addAll: (theGeohashCollection between: eachRange first geohash and: eachRange second geohash); yourself].
	
	self assert: theResultSet size = 49.
	
	theNodesIn25000Meters := theResultSet select: [:eachString | ((theNameToLocationDictionary at: eachString) distanceTo: theGeolocation) < 25000].
	self assert: theNodesIn25000Meters size = 10.
	self assert: theNodesIn25000Meters = #('Feuerwehr; D-Kirchzarten. Breisgau; Höllentalstr. 56'
																'Feuerwehr; D-Biederbach. Schwarzw; Dorf-Dobelstr. 1b' 
																'Feuerwehr; D-Winden; Gerätehaus Winden Im Elztal' 
																'Feuerwehr; D-Emmendingen; Am Elzdamm 12' 
																'Feuerwehr; D-Stegen. Hochschwarzw; Fohrenbühl 7' 
																'Feuerwehr; D-Bahlingen Am Kaiserstuhl; Am Dorfbach 2' 
																'Feuerwehr; D-Weisweil. Breisgau; Rheinstr. 2' 
																'Feuerwehr; D-Hartheim. Breisgau; An Der Ries 1' 
																'Feuerwehr; D-Kirchzarten. Breisgau; Wittentalstr. 4' 
																'Feuerwehr; D-Glottertal; Rathausweg 16' ) asSet