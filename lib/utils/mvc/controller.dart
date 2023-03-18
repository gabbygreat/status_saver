import '../utils.dart';

part 'view.dart';

class MvcScreen extends ConsumerStatefulWidget {
  const MvcScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MvcScreen> createState() => MvcController();
}

class MvcController extends ConsumerState<MvcScreen> {
  @override
  Widget build(BuildContext context) {
    return MvcView(this);
  }
}
