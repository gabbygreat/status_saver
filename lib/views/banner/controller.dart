import '../../utils/utils.dart';

part 'view.dart';

class BannerScreen extends ConsumerStatefulWidget {
  final String tabName;
  final FolderModel folderModel;
  final int position;
  const BannerScreen({
    Key? key,
    required this.tabName,
    required this.position,
    required this.folderModel,
  }) : super(key: key);
  @override
  ConsumerState<BannerScreen> createState() => BannerController();
}

class BannerController extends ConsumerState<BannerScreen> {
  BannerAd? _banner;

  void _createBannerAd() async {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId,
      listener: const BannerAdListener(),
      request: const AdRequest(),
    );
    if (_banner != null) {
      try {
        await _banner?.load();
      } catch (_) {}
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _createBannerAd();
    return await ref.refresh(
      statusMediaProvider(widget.folderModel).future,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BannerView(this);
  }
}
