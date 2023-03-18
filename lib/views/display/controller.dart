import '../../utils/utils.dart';

part 'view.dart';

class DisplayScreen extends StatefulWidget {
  final List<FileModel> fileModel;
  final int initialPage;
  const DisplayScreen({
    Key? key,
    required this.fileModel,
    required this.initialPage,
  }) : super(key: key);

  @override
  State<DisplayScreen> createState() => DisplayController();
}

class DisplayController extends State<DisplayScreen> {
  late PageController pageController;
  late int position;

  void refresh(int value) {
    setState(() {
      position = value;
    });
  }

  @override
  void initState() {
    super.initState();
    position = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return DisplayView(this);
  }
}
