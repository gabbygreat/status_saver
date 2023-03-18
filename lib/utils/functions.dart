import '../utils/utils.dart';

Future<Uint8List> getImageFromVideo(String filePath) async {
    final uint8list = await VideoThumbnail.thumbnailData(
      video: filePath,
      imageFormat: ImageFormat.PNG,
      maxWidth: 128,
      quality: 25,
    );
    return uint8list!;
  }