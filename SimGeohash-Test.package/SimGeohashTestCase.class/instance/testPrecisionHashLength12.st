as yet unclassified
testPrecisionHashLength12

	self assert: ((SimGeolocation fromString: '48.01385, 7.85380') asGeohashWithPrecision: 12) size = 12