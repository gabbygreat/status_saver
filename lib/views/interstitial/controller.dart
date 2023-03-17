import '../../utils/utils.dart';

part 'view.dart';

class InterstitialScreen extends StatefulWidget {
  final String tabName;
  final int position;
  const InterstitialScreen({
    Key? key,
    required this.tabName,
    required this.position,
  }) : super(key: key);

  @override
  State<InterstitialScreen> createState() => InterstitialController();
}

class InterstitialController extends State<InterstitialScreen> {
  InterstitialAd? _interstitialAd;

  /// Loads an interstitial ad.
  Future<void> loadAd() async {
    await InterstitialAd.load(
      adUnitId: AdMobService.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) async {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            // Called when the ad showed the full screen content.
            onAdShowedFullScreenContent: (ad) {},
            // Called when an impression occurs on the ad.
            onAdImpression: (ad) {},
            // Called when the ad failed to show full screen content.
            onAdFailedToShowFullScreenContent: (ad, err) async {
              // Dispose the ad here to free resources.
              await ad.dispose();
            },
            // Called when the ad dismissed full screen content.
            onAdDismissedFullScreenContent: (ad) async {
              // Dispose the ad here to free resources.
              await ad.dispose();
            },
            // Called when a click is recorded for an ad.
            onAdClicked: (ad) {},
          );

          debugPrint('$ad loaded.');
          // Keep a reference to the ad so you can show it later.
          _interstitialAd = ad;
          await _interstitialAd?.show();
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // loadAd();
  }

  @override
  Widget build(BuildContext context) {
    StatusServices.getTabContent(widget.position);

    return InterstitialView(this);
  }
}
