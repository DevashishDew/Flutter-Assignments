import 'package:flutter_assignments/Assignment-4_Weather-App/common/exception.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/base_error_response.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../ApiEndPoints.dart';

abstract class WeatherRemoteDatasource {
  Future<CurrentWeatherData> getCurrentWeatherData(double lat, double lon);

  Future<HourlyForecastData> getHourlyWeatherData(double lat, double lon);

  Future<DailyForecastData> getDailyWeatherData(double lat, double lon);
}

class WeatherRemoteDatasourceImpl extends WeatherRemoteDatasource {
  WeatherRemoteDatasourceImpl({required this.client});

  final http.Client client;

  @override
  Future<CurrentWeatherData> getCurrentWeatherData(
      double lat, double lon) async {
    final response = await client
        .get(Uri.parse(ApiEndPoints.getCurrentWeatherData(lat, lon)));

    if (response.statusCode == 200) {
      return CurrentWeatherData.fromJson(json.decode(response.body));
    } else {
      final errorResponse =
          BaseErrorResponse.fromJson(json.decode(response.body));
      throw ServerException(errorResponse.message);
    }
  }

  @override
  Future<HourlyForecastData> getHourlyWeatherData(
      double lat, double lon) async {
    final response = await client
        .get(Uri.parse(ApiEndPoints.getHourlyWeatherData(lat, lon)));

    if (response.statusCode == 200) {
      return HourlyForecastData.fromJson(json.decode(response.body));
    } else {
      final errorResponse =
          BaseErrorResponse.fromJson(json.decode(response.body));
      throw ServerException(errorResponse.message);
    }
  }

  @override
  Future<DailyForecastData> getDailyWeatherData(double lat, double lon) async {
    final response = await client
        .get(Uri.parse(ApiEndPoints.getDailyWeatherData(lat, lon)));

    if (response.statusCode == 200) {
      return DailyForecastData.fromJson(json.decode(response.body));
    } else {
      final errorResponse =
          BaseErrorResponse.fromJson(json.decode(response.body));
      throw ServerException(errorResponse.message);
    }
  }
}
