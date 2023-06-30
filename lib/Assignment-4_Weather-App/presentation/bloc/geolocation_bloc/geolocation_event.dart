part of 'geolocation_bloc.dart';

@immutable
abstract class GeolocationEvent {}

class LoadGeolocation extends GeolocationEvent {}

class UpdateGeolocation extends GeolocationEvent {
  final Position position;

  UpdateGeolocation({required this.position});
}
