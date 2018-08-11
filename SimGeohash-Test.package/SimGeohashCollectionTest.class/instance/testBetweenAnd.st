as yet unclassified
testBetweenAnd
	
	self assert: (self geohashCollection between: 'b' and: 'd') size = 12.
	self assert: (self geohashCollection between: 'b' and: 'd') = #(1 2 3 4 5 6 7 8 9 10 11 12) asSet.

	self assert: (self geohashCollection between: 'b' and: 'c') size = 8.
	self assert: (self geohashCollection between: 'b' and: 'c') = #(1 2 3 4 5 6 7 8) asSet.
	
	self assert: (self geohashCollection between: 'c' and: 'd') size = 8.
	self assert: (self geohashCollection between: 'c' and: 'd') = #(5 6 7 8 9 10 11 12) asSet.
	
	self assert: (self geohashCollection between: 'bb' and: 'bd') size = 3.
	self assert: (self geohashCollection between: 'bb' and: 'bd') = #( 2 3 4 ) asSet.
	
	self assert: (self geohashCollection between: 'bc' and: 'cc') size = 4.
	self assert: (self geohashCollection between: 'bc' and: 'cc') = #( 3 4 6 7 ) asSet.
	
	self assert: (self geohashCollection between: 'bc' and: 'c') size = 6.
	self assert: (self geohashCollection between: 'bc' and: 'c') = #( 3 4 5 6 7 8 ) asSet.
	
	self assert: (self geohashCollection between: 'b' and: 'cc') size = 6.
	self assert: (self geohashCollection between: 'b' and: 'cc') = #( 1 2 3 4 6 7 ) asSet.
	
	self assert: (self geohashCollection between: 'b' and: 'db') size = 9.
	self assert: (self geohashCollection between: 'b' and: 'db') = #( 1 2 3 4 5 6 7 8 10) asSet.
	
	self assert: (self geohashCollection between: 'b' and: 'dc') size = 10.
	self assert: (self geohashCollection between: 'b' and: 'dc') = #( 1 2 3 4 5 6 7 8 10 11 ) asSet.
	
	self assert: (self geohashCollection between: 'bd' and: 'dc') size = 7.
	self assert: (self geohashCollection between: 'bd' and: 'dc') = #( 4 5 6 7 8 10 11 ) asSet.