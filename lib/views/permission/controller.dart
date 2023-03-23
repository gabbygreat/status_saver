import '../../utils/utils.dart';

part 'view.dart';

class PermissionScreen extends ConsumerStatefulWidget {
  const PermissionScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PermissionScreen> createState() => PermissionController();
}

class PermissionController extends ConsumerState<PermissionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await displayDialog();
    });
  }

  Future<void> displayDialog() async {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Theme.of(context).primaryColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Icon(
                Icons.sd_card,
                color: Colors.white,
                size: 50,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color.fromARGB(255, 23, 53, 87),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'The App needs Media Access permission to work properly.\n(Accessing and saving Statuses)\n\nPlease grant the permission to use the app',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
                        },
                        child: const Text('Exit'),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await requestPermission();
                        },
                        child: const Text('Grant'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PermissionView(this);
  }
}
