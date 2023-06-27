part of 'current_weather_bloc.dart';

@immutable
abstract class CurrentWeatherState {}

class CurrentWeatherInitial extends CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {}

class CurrentWeatherError extends CurrentWeatherState {
  final String error;

  CurrentWeatherError(this.error);
}

class CurrentWeatherHasData extends CurrentWeatherState {
  final CurrentWeatherData currentWeatherData;

  CurrentWeatherHasData(this.currentWeatherData);
}
