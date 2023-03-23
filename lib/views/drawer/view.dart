part of 'controller.dart';

class DrawerView extends StatelessView<DrawerScreen, DrawerController> {
  const DrawerView(DrawerController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Dark theme',
                      ),
                      FutureBuilder(
                        future: LocalStorage.getDarkMode(),
                        builder: (context, AsyncSnapshot<bool?> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox.shrink();
                          } else {
                            return AnimatedSwitch(
                              initialValue: snapshot.data,
                              onTap: (bool value) {
                                LocalStorage.setDarkMode(value);
                                controller.ref
                                    .read(themeProvider.notifier)
                                    .updateTheme(value);
                              },
                              size: 25,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(
                    Icons.home,
                  ),
                  onTap: () => controller.toggleDrawer(),
                ),
                const Divider(),
                const ListTile(
                  title: Text('Rate Us'),
                  leading: Icon(
                    Icons.thumb_up_sharp,
                  ),
                ),
                ListTile(
                  title: const Text('Settings'),
                  leading: const Icon(
                    Icons.settings,
                  ),
                  onTap: () => controller.goToSettings(),
                ),
                const ListTile(
                  title: Text('Remove Ads'),
                  leading: Icon(
                    Icons.block,
                  ),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 15,
                    bottom: 10,
                  ),
                  child: Text(
                    'Check out other apps',
                  ),
                ),
                ListTile(
                  title: const Text('Igbo App'),
                  leading: Icon(
                    Platform.isAndroid ? Icons.android : Icons.apple,
                  ),
                  onTap: () => controller.launchApps(
                    'https://play.google.com/store/apps/details?id=com.pycify.igboapp',
                    mode: LaunchMode.externalApplication,
                  ),
                ),
                ListTile(
                  title: const Text('Igbo Calendar'),
                  leading: Icon(
                    Platform.isAndroid ? Icons.android : Icons.apple,
                  ),
                  onTap: () => controller.launchApps(
                    'https://play.google.com/store/apps/details?id=com.pycify.calendar',
                    mode: LaunchMode.externalApplication,
                  ),
                ),
                ListTile(
                  title: const Text('Math Quiz'),
                  leading: Icon(
                    Platform.isAndroid ? Icons.android : Icons.apple,
                  ),
                  onTap: () => controller.launchApps(
                    'https://play.google.com/store/apps/details?id=com.pycify.math_quiz',
                    mode: LaunchMode.externalApplication,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
