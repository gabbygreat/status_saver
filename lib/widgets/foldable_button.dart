import 'dart:math' as math;
import 'package:status_saver/utils/flush.dart';
import 'package:status_saver/utils/utils.dart';

class FoldableOptions extends StatefulWidget {
  final FileModel fileModel;
  const FoldableOptions({super.key, required this.fileModel});

  @override
  State<FoldableOptions> createState() => _FoldableOptionsState();
}

class _FoldableOptionsState extends State<FoldableOptions>
    with SingleTickerProviderStateMixin {
  late List<FoldableModel> options;

  late Animation<Alignment> firstAnim;
  late Animation<Alignment> secondAnim;
  late Animation<Alignment> thirdAnim;
  late Animation<double> verticalPadding;
  late Animation<double> rotate;
  late AnimationController controller;
  final duration = const Duration(milliseconds: 190);

  Widget getItem(FoldableModel foldableModel) {
    const size = 50.0;
    return GestureDetector(
      onTap: () {
        foldableModel.onTap();
        controller.reverse();
      },
      child: Transform.rotate(
        angle: rotate.value,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            foldableModel.iconData,
            color: Colors.white.withOpacity(1.0),
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget buildPrimaryItem(IconData source) {
    const size = 50.0;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor,
              blurRadius: verticalPadding.value),
        ],
      ),
      child: Icon(
        source,
        color: Colors.white.withOpacity(1),
        size: 20,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    options = [
      FoldableModel(
        iconData: Icons.download,
        onTap: () {
          return downloadFile(widget.fileModel).whenComplete(
            () => ShowFlushBar.showSuccess(
              context: context,
              message: 'Saved',
            ),
          );
        },
      ),
      FoldableModel(
        iconData: Icons.share,
        onTap: () async => await shareFile(widget.fileModel),
      ),
      FoldableModel(
        iconData: Icons.favorite,
        onTap: () {},
      ),
    ];
    controller = AnimationController(vsync: this, duration: duration);

    final anim = CurvedAnimation(parent: controller, curve: Curves.linear);
    firstAnim = Tween<Alignment>(
            begin: Alignment.bottomRight, end: Alignment.bottomLeft)
        .animate(anim);
    secondAnim =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.center)
            .animate(anim);
    thirdAnim =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topRight)
            .animate(anim);
    verticalPadding = Tween<double>(begin: 0, end: 26).animate(anim);
    rotate = Tween<double>(begin: 0, end: 2 * math.pi).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(
        bottom: widget.fileModel.fileType == 'image' ? 0 : 80,
      
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: firstAnim.value,
                child: getItem(
                  options.elementAt(0),
                ),
              ),
              Align(
                alignment: secondAnim.value,
                child: getItem(
                  options.elementAt(1),
                ),
              ),
              Align(
                alignment: thirdAnim.value,
                child: getItem(
                  options.elementAt(2),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    controller.isCompleted
                        ? controller.reverse()
                        : controller.forward();
                  },
                  child: buildPrimaryItem(
                    controller.isCompleted || controller.isAnimating
                        ? Icons.close
                        : Icons.add,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
