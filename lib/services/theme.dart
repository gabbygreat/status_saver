import '../utils/utils.dart';
class AppTheme {
  static ThemeData themeData(theme) => ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        brightness: theme ? Brightness.dark : Brightness.light,
      );
}
