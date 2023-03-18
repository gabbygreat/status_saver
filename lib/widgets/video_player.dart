import 'package:chewie/chewie.dart';
import 'package:status_saver/utils/utils.dart';
import 'package:video_player/video_player.dart';

class VideoManager extends ConsumerStatefulWidget {
  const VideoManager({Key? key, required this.file}) : super(key: key);
  final FileModel file;

  @override
  ConsumerState<VideoManager> createState() => _VideoManagerState();
}

class _VideoManagerState extends ConsumerState<VideoManager> {
  late VideoPlayerController controller;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.file(
      File(
        widget.file.filePath,
      ),
    )..initialize().then(
        (value) async {
          setState(() {});
          ref.read(rebuildDisplay.notifier).state = true;
        },
      );

    chewieController = ChewieController(
      videoPlayerController: controller,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    ref.read(rebuildDisplay.notifier).state = false;
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Chewie(
        controller: chewieController,
      ),
    );
  }
}
