as yet unclassified
testPrecisionHashLength6

	self assert: ((SimGeolocation fromString: '48.01385, 7.85380') asGeohashWithPrecision: 6) size = 6