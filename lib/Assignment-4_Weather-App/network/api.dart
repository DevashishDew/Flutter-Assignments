import 'dart:convert';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/current_weather_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/daily_forecast_data.dart';
import 'package:flutter_assignments/Assignment-4_Weather-App/data/models/hourly_forecast_data.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  // current : https://api.openweathermap.org/data/2.5/forecast?lat=28
  // .7041&lon=77.1025&cnt=3&appid=cc95d932d5a45d33a9527d5019475f2c
  // hourly : https://api.openweathermap.org/data/2.5/onecall?lat=28.7041&lon=77
  // .1025&exclude=current,minutely,daily&appid=cc95d932d5a45d33a9527d5019475f2c&units=metric
  // daily: https://api.openweathermap.org/data/2.5/onecall?lat=28.7041&lon=77
  // .1025&exclude=current,minutely,hourly,alerts&appid=cc95d932d5a45d33a9527d5019475f2c&units=metric

  static const String BASE_URL = 'https://api.openweathermap.org/data/2.5/';
  static const String APP_ID = 'cc95d932d5a45d33a9527d5019475f2c';
  static const double lat = 28.704;
  static const double lon = 77.1025;

  Future<CurrentWeatherData> getCurrentWeather(double lat, double lon) async {
    try {
      final response =
          await http.get(Uri.parse
            ('${BASE_URL}weather?lat=$lat&lon=$lon&appid=$APP_ID'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        CurrentWeatherData currentWeatherData = CurrentWeatherData.fromJson(body);
        return currentWeatherData;
      } else {
        throw "Unable to retrieve data.";
      }
    } catch (error) {
      throw Future.error(error);
    }
  }

  Future<HourlyForecastData> getHourlyForecastData(double lat, double lon) async {
    try {
      final response =
      await http.get(Uri.parse
        ('${BASE_URL}onecall?lat=$lat&lon=$lon&exclude=current,minutely,daily&appid=$APP_ID'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        HourlyForecastData hourlyForecastData = HourlyForecastData.fromJson(body);
        return hourlyForecastData;
      } else {
        throw "Unable to retrieve data.";
      }
    } catch (error) {
      throw Future.error(error);
    }
  }

  Future<DailyForecastData> getDailyForecastData(double lat, double lon) async {
    try {
      final response =
      await http.get(Uri.parse
        ('${BASE_URL}onecall?lat=$lat&lon=$lon&exclude=current,minutely,hourly&appid=$APP_ID'));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        DailyForecastData dailyForecastData = DailyForecastData.fromJson(body);
        return dailyForecastData;
      } else {
        throw "Unable to retrieve data.";
      }
    } catch (error) {
      throw Future.error(error);
    }
  }

  String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode.png';
}
