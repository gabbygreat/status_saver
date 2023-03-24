import 'package:status_saver/utils/utils.dart';

class AdMobService {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4646509825054836/1258584037';
    } else {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-4646509825054836/8625151740';
    } else {
      return 'ca-app-pub-3940256099942544/4411468910';
    }
  }
}
