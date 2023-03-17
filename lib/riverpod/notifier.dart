import 'package:status_saver/utils/packages.dart';

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier(super.state);

  void updateTheme(bool? value) => state = value ?? false;
}
