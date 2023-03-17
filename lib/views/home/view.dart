part of 'controller.dart';

class HomeView extends StatelessView<HomeScreen, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StatusServices.getTabNames(),
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('data');
        } else {
          return DefaultTabController(
            length: snapshot.data!.length,
            child: Scaffold(
              key: controller.scaffoldKey,
              drawer: DrawerScreen(
                scaffoldKey: controller.scaffoldKey,
              ),
              appBar: AppBar(
                title: const Text(
                  'Status Saver',
                ),
                backgroundColor: Theme.of(context).primaryColor,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.help_outline,
                    ),
                  ),
                ],
                bottom: TabBar(
                  isScrollable: true,
                  tabs: snapshot.data!
                      .map((e) => Tab(
                            text: e,
                          ))
                      .toList(),
                ),
              ),
              body: TabBarView(
                children: snapshot.data!
                    .map((e) => InterstitialScreen(
                          tabName: e.toLowerCase(),
                          position: snapshot.data!.indexOf(e),
                        ))
                    .toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
