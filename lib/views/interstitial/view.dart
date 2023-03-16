part of 'controller.dart';

class InterstitialView
    extends StatelessView<InterstitialScreen, InterstitialController> {
  const InterstitialView(InterstitialController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    controller._interstitialAd?.show();
    return Container();
  }
}
