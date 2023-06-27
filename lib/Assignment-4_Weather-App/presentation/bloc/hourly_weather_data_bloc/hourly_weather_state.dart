part of 'hourly_weather_bloc.dart';

@immutable
abstract class HourlyWeatherState {}

class HourlyWeatherInitial extends HourlyWeatherState {}

class HourlyWeatherLoading extends HourlyWeatherState {}

class HourlyWeatherError extends HourlyWeatherState {
  final String error;

  HourlyWeatherError(this.error);
}

class HourlyWeatherData extends HourlyWeatherState {
  final HourlyForecastData hourlyForecastData;

  HourlyWeatherData(this.hourlyForecastData);
}
