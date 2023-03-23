import '../utils/utils.dart';

class StatusServices {
  static Future<List<FolderModel>> getTabNames() async {
    var path = await ExternalPath.getExternalStorageDirectories();
    List<FileSystemEntity> dir = Directory('${path[0]}/Android/media')
        .listSync()
        .where((element) => element.path.contains('whatsapp'))
        .toList();
    final names = dir.map((e) {
      return FolderModel(
        folderName: e.path.split('media').last.split('.')[1].capitalize(),
        folderId: e.path.split('/').last,
        folderPath: e.path,
        folderMain: Directory(e.path).listSync().first.path.split('/').last,
      );
    }).toList();
    return names;
  }

  static Future<List<FileModel>> getTabContent(FolderModel folder) async {
    var path = await ExternalPath.getExternalStorageDirectories();

    final dir = Directory(
            '${path[0]}/Android/media/${folder.folderId}/${folder.folderMain}/Media/.Statuses/')
        .list();
    
    return dir.where((event) => lookupMimeType(event.path) != null).map((e) {
      return FileModel(
        filePath: e.path,
        fileType: lookupMimeType(e.path)!.split('/')[0],
        height: 1,
        width: 1,
        fileDate: e.statSync().modified,
      );
    }).toList();
  }
}
