as yet unclassified
testPrecisionHashLength4

	self assert: ((SimGeolocation fromString: '48.01385, 7.85380') asGeohashWithPrecision: 4) size = 4