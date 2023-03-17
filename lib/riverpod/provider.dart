import 'package:status_saver/utils/packages.dart';

import 'notifier.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(false),
);
