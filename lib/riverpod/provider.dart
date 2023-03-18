import '../utils/utils.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) => ThemeNotifier(false),
);

final statusMediaProvider = FutureProvider.family<List<FileModel>, FolderModel>(
  (ref, FolderModel folderModel) => StatusServices.getTabContent(folderModel),
);

final imageFromVideoProvider = FutureProvider.family(
  (ref, String filePath) => getImageFromVideo(filePath),
);

final rebuildDisplay = StateProvider.autoDispose<bool>((ref) => false);
