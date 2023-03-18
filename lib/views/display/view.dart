part of 'controller.dart';

class DisplayView extends StatelessView<DisplayScreen, DisplayController> {
  const DisplayView(DisplayController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Saver'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FoldableOptions(
        fileModel: widget.fileModel[controller.position],
      ),
      body: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) => controller.refresh(value),
        itemBuilder: (context, index) =>
            widget.fileModel[index].fileType == 'image'
                ? Image.file(
                    File(widget.fileModel[index].filePath),
                  )
                : VideoManager(
                    file: widget.fileModel[index],
                  ),
      ),
    );
  }
}
