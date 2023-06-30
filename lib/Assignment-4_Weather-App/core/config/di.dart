import 'package:flutter_assignments/Assignment-4_Weather-App/data/data_sources/remote_data_source.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/repository/geolocation_repository.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/repository/weather_repository_impl.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/base_geo_location_repository.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/repository/weather_repository.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_daily_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_geo_location.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_hourly_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/current_weather_data_bloc/current_weather_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/daily_weather_data_bloc/daily_weather_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/geolocation_bloc/geolocation_bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/presentation/bloc/hourly_weather_data_bloc/hourly_weather_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => GeolocationBloc(locator()));
  locator.registerFactory(() => CurrentWeatherBloc(locator()));
  locator.registerFactory(() => HourlyWeatherBloc(locator()));
  locator.registerFactory(() => DailyWeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetGeolocation(locator()));
  locator.registerLazySingleton(() => GetCurrentWeatherData(locator()));
  locator.registerLazySingleton(() => GetHourlyWeatherData(locator()));
  locator.registerLazySingleton(() => GetDailyWeatherData(locator()));

  // repository

  locator.registerLazySingleton<BaseGeoLocationRepository>(
        () => GeolocationRepository(),
  );

  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDatasource: locator()),
  );

  // data source
  locator.registerLazySingleton<WeatherRemoteDatasource>(
    () => WeatherRemoteDatasourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
