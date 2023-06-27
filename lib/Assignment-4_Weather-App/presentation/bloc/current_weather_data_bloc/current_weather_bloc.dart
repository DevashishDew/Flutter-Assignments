import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/domain/usecases/get_current_weather_data.dart';
import 'package:meta/meta.dart';

part 'current_weather_event.dart';

part 'current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherData getCurrentWeatherData;

  CurrentWeatherBloc(this.getCurrentWeatherData)
      : super(CurrentWeatherInitial()) {
    on<GetCurrentWeatherEvent>((event, emit) async {
      emit(CurrentWeatherLoading());
      final result = await getCurrentWeatherData.execute(event.lat, event.lon);
      result.fold((error) => emit(CurrentWeatherError(error.message)),
          (data) => emit(CurrentWeatherHasData(data)));
    });
  }
}
