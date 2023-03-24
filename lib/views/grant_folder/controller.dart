import '../../utils/utils.dart';

part 'view.dart';

class GrantFolderScreen extends ConsumerStatefulWidget {
  const GrantFolderScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<GrantFolderScreen> createState() => GrantFolderController();
}

class GrantFolderController extends ConsumerState<GrantFolderScreen> {
  @override
  Widget build(BuildContext context) {
    return GrantFolderView(this);
  }

  
}
