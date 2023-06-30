part of 'geolocation_bloc.dart';

@immutable
abstract class GeolocationState {}

class GeolocationInitial extends GeolocationState {}

class GeolocationLoading extends GeolocationState {}

class GeolocationLoaded extends GeolocationState {
  final Position position;

  GeolocationLoaded({required this.position});
}

class GeolocationPermissionDenied extends GeolocationState {}

class GeolocationPermissionForever extends GeolocationState {}

class GeolocationError extends GeolocationState {}
