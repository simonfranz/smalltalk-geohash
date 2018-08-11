accessing
allChildValues

	"<^iOf Set of: {iOf any}>"
	"Answer all included values"
	
	| theResultSet |
	theResultSet := Set withAll: self valueCollection.
	self geohashPrefixDictionary values do: [ :eachGeohashCollection |
		theResultSet addAll: eachGeohashCollection allChildValues].
	^theResultSet