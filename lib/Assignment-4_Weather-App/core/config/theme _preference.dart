import 'package:shared_preferences/shared_preferences.dart';

class MyThemePreferences {
  static const THEME_KEY = "theme_key";
  late SharedPreferences sharedPreferences;

  Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  setTheme(bool value) async {
    sharedPreferences.setBool(THEME_KEY, value);
  }

  Future<bool> getTheme() async {
    return sharedPreferences.getBool(THEME_KEY) ?? false;
  }
}
