class ApiEndPoints {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/';
  static const APP_ID = 'cc95d932d5a45d33a9527d5019475f2c';

  static getCurrentWeatherData(double lat, double lon) =>
      '${BASE_URL}weather?lat=$lat&lon=$lon&appid=$APP_ID';

  static getHourlyWeatherData(double lat, double lon) =>
      '${BASE_URL}onecall?lat=$lat&lon=$lon&exclude=current,minutely,daily&appid=$APP_ID';

  static getDailyWeatherData(double lat, double lon) =>
      '${BASE_URL}onecall?lat=$lat&lon=$lon&exclude=current,minutely,hourly&appid=$APP_ID';

  static weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode.png';
}
