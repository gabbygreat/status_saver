import '../../utils/utils.dart';

part 'view.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => SettingsController();
}

class SettingsController extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SettingsView(this);
  }
}
