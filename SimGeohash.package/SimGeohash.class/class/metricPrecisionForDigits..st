accessing
metricPrecisionForDigits: anInteger

	"<anInteger: iOf Integer,^hOf Number>"
	"Answer the precision in meter for a given length of geohash"

	| thePrecisions |
	thePrecisions := OrderedCollection new
		add: 5114966.626;
		add: 633811.082;
		add: 155672.897;
		add: 20015.087;
		add: 4892.577;
		add: 611.572;
		add: 155.673;
		add: 20.015;
		add: 4.781;
		add: 0.6;
		add: 0.156;
		add: 0.019;
		yourself.
	^thePrecisions at: anInteger ifAbsent: [thePrecisions last]