as yet unclassified
testMaximumPrecision

	self assert: ((SimGeohash new: 'u0t94swuyz47') asGeolocation distanceTo: (SimGeolocation fromString: '48.013854, 7.853801')) < 0.02