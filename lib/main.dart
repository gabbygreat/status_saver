import 'utils/utils.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    LocalStorage.getDarkMode().then(
      (value) => ref.read(themeProvider.notifier).updateTheme(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Status Saver',
      themeMode: theme ? ThemeMode.light : ThemeMode.dark,
      theme: AppTheme.themeData(theme),
      darkTheme: AppTheme.themeData(theme),
      home: const PermissionScreen(),
    );
  }
}
