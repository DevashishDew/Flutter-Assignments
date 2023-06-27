import 'package:intl/intl.dart';

class HourlyForecastData {
  num? _lat;
  num? _lon;
  String? _timezone;
  int? _timezoneOffset;
  List<Hourly>? _hourly;

  HourlyForecastData(
      {num? lat,
      num? lon,
      String? timezone,
      int? timezoneOffset,
      List<Hourly>? hourly}) {
    if (lat != null) {
      this._lat = lat;
    }
    if (lon != null) {
      this._lon = lon;
    }
    if (timezone != null) {
      this._timezone = timezone;
    }
    if (timezoneOffset != null) {
      this._timezoneOffset = timezoneOffset;
    }
    if (hourly != null) {
      this._hourly = hourly;
    }
  }

  num? get lat => _lat;

  set lat(num? lat) => _lat = lat;

  num? get lon => _lon;

  set lon(num? lon) => _lon = lon;

  String? get timezone => _timezone;

  set timezone(String? timezone) => _timezone = timezone;

  int? get timezoneOffset => _timezoneOffset;

  set timezoneOffset(int? timezoneOffset) => _timezoneOffset = timezoneOffset;

  List<Hourly>? get hourly => _hourly;

  set hourly(List<Hourly>? hourly) => _hourly = hourly;

  HourlyForecastData.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lon = json['lon'];
    _timezone = json['timezone'];
    _timezoneOffset = json['timezone_offset'];
    if (json['hourly'] != null) {
      _hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        _hourly!.add(new Hourly.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    data['timezone'] = this._timezone;
    data['timezone_offset'] = this._timezoneOffset;
    if (this._hourly != null) {
      data['hourly'] = this._hourly!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Hourly {
  int? _dt;
  num? _temp;
  num? _feelsLike;
  int? _pressure;
  int? _humidity;
  num? _dewPoint;
  num? _uvi;
  int? _clouds;
  int? _visibility;
  num? _windSpeed;
  int? _windDeg;
  num? _windGust;
  List<Weather>? _weather;
  num? _pop;

  Hourly(
      {int? dt,
      num? temp,
      num? feelsLike,
      int? pressure,
      int? humidity,
      num? dewPoint,
      num? uvi,
      int? clouds,
      int? visibility,
      num? windSpeed,
      int? windDeg,
      num? windGust,
      List<Weather>? weather,
      num? pop}) {
    if (dt != null) {
      this._dt = dt;
    }
    if (temp != null) {
      this._temp = temp;
    }
    if (feelsLike != null) {
      this._feelsLike = feelsLike;
    }
    if (pressure != null) {
      this._pressure = pressure;
    }
    if (humidity != null) {
      this._humidity = humidity;
    }
    if (dewPoint != null) {
      this._dewPoint = dewPoint;
    }
    if (uvi != null) {
      this._uvi = uvi;
    }
    if (clouds != null) {
      this._clouds = clouds;
    }
    if (visibility != null) {
      this._visibility = visibility;
    }
    if (windSpeed != null) {
      this._windSpeed = windSpeed;
    }
    if (windDeg != null) {
      this._windDeg = windDeg;
    }
    if (windGust != null) {
      this._windGust = windGust;
    }
    if (weather != null) {
      this._weather = weather;
    }
    if (pop != null) {
      this._pop = pop;
    }
  }

  int? get dt => _dt;

  set dt(int? dt) => _dt = dt;

  num? get temp => _temp;

  set temp(num? temp) => _temp = temp;

  num? get feelsLike => _feelsLike;

  set feelsLike(num? feelsLike) => _feelsLike = feelsLike;

  int? get pressure => _pressure;

  set pressure(int? pressure) => _pressure = pressure;

  int? get humidity => _humidity;

  set humidity(int? humidity) => _humidity = humidity;

  num? get dewPoint => _dewPoint;

  set dewPoint(num? dewPoint) => _dewPoint = dewPoint;

  num? get uvi => _uvi;

  set uvi(num? uvi) => _uvi = uvi;

  int? get clouds => _clouds;

  set clouds(int? clouds) => _clouds = clouds;

  int? get visibility => _visibility;

  set visibility(int? visibility) => _visibility = visibility;

  num? get windSpeed => _windSpeed;

  set windSpeed(num? windSpeed) => _windSpeed = windSpeed;

  int? get windDeg => _windDeg;

  set windDeg(int? windDeg) => _windDeg = windDeg;

  num? get windGust => _windGust;

  set windGust(num? windGust) => _windGust = windGust;

  List<Weather>? get weather => _weather;

  set weather(List<Weather>? weather) => _weather = weather;

  num? get pop => _pop;

  set pop(num? pop) => _pop = pop;

  int get tempInCelsius => (temp! - 273.15).truncate();

  String get foreCastTime => DateFormat.Hm()
      .format(DateTime.fromMillisecondsSinceEpoch(dt! * 1000))
      .toString();

  Hourly.fromJson(Map<String, dynamic> json) {
    _dt = json['dt'];
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _uvi = json['uvi'];
    _clouds = json['clouds'];
    _visibility = json['visibility'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'];
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(new Weather.fromJson(v));
      });
    }
    _pop = json['pop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this._dt;
    data['temp'] = this._temp;
    data['feels_like'] = this._feelsLike;
    data['pressure'] = this._pressure;
    data['humidity'] = this._humidity;
    data['dew_point'] = this._dewPoint;
    data['uvi'] = this._uvi;
    data['clouds'] = this._clouds;
    data['visibility'] = this._visibility;
    data['wind_speed'] = this._windSpeed;
    data['wind_deg'] = this._windDeg;
    data['wind_gust'] = this._windGust;
    if (this._weather != null) {
      data['weather'] = this._weather!.map((v) => v.toJson()).toList();
    }
    data['pop'] = this._pop;
    return data;
  }
}

class Weather {
  int? _id;
  String? _main;
  String? _description;
  String? _icon;

  Weather({int? id, String? main, String? description, String? icon}) {
    if (id != null) {
      this._id = id;
    }
    if (main != null) {
      this._main = main;
    }
    if (description != null) {
      this._description = description;
    }
    if (icon != null) {
      this._icon = icon;
    }
  }

  int? get id => _id;

  set id(int? id) => _id = id;

  String? get main => _main;

  set main(String? main) => _main = main;

  String? get description => _description;

  set description(String? description) => _description = description;

  String? get icon => _icon;

  set icon(String? icon) => _icon = icon;

  Weather.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['main'] = this._main;
    data['description'] = this._description;
    data['icon'] = this._icon;
    return data;
  }
}
