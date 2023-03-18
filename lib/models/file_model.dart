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
  final DateTime fileDate;
  final double? width;
  final double? height;

  FileModel({
    required this.filePath,
    required this.fileType,
    required this.fileDate,
    required this.height,
    required this.width,
  });
}
