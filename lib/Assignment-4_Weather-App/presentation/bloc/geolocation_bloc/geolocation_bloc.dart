import 'package:bloc/bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_geo_location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'geolocation_event.dart';

part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GetGeolocation getGeolocation;

  GeolocationBloc(this.getGeolocation) : super(GeolocationInitial()) {
    on<GeolocationEvent>((event, emit) async {
      if (event is LoadGeolocation) {
        emit(GeolocationLoading());

        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            print('Location permissions are denied');
            emit(GeolocationPermissionDenied());
          } else if (permission == LocationPermission.deniedForever) {
            print("'Location permissions are permanently denied");
            emit(GeolocationPermissionForever());
          } else {
            print("GPS Location service is granted");
            Position position = await getGeolocation.execute();
            print(position.longitude);
            print(position.latitude);

            emit(GeolocationLoaded(position: position));
          }
        } else {
          print("GPS Location permission granted.");
          Position position = await getGeolocation.execute();
          print(position.longitude);
          print(position.latitude);

          emit(GeolocationLoaded(position: position));
        }
      }
    });
  }
}
