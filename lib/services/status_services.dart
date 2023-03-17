import '../utils/utils.dart';

class StatusServices {
  static Future<List<String>> getTabNames() async {
    var path = await ExternalPath.getExternalStorageDirectories();

    List<FileSystemEntity> dir =
        Directory('${path[0]}/Android/media').listSync();

    final names =
        dir.map((e) => e.path.split('media').last.split('.')[1].capitalize());
    return names.toList();
  }

  static Future<List<FileModel>> getTabContent(int position) async {
    var path = await ExternalPath.getExternalStorageDirectories();

    FileSystemEntity dir =
        Directory('${path[0]}/Android/media').listSync()[position];
    return Directory(dir.path)
        .listSync(
          recursive: true,
        )
        .where((element) => lookupMimeType(element.path) != null)
        .map(
          (e) => FileModel(
            filePath: e.path,
            fileType: lookupMimeType(e.path)!.split('/')[0],
          ),
        )
        .toList();
  }
}
