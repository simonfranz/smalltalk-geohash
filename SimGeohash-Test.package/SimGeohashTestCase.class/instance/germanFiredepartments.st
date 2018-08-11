as yet unclassified
germanFiredepartments

	| theCsvFile theLines theDepartments |
	theCsvFile := self germanFiredepartmentsCsv.
	theLines := theCsvFile splitOn: Character cr.
	theDepartments := Dictionary new.
	theLines do: [ :eachLine | | theParts|
		theParts := (eachLine copyWithout: Character lf) splitOn: $,.
		theDepartments at: (SimGeolocation longitude: (Float readFrom:  theParts first trim) latitude: (Float readFrom: theParts second trim))
			put: theParts last trim.].
	^theDepartments