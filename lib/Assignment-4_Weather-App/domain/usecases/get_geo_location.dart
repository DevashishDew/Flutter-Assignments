import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/base_geo_location_repository.dart';
import 'package:geolocator/geolocator.dart';

class GetGeolocation {
  final BaseGeoLocationRepository geoLocationRepository;

  GetGeolocation(this.geoLocationRepository);

  Future<Position> execute() {
    return geoLocationRepository.getCurrentLocation();
  }

}
