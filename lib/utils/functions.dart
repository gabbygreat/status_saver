import 'package:share_plus/share_plus.dart';

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

Future<bool> requestPermission() async {
  if (await Permission.storage.request().isGranted &&
      await Permission.accessMediaLocation.request().isGranted &&
      await Permission.manageExternalStorage.request().isGranted) {
    return true;
  } else {
    await Permission.manageExternalStorage.request();
    return false;
  }
}

Future<File> downloadFile(FileModel fileModel) async {
  var path = await ExternalPath.getExternalStorageDirectories();

  final dir =
      Directory('${path[0]}/StatusSaver/${fileModel.fileType.capitalize()}');
  if (await dir.exists()) {
    var f = File(fileModel.filePath);
    var fileName = '${dir.path}/${f.path.split('/').last}';
    return await f.copy(fileName);
  } else {
    await dir.create(recursive: true);
    var f = File(fileModel.filePath);
    var fileName = '${dir.path}/${f.path.split('/').last}';
    return await f.copy(fileName);
  }
}

Future<void> shareFile(FileModel fileModel) async {
  await Share.shareXFiles(
    [XFile(fileModel.filePath)],
    text: 'Share media',
  );
}
