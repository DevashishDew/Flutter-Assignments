part of 'daily_weather_bloc.dart';

@immutable
abstract class DailyWeatherEvent {}

class GetDailyWeatherDataEvent extends DailyWeatherEvent{
  final double lat;
  final double lon;

  GetDailyWeatherDataEvent(this.lat, this.lon);
}