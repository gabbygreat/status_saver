class FolderModel {
  final String folderPath;
  final String folderName;
  final String folderId;
  final String folderMain;

  FolderModel({
    required this.folderPath,
    required this.folderName,
    required this.folderId,
    required this.folderMain,
  });
}
class FileModel {
  final String filePath;
  final String fileType;

  FileModel({
    required this.filePath,
    required this.fileType,
  });
}
