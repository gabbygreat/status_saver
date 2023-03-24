import '/utils/utils.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage._init();
  static SharedPreferences? _prefs;
  LocalStorage._init();

  static String isDarkMode = 'isDarkMode';
  static String hasPermission = 'hasPermission';

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

  static Future<bool> setDarkMode(bool value) async {
    final pref = await instance.prefs;
    return pref.setBool(isDarkMode, value);
  }

  static Future<bool?> getPermission() async {
    final pref = await instance.prefs;
    return pref.getBool(hasPermission);
  }

  static Future<bool> setPermission(bool value) async {
    final pref = await instance.prefs;
    return pref.setBool(hasPermission, value);
  }
}
