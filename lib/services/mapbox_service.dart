import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:moniepoint_real_estate/location.dart';

class MapBoxService {
  Location current = Location(
    lat: 51.509364,
    long: -0.128928,
  );

  Location _pointAtDistance(
      Location inputCoords,
      double distance,
      ) {
    const earthRadius = 6371.0;
    const twoPi = 2 * pi;
    const threePi = 3 * pi;

    Location toRadians(Location coords) {
      return Location(
        lat: coords.lat * pi / 180,
        long: coords.long * pi / 180,
      );
    }

    Location toDegrees(Location coords) {
      return Location(
        lat: coords.lat * 180 / pi,
        long: coords.long * 180 / pi,
      );
    }

    final coords = toRadians(inputCoords);
    final sinLat = sin(coords.lat);
    final cosLat = cos(coords.lat);

    final bearing = Random().nextDouble() * twoPi;
    final theta = distance / earthRadius;
    final sinBearing = sin(bearing);
    final cosBearing = cos(bearing);
    final sinTheta = sin(theta);
    final cosTheta = cos(theta);

    final newlat = asin(sinLat * cosTheta + cosLat * sinTheta * cosBearing);
    final newLong = coords.long +
        atan2(sinBearing * sinTheta * cosLat, cosTheta - sinLat * sin(newlat));

    final normalizedLong = ((newLong + threePi) % twoPi) - pi;

    return toDegrees(Location(
      lat: newlat,
      long: normalizedLong,
    ));
  }

  Location pointInCircle(
      Location coord,
      double distance,
      ) {
    final rnd = Random().nextDouble();
    final randomDist = sqrt(rnd) * distance;
    return _pointAtDistance(coord, randomDist);
  }
  List<Location>  getRandomLocations() {
    List<Location> locations = [];
    for (int i = 0; i < 6; i++) {
      final result = pointInCircle(current, 25);
      locations.add(result);
    }
    return locations;
  }


}