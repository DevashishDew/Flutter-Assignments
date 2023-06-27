part of 'current_weather_bloc.dart';

@immutable
abstract class CurrentWeatherEvent {}

class GetCurrentWeatherEvent extends CurrentWeatherEvent {
  final double lat;
  final double lon;

  GetCurrentWeatherEvent(this.lat, this.lon);
}
