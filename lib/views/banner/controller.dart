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
  _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerAdUnitId,
      listener: const BannerAdListener(),
      request: const AdRequest(),
    )..load();
  }

  void preloadImage(String fileName) async {
    await precacheImage(ExtendedFileImageProvider(File(fileName)), context);
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(statusMediaProvider(widget.folderModel).future).then((value) =>
          value
              .where((element) => element.fileType == 'image')
              .forEach((element) {
            preloadImage(element.filePath);
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BannerView(this);
  }
}
