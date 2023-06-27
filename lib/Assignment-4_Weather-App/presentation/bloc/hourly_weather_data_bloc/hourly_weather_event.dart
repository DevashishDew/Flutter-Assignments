part of 'hourly_weather_bloc.dart';

@immutable
abstract class HourlyWeatherEvent {}

class GetHourlyWeatherEvent extends HourlyWeatherEvent{
  final double lat;
  final double lon;

  GetHourlyWeatherEvent(this.lat, this.lon);
}
