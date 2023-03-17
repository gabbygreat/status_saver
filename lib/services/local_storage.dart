import '/utils/utils.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage._init();
  static SharedPreferences? _prefs;
  LocalStorage._init();

  static String isDarkMode = 'isDarkMode';

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool?> getDarkMode() async {
    final pref = await instance.prefs;
    //true => dark
    //false || null => light
    return pref.getBool(isDarkMode);
  }

  static setDarkMode(bool value) async {
    final pref = await instance.prefs;
    return pref.setBool(isDarkMode, value);
  }
}
