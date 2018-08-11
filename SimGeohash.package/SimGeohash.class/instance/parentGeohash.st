accessing
parentGeohash

	"<^iOf SimGeohash>"
	"Answer the parent Geohash"

	self geohash isEmpty
		ifTrue: [^nil].
	^self class new: (self geohash allButLast: 1)