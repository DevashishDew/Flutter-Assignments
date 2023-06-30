import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/base_geo_location_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository extends BaseGeoLocationRepository {
  @override
  Future<Position> getCurrentLocation() {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
