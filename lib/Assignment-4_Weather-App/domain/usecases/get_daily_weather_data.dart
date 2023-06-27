import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/weather_repository.dart';

import '../../common/failure.dart';
import 'package:dartz/dartz.dart';

class GetDailyWeatherData {
  final WeatherRepository weatherRepository;

  GetDailyWeatherData(this.weatherRepository);

  Future<Either<Failure, DailyForecastData>> execute(
          double lat, double lon) =>
      weatherRepository.getDailyWeatherData(lat, lon);
}
