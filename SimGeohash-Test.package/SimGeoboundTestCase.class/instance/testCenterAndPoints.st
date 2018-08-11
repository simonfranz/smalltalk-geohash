tests
testCenterAndPoints

	self assert: (SimGeohash new: 'u0t94swuyz47') bound geohash = (SimGeohash new: 'u0t94swuyz47')  bound southwest asGeohash.
	self assert: (SimGeohash new: 'u0t94swuyz47') = (SimGeohash new: 'u0t94swuyz47') bound center asGeohash.