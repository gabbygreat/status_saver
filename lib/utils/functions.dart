import 'dart:async';

import 'package:share_plus/share_plus.dart';

import '../utils/utils.dart';

Future<Uint8List> getImageFromVideo(String filePath) async {
  final unit8list = await VideoThumbnail.thumbnailData(
    video: filePath,
    imageFormat: ImageFormat.PNG,
    maxWidth: 128,
    quality: 25,
  );
  return unit8list!;
}

Future<bool> requestPermission() async {
  bool storagePermission = await Permission.storage.isGranted;
  bool mediaPermission = await Permission.accessMediaLocation.isGranted;

  if (!storagePermission) {
    storagePermission = await Permission.storage.request().isGranted;
  }

  if (!mediaPermission) {
    mediaPermission = await Permission.accessMediaLocation.request().isGranted;
  }

  bool isPermissionGranted = storagePermission && mediaPermission;
  await LocalStorage.setPermission(isPermissionGranted);
  return isPermissionGranted;
}

Future<void> requestFolderAccess() async {
  const platform = MethodChannel('samples.flutter.dev/battery');
  try {
    await platform.invokeMethod('permission');
    return;
  } on PlatformException catch (_) {
    return;
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
