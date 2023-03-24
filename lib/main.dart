import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final showPermission = await LocalStorage.getPermission();
  const permission = false;

  runApp(
    ProviderScope(
      child: MyApp(
        showPermission: showPermission,
        permission: permission,
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  final bool? showPermission;
  final bool permission;
  const MyApp({
    Key? key,
    required this.showPermission,
    required this.permission,
  }) : super(key: key);

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
      home: widget.showPermission == null
          ? const PermissionScreen()
          : widget.permission
              ? const InterstitialScreen(
                  child: GrantFolderScreen(),
                )
              : const HomeScreen(),
    );
  }
}
