
import '../../utils/utils.dart';

part 'view.dart';

class DrawerScreen extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  
  const DrawerScreen({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  ConsumerState<DrawerScreen> createState() => DrawerController();
}

class DrawerController extends ConsumerState<DrawerScreen> {
  bool? initialMode;

  void toggleDrawer() {
    if (widget.scaffoldKey.currentState!.isDrawerOpen) {
      widget.scaffoldKey.currentState!.closeDrawer();
    } else {
      widget.scaffoldKey.currentState!.openDrawer();
    }
  }

  void goToSettings() async {
    widget.scaffoldKey.currentState!.closeDrawer();
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    LocalStorage.getDarkMode().then(
      (value) => setState(() => initialMode = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerView(this);
  }
}
