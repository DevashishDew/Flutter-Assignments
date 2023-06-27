import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/weather_repository.dart';

import '../../common/failure.dart';
import 'package:dartz/dartz.dart';

class GetCurrentWeatherData {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherData(this.weatherRepository);

  Future<Either<Failure, CurrentWeatherData>> execute(
          double lat, double lon) =>
      weatherRepository.getCurrentWeatherData(lat, lon);
}
