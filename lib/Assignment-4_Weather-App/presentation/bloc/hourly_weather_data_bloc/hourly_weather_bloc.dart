import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_hourly_weather_data.dart';
import 'package:meta/meta.dart';

part 'hourly_weather_event.dart';

part 'hourly_weather_state.dart';

class HourlyWeatherBloc extends Bloc<HourlyWeatherEvent, HourlyWeatherState> {
  final GetHourlyWeatherData getHourlyWeatherData;

  HourlyWeatherBloc(this.getHourlyWeatherData) : super(HourlyWeatherInitial()) {
    on<GetHourlyWeatherEvent>((event, emit) async {
      emit(HourlyWeatherLoading());
      final result = await getHourlyWeatherData.execute(event.lat, event.lon);
      result.fold((error) => emit(HourlyWeatherError(error.message)),
          (data) => emit(HourlyWeatherData(data)));
    });
  }
}
