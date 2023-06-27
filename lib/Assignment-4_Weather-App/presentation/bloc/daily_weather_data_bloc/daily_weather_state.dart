part of 'daily_weather_bloc.dart';

@immutable
abstract class DailyWeatherState {}

class DailyWeatherInitial extends DailyWeatherState {}

class DailyWeatherLoading extends DailyWeatherState {}

class DailyWeatherError extends DailyWeatherState {
  final String error;

  DailyWeatherError(this.error);
}

class DailyWeatherData extends DailyWeatherState {
  final DailyForecastData dailyForecastData;

  DailyWeatherData(this.dailyForecastData);
}
