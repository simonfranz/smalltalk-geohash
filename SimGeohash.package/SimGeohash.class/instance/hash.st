comparing
hash

	"<^hOf Number>"
	"Answer the hash of the receiver"

	^(self geohash
		inject: (WriteStream on: '')
		into: [ :theStream :eachCharacter |
			theStream
				nextPutAll: (eachCharacter asInteger - 35) asString;
				yourself]) contents asNumber