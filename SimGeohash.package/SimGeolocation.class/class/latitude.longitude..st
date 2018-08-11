instance creation
latitude: aLatitudeNumber longitude: aLongitudeNumber

	"<aLatitudeNumber: hOf Number, aLongitudeNumber: hOf Number, ^iOf self>"
	"Answer an instance of the receiver"

	^self new 
		latitude: aLatitudeNumber;
		longitude: aLongitudeNumber;
		yourself.