class CurrentWeatherData {
  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  int? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  int? _dt;
  Sys? _sys;
  int? _timezone;
  int? _id;
  String? _name;
  int? _cod;

  CurrentWeatherData(
      {Coord? coord,
        List<Weather>? weather,
        String? base,
        Main? main,
        int? visibility,
        Wind? wind,
        Clouds? clouds,
        int? dt,
        Sys? sys,
        int? timezone,
        int? id,
        String? name,
        int? cod}) {
    if (coord != null) {
      this._coord = coord;
    }
    if (weather != null) {
      this._weather = weather;
    }
    if (base != null) {
      this._base = base;
    }
    if (main != null) {
      this._main = main;
    }
    if (visibility != null) {
      this._visibility = visibility;
    }
    if (wind != null) {
      this._wind = wind;
    }
    if (clouds != null) {
      this._clouds = clouds;
    }
    if (dt != null) {
      this._dt = dt;
    }
    if (sys != null) {
      this._sys = sys;
    }
    if (timezone != null) {
      this._timezone = timezone;
    }
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (cod != null) {
      this._cod = cod;
    }
  }

  Coord? get coord => _coord;
  set coord(Coord? coord) => _coord = coord;
  List<Weather>? get weather => _weather;
  set weather(List<Weather>? weather) => _weather = weather;
  String? get base => _base;
  set base(String? base) => _base = base;
  Main? get main => _main;
  set main(Main? main) => _main = main;
  int? get visibility => _visibility;
  set visibility(int? visibility) => _visibility = visibility;
  Wind? get wind => _wind;
  set wind(Wind? wind) => _wind = wind;
  Clouds? get clouds => _clouds;
  set clouds(Clouds? clouds) => _clouds = clouds;
  int? get dt => _dt;
  set dt(int? dt) => _dt = dt;
  Sys? get sys => _sys;
  set sys(Sys? sys) => _sys = sys;
  int? get timezone => _timezone;
  set timezone(int? timezone) => _timezone = timezone;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get cod => _cod;
  set cod(int? cod) => _cod = cod;

  CurrentWeatherData.fromJson(Map<String, dynamic> json) {
    _coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = <Weather>[];
      json['weather'].forEach((v) {
        _weather!.add(new Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? new Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
    _clouds =
    json['clouds'] != null ? new Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._coord != null) {
      data['coord'] = this._coord!.toJson();
    }
    if (this._weather != null) {
      data['weather'] = this._weather!.map((v) => v.toJson()).toList();
    }
    data['base'] = this._base;
    if (this._main != null) {
      data['main'] = this._main!.toJson();
    }
    data['visibility'] = this._visibility;
    if (this._wind != null) {
      data['wind'] = this._wind!.toJson();
    }
    if (this._clouds != null) {
      data['clouds'] = this._clouds!.toJson();
    }
    data['dt'] = this._dt;
    if (this._sys != null) {
      data['sys'] = this._sys!.toJson();
    }
    data['timezone'] = this._timezone;
    data['id'] = this._id;
    data['name'] = this._name;
    data['cod'] = this._cod;
    return data;
  }
}

class Coord {
  num? _lon;
  num? _lat;

  Coord({num? lon, num? lat}) {
    if (lon != null) {
      this._lon = lon;
    }
    if (lat != null) {
      this._lat = lat;
    }
  }

  num? get lon => _lon;
  set lon(num? lon) => _lon = lon;
  num? get lat => _lat;
  set lat(num? lat) => _lat = lat;

  Coord.fromJson(Map<String, dynamic> json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this._lon;
    data['lat'] = this._lat;
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

class Main {
  num? _temp;
  num? _feelsLike;
  num? _tempMin;
  num? _tempMax;
  int? _pressure;
  int? _humidity;

  Main(
      {num? temp,
        num? feelsLike,
        num? tempMin,
        num? tempMax,
        int? pressure,
        int? humidity}) {
    if (temp != null) {
      this._temp = temp;
    }
    if (feelsLike != null) {
      this._feelsLike = feelsLike;
    }
    if (tempMin != null) {
      this._tempMin = tempMin;
    }
    if (tempMax != null) {
      this._tempMax = tempMax;
    }
    if (pressure != null) {
      this._pressure = pressure;
    }
    if (humidity != null) {
      this._humidity = humidity;
    }
  }

  num? get temp => _temp;
  set temp(num? temp) => _temp = temp;
  num? get feelsLike => _feelsLike;
  set feelsLike(num? feelsLike) => _feelsLike = feelsLike;
  num? get tempMin => _tempMin;
  set tempMin(num? tempMin) => _tempMin = tempMin;
  num? get tempMax => _tempMax;
  set tempMax(num? tempMax) => _tempMax = tempMax;
  int? get pressure => _pressure;
  set pressure(int? pressure) => _pressure = pressure;
  int? get humidity => _humidity;
  set humidity(int? humidity) => _humidity = humidity;

  int get tempInCelsius => (temp! - 273.15).truncate();
  int get minTempInCelsius => (_tempMin! - 273.15).truncate();
  int get maxTempInCelsius => (_tempMax! - 273.15).truncate();

  Main.fromJson(Map<String, dynamic> json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this._temp;
    data['feels_like'] = this._feelsLike;
    data['temp_min'] = this._tempMin;
    data['temp_max'] = this._tempMax;
    data['pressure'] = this._pressure;
    data['humidity'] = this._humidity;
    return data;
  }
}

class Wind {
  num? _speed;
  int? _deg;

  Wind({num? speed, int? deg}) {
    if (speed != null) {
      this._speed = speed;
    }
    if (deg != null) {
      this._deg = deg;
    }
  }

  num? get speed => _speed;
  set speed(num? speed) => _speed = speed;
  int? get deg => _deg;
  set deg(int? deg) => _deg = deg;

  Wind.fromJson(Map<String, dynamic> json) {
    _speed = json['speed'];
    _deg = json['deg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speed'] = this._speed;
    data['deg'] = this._deg;
    return data;
  }
}

class Clouds {
  int? _all;

  Clouds({int? all}) {
    if (all != null) {
      this._all = all;
    }
  }

  int? get all => _all;
  set all(int? all) => _all = all;

  Clouds.fromJson(Map<String, dynamic> json) {
    _all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this._all;
    return data;
  }
}

class Sys {
  int? _type;
  int? _id;
  String? _country;
  int? _sunrise;
  int? _sunset;

  Sys({int? type, int? id, String? country, int? sunrise, int? sunset}) {
    if (type != null) {
      this._type = type;
    }
    if (id != null) {
      this._id = id;
    }
    if (country != null) {
      this._country = country;
    }
    if (sunrise != null) {
      this._sunrise = sunrise;
    }
    if (sunset != null) {
      this._sunset = sunset;
    }
  }

  int? get type => _type;
  set type(int? type) => _type = type;
  int? get id => _id;
  set id(int? id) => _id = id;
  String? get country => _country;
  set country(String? country) => _country = country;
  int? get sunrise => _sunrise;
  set sunrise(int? sunrise) => _sunrise = sunrise;
  int? get sunset => _sunset;
  set sunset(int? sunset) => _sunset = sunset;

  Sys.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _id = json['id'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['id'] = this._id;
    data['country'] = this._country;
    data['sunrise'] = this._sunrise;
    data['sunset'] = this._sunset;
    return data;
  }
}
