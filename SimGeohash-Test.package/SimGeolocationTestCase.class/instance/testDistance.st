tests
testDistance

	| theStartGeolocation theEndGeolocation |
	theStartGeolocation := SimGeolocation latitude: 47.9871667 longitude: 7.8318003.
	theEndGeolocation := SimGeolocation fromString: '47.9978878, 7.8422344'.
	self assert: ((theStartGeolocation distanceTo: theEndGeolocation) between: 1420 and: 1425)