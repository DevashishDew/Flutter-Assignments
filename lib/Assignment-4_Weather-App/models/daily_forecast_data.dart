import 'package:intl/intl.dart';

class DailyForecastData {
  num? _lat;
  num? _lon;
  String? _timezone;
  int? _timezoneOffset;
  List<Daily>? _daily;

  DailyForecastData(
      {num? lat,
        num? lon,
        String? timezone,
        int? timezoneOffset,
        List<Daily>? daily}) {
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
    if (daily != null) {
      this._daily = daily;
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
  List<Daily>? get daily => _daily;
  set daily(List<Daily>? daily) => _daily = daily;

  DailyForecastData.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lon = json['lon'];
    _timezone = json['timezone'];
    _timezoneOffset = json['timezone_offset'];
    if (json['daily'] != null) {
      _daily = <Daily>[];
      json['daily'].forEach((v) {
        _daily!.add(new Daily.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this._lat;
    data['lon'] = this._lon;
    data['timezone'] = this._timezone;
    data['timezone_offset'] = this._timezoneOffset;
    if (this._daily != null) {
      data['daily'] = this._daily!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Daily {
  int? _dt;
  int? _sunrise;
  int? _sunset;
  int? _moonrise;
  int? _moonset;
  num? _moonPhase;
  Temp? _temp;
  FeelsLike? _feelsLike;
  int? _pressure;
  int? _humidity;
  num? _dewPoint;
  num? _windSpeed;
  int? _windDeg;
  num? _windGust;
  List<Weather>? _weather;
  int? _clouds;
  num? _pop;
  num? _rain;
  num? _uvi;

  Daily(
      {int? dt,
        int? sunrise,
        int? sunset,
        int? moonrise,
        int? moonset,
        num? moonPhase,
        Temp? temp,
        FeelsLike? feelsLike,
        int? pressure,
        int? humidity,
        num? dewPoint,
        num? windSpeed,
        int? windDeg,
        num? windGust,
        List<Weather>? weather,
        int? clouds,
        num? pop,
        num? rain,
        num? uvi}) {
    if (dt != null) {
      this._dt = dt;
    }
    if (sunrise != null) {
      this._sunrise = sunrise;
    }
    if (sunset != null) {
      this._sunset = sunset;
    }
    if (moonrise != null) {
      this._moonrise = moonrise;
    }
    if (moonset != null) {
      this._moonset = moonset;
    }
    if (moonPhase != null) {
      this._moonPhase = moonPhase;
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
    if (clouds != null) {
      this._clouds = clouds;
    }
    if (pop != null) {
      this._pop = pop;
    }
    if (rain != null) {
      this._rain = rain;
    }
    if (uvi != null) {
      this._uvi = uvi;
    }
  }

  int? get dt => _dt;
  set dt(int? dt) => _dt = dt;
  int? get sunrise => _sunrise;
  set sunrise(int? sunrise) => _sunrise = sunrise;
  int? get sunset => _sunset;
  set sunset(int? sunset) => _sunset = sunset;
  int? get moonrise => _moonrise;
  set moonrise(int? moonrise) => _moonrise = moonrise;
  int? get moonset => _moonset;
  set moonset(int? moonset) => _moonset = moonset;
  num? get moonPhase => _moonPhase;
  set moonPhase(num? moonPhase) => _moonPhase = moonPhase;
  Temp? get temp => _temp;
  set temp(Temp? temp) => _temp = temp;
  FeelsLike? get feelsLike => _feelsLike;
  set feelsLike(FeelsLike? feelsLike) => _feelsLike = feelsLike;
  int? get pressure => _pressure;
  set pressure(int? pressure) => _pressure = pressure;
  int? get humidity => _humidity;
  set humidity(int? humidity) => _humidity = humidity;
  num? get dewPoint => _dewPoint;
  set dewPoint(num? dewPoint) => _dewPoint = dewPoint;
  num? get windSpeed => _windSpeed;
  set windSpeed(num? windSpeed) => _windSpeed = windSpeed;
  int? get windDeg => _windDeg;
  set windDeg(int? windDeg) => _windDeg = windDeg;
  num? get windGust => _windGust;
  set windGust(num? windGust) => _windGust = windGust;
  List<Weather>? get weather => _weather;
  set weather(List<Weather>? weather) => _weather = weather;
  int? get clouds => _clouds;
  set clouds(int? clouds) => _clouds = clouds;
  num? get pop => _pop;
  set pop(num? pop) => _pop = pop;
  num? get rain => _rain;
  set rain(num? rain) => _rain = rain;
  num? get uvi => _uvi;
  set uvi(num? uvi) => _uvi = uvi;


  String get forecastDay => DateFormat.EEEE()
      .format(DateTime.fromMillisecondsSinceEpoch(dt! * 1000))
      .toString();

  Daily.fromJson(Map<String, dynamic> json) {
    _dt = json['dt'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    _feelsLike = json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : null;
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _dewPoint = json['dew_point'];
    _windSpeed = json['wind_speed'];
    _windDeg = json['wind_deg'];
    _windGust = json['wind_gust'];
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(new Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'];
    _pop = json['pop'];
    _rain = json['rain'];
    _uvi = json['uvi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this._dt;
    data['sunrise'] = this._sunrise;
    data['sunset'] = this._sunset;
    data['moonrise'] = this._moonrise;
    data['moonset'] = this._moonset;
    data['moon_phase'] = this._moonPhase;
    if (this._temp != null) {
      data['temp'] = this._temp!.toJson();
    }
    if (this._feelsLike != null) {
      data['feels_like'] = this._feelsLike!.toJson();
    }
    data['pressure'] = this._pressure;
    data['humidity'] = this._humidity;
    data['dew_point'] = this._dewPoint;
    data['wind_speed'] = this._windSpeed;
    data['wind_deg'] = this._windDeg;
    data['wind_gust'] = this._windGust;
    if (this._weather != null) {
      data['weather'] = this._weather!.map((v) => v.toJson()).toList();
    }
    data['clouds'] = this._clouds;
    data['pop'] = this._pop;
    data['rain'] = this._rain;
    data['uvi'] = this._uvi;
    return data;
  }
}

class Temp {
  num? _day;
  num? _min;
  num? _max;
  num? _night;
  num? _eve;
  num? _morn;

  Temp(
      {num? day,
        num? min,
        num? max,
        num? night,
        num? eve,
        num? morn}) {
    if (day != null) {
      this._day = day;
    }
    if (min != null) {
      this._min = min;
    }
    if (max != null) {
      this._max = max;
    }
    if (night != null) {
      this._night = night;
    }
    if (eve != null) {
      this._eve = eve;
    }
    if (morn != null) {
      this._morn = morn;
    }
  }

  num? get day => _day;
  set day(num? day) => _day = day;
  num? get min => _min;
  set min(num? min) => _min = min;
  num? get max => _max;
  set max(num? max) => _max = max;
  num? get night => _night;
  set night(num? night) => _night = night;
  num? get eve => _eve;
  set eve(num? eve) => _eve = eve;
  num? get morn => _morn;
  set morn(num? morn) => _morn = morn;


  int get minTempInCelsius => (min! - 273.15).truncate();
  int get maxTempInCelsius => (max! - 273.15).truncate();

  Temp.fromJson(Map<String, dynamic> json) {
    _day = json['day'];
    _min = json['min'];
    _max = json['max'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['min'] = this._min;
    data['max'] = this._max;
    data['night'] = this._night;
    data['eve'] = this._eve;
    data['morn'] = this._morn;
    return data;
  }
}

class FeelsLike {
  num? _day;
  num? _night;
  num? _eve;
  num? _morn;

  FeelsLike({num? day, num? night, num? eve, num? morn}) {
    if (day != null) {
      this._day = day;
    }
    if (night != null) {
      this._night = night;
    }
    if (eve != null) {
      this._eve = eve;
    }
    if (morn != null) {
      this._morn = morn;
    }
  }

  num? get day => _day;
  set day(num? day) => _day = day;
  num? get night => _night;
  set night(num? night) => _night = night;
  num? get eve => _eve;
  set eve(num? eve) => _eve = eve;
  num? get morn => _morn;
  set morn(num? morn) => _morn = morn;

  FeelsLike.fromJson(Map<String, dynamic> json) {
    _day = json['day'];
    _night = json['night'];
    _eve = json['eve'];
    _morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this._day;
    data['night'] = this._night;
    data['eve'] = this._eve;
    data['morn'] = this._morn;
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
