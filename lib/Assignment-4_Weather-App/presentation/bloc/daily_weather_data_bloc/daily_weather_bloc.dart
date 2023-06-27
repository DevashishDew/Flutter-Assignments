import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_daily_weather_data.dart';
import 'package:meta/meta.dart';

part 'daily_weather_event.dart';

part 'daily_weather_state.dart';

class DailyWeatherBloc extends Bloc<DailyWeatherEvent, DailyWeatherState> {
  final GetDailyWeatherData getDailyWeatherData;

  DailyWeatherBloc(this.getDailyWeatherData) : super(DailyWeatherInitial()) {
    on<GetDailyWeatherDataEvent>((event, emit) async {
      emit(DailyWeatherLoading());
      final result = await getDailyWeatherData.execute(event.lat, event.lon);
      result.fold((error) => emit(DailyWeatherError(error.message)),
          (data) => emit(DailyWeatherData(data)));
    });
  }
}
