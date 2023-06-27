import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/weather_repository.dart';

import '../../common/failure.dart';
import 'package:dartz/dartz.dart';

class GetHourlyWeatherData {
  final WeatherRepository weatherRepository;

  GetHourlyWeatherData(this.weatherRepository);

  Future<Either<Failure, HourlyForecastData>> execute(
          double lat, double lon) =>
      weatherRepository.getHourlyWeatherData(lat, lon);
}
