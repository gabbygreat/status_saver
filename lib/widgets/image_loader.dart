import '../utils/utils.dart';

class ImageLoader extends StatefulWidget {
  final FileModel fileModel;
  final List<FileModel> allFiles;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? boxFit;
  const ImageLoader(
      {Key? key,
      required this.fileModel,
      required this.allFiles,
      this.width,
      this.height,
      this.boxFit,
      this.radius})
      : super(key: key);

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
    );
    _animation = Tween<double>(begin: 0, end: 1000).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> onTap() async {
    
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InterstitialScreen(
          child: DisplayScreen(
            fileModel: widget.allFiles,
            initialPage: widget.allFiles.indexOf(widget.fileModel),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fileModel.fileType == 'image') {
      return ExtendedImage.file(
        File(widget.fileModel.filePath),
        imageCacheName: widget.fileModel.filePath,
        fit: BoxFit.contain,
        width: double.infinity,
        borderRadius: BorderRadius.circular(8),
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              _controller.reset();
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Shimmer.fromColors(
                  baseColor: primaryColor.withOpacity(0.3),
                  highlightColor: secondaryColor.withOpacity(0.2),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text('status saver'),
                  ),
                ),
              );
            case LoadState.completed:
              _controller.forward();
              return FadeTransition(
                opacity: _animation,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: GestureDetector(
                    onTap: () => onTap(),
                    child: ExtendedRawImage(
                      image: state.extendedImageInfo?.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            case LoadState.failed:
              _controller.reset();
              return GestureDetector(
                child: Center(
                  child: Icon(
                    Icons.replay_outlined,
                    color: secondaryColor,
                    size: 60,
                  ),
                ),
                onTap: () {
                  state.reLoadImage();
                },
              );
          }
        },
      );
    } else {
      return Consumer(
        builder: (context, ref, _) {
          final image =
              ref.watch(imageFromVideoProvider(widget.fileModel.filePath));
          return image.when(
            data: (vlaue) => ExtendedImage.memory(
              vlaue,
              imageCacheName: widget.fileModel.filePath,
              fit: BoxFit.contain,
              width: double.infinity,
              borderRadius: BorderRadius.circular(8),
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    _controller.reset();
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Shimmer.fromColors(
                        baseColor: primaryColor.withOpacity(0.3),
                        highlightColor: secondaryColor.withOpacity(0.2),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('status saver'),
                        ),
                      ),
                    );
                  case LoadState.completed:
                    _controller.forward();
                    return FadeTransition(
                      opacity: _animation,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: GestureDetector(
                          onTap: () => onTap(),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: ExtendedRawImage(
                                  image: state.extendedImageInfo?.image,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 100,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  case LoadState.failed:
                    _controller.reset();
                    return GestureDetector(
                      child: Center(
                        child: Icon(
                          Icons.replay_outlined,
                          color: secondaryColor,
                          size: 60,
                        ),
                      ),
                      onTap: () {
                        state.reLoadImage();
                      },
                    );
                }
              },
            ),
            error: (error, trace) => Center(
              child: Shimmer.fromColors(
                baseColor: primaryColor.withOpacity(0.3),
                highlightColor: secondaryColor.withOpacity(0.2),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('status saver'),
                ),
              ),
            ),
            loading: () => Center(
              child: Shimmer.fromColors(
                baseColor: primaryColor.withOpacity(0.3),
                highlightColor: secondaryColor.withOpacity(0.2),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('status saver'),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
