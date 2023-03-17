part of 'controller.dart';

class BannerView extends StatelessView<BannerScreen, BannerController> {
  const BannerView(BannerController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (controller._banner != null)
          SizedBox(
            height: controller._banner!.size.height.toDouble(),
            width: controller._banner!.size.width.toDouble(),
            child: AdWidget(
              ad: controller._banner!,
            ),
          )
      ],
    );
  }
}
