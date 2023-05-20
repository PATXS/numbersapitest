import 'package:shared_preferences/shared_preferences.dart';

class darkThemePref {
  static const usedarktheme = "darktheme";
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(usedarktheme, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(usedarktheme) ?? false;
  }
}
