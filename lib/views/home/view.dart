part of 'controller.dart';

class HomeView extends StatelessView<HomeScreen, HomeController> {
  const HomeView(HomeController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scaffoldBg,
        drawer: Container(),
        appBar: AppBar(
          title: const Text(
            'Status Saver',
          ),
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
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'IMAGES',
              ),
              Tab(
                text: 'VIDEOS',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            InterstitialScreen(),
            Text(
              'Video',
            ),
          ],
        ),
      ),
    );
  }
}
