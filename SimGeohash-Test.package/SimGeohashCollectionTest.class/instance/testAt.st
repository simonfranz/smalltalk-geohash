as yet unclassified
testAt

	self assert: (self geohashCollection at: 'b') size = 4.
	self assert: (self geohashCollection at: 'bb') size = 1.