# smalltalk-geohash
Pharo package to decode/encode Geohashes to/from latitude and longitude (geolocation). See http://en.wikipedia.org/wiki/Geohash
Geohash can be used for a nerby search when working with thousands of locations.

## Simple
Convert a given geolocation (latitude, longitude) to a geohash. 
```
theGeolocation := SimGeolocation longitude: 7.853801 latitude: 48.013854.
theGeohash := theGeolocation asGeohash.
```
## Precision
The longer the hash is, the more precisely it describes a rectangle on a map. The precision can be selected just as easily.
Just search for the distance you want to get the locations (in meter). Then you will receive a Geohash with the needed precision.
```
theGeolocation := SimGeolocation longitude: 7.853801 latitude: 48.013854.
thePrecisionDigits := SimGeohash precisionForMeter: 2000.
theGeohash := theGeolocation asGeohashWithPrecision: thePrecisionDigits.
```
## Neighbours
Geohash is calculated on the base of ```0123456789bcdefghjkmnpqrstuvwxyz```. Because of the hashing algorithm not always e.g. Geohash "9q8yd" is not the neightbour of "89q8yc".
The geohash describes a rectangle where the given location is somewhere in between. So for the search of the nearby locations we need to get the neighbour hashes

```
(SimGeohash new: 'u0t94') neighbours.
```
After that you receive all the neighbour hashes

```
u0t93	u0t96	u0t97
u0t91	u0t94	u0t95
u0t8c	u0t8f	u0t8g
```

## Bounds
To receive the bounding coordinates of the current geohash you easyly can get those bound.
You will need to also receive the center of the bound, so you can easily get the center of the geohash. Indeed this will be performed if you decode a heohash to get a geolocation
```
theGeobound := (SimGeohash new: 'u0t94') bound.
theGeolocation := theGeobound center
(SimGeohash new: 'u0t94') asGeolocation = theGeolocation
```
This will result into  ```48.01, 7.844```

## Representations
The geohash is quite complex to understand, but each letter is the 5 bit result of a calculation. To get the binary representation you can get this representation.
```(SimGeohash new: 'u0t94') asBinaryNumberString = '1101000000110010100100100'```
If you will do the math you can see that
```11010 => u
00000 => 0
11001 => t
01001 => 9
00100 => 4
```

## Geohash-ranges
Its useful to get all ranges between 2 geohases.  
```
SimGeohash  geohashesBetween: (SimGeohash new: 'u0t92')  and: (SimGeohash new: 'u0t94') 
=> Results in Geohashes: u0t92, u0t93, u0t94
```
## Searchranges.
To find the nearest locations to a given geolocation, you first get the geohash for the specific location; afterwards all neighbour geohashes.
Because of the reason that nearby characters are not always the neighbour geohash in the worst case you have to do 9 queries against the database.
This can be improved by searching for ranges.
Instead of having to make 9 requests, we can reduce the number of requests to normally 3-5 with searchranges.
TO stay in the example of the neighbours on the neighbour-section
```
theSearchRanges := (SimGeohash new: 'u0t94') searchRanges.
(SimGeohash new: 'u0t94') searchRanges
u0t8c -> u0t8d
u0t8f -> u0t8h
u0t91 -> u0t98
```
You will end up having some more geohashes in the resultSet, but therefore you have decreased the query-count by 66%.
After that you have to calculate the distance between the given location and the locations in the resultset

## Distance of two geolocations
To get the distance between two geolocation you can also use the geolocation in the package. Therefore the [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula) is used.
```
theStartGeolocation := SimGeolocation fromString: '48.01473,7.8519233'.
theEndGeolocation := SimGeolocation fromString: '48.008112,7.8481903'.
theStartGeolocation distanceTo: theEndGeolocation 
```


