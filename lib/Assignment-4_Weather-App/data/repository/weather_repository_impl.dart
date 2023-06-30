import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/common/exception.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/common/failure.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/data_sources/remote_data_source.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDatasource weatherRemoteDatasource;

  WeatherRepositoryImpl({required this.weatherRemoteDatasource});

  @override
  Future<Either<Failure, CurrentWeatherData>> getCurrentWeatherData(
      double lat, double lon) async {
    try {
      final result =
          await weatherRemoteDatasource.getCurrentWeatherData(lat, lon);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, HourlyForecastData>> getHourlyWeatherData(
      double lat, double lon) async {
    try {
      final result =
          await weatherRemoteDatasource.getHourlyWeatherData(lat, lon);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, DailyForecastData>> getDailyWeatherData(
      double lat, double lon) async {
    try {
      final result =
          await weatherRemoteDatasource.getDailyWeatherData(lat, lon);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
