part of 'controller.dart';

class DisplayView extends StatelessView<DisplayScreen, DisplayController> {
  const DisplayView(DisplayController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Image'),
      ),
      body: PageView.builder(
        controller: controller.pageController,
        itemBuilder: (context, index) =>
            widget.fileModel[index].fileType == 'image'
                ? Image.file(
                    File(widget.fileModel[index].filePath),
                    fit: BoxFit.fill,
                  )
                : FutureBuilder(
                    future: getImageFromVideo(widget.fileModel[index].filePath),
                    builder: (context, AsyncSnapshot<Uint8List> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center();
                      } else {
                        return Stack(
                          children: [
                            Positioned.fill(
                              child: Image.memory(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Center(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 100,
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
      ),
    );
  }
}
