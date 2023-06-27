import 'package:flutter_assignments/Assignment-4_Weather-App/common/failure.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';

abstract class WeatherRepository {
  Future<Either<Failure, CurrentWeatherData>> getCurrentWeatherData(
      double lat, double lon);

  Future<Either<Failure, HourlyForecastData>> getHourlyWeatherData(
      double lat, double lon);

  Future<Either<Failure, DailyForecastData>> getDailyWeatherData(
      double lat, double lon);
}
