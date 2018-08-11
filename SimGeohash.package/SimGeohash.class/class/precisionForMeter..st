accessing
precisionForMeter: anInteger

	"<anInteger: iOf Integer, ^hOf Number>"
	"Answer the needed precision for a @anInteger in meter"

	1 to: 12 do: [ :eachPrecision |
		(self metricPrecisionForDigits: eachPrecision) < anInteger
			ifTrue: [^eachPrecision]].
	^12