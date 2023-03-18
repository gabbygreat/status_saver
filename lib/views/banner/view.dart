part of 'controller.dart';

class BannerView extends StatelessView<BannerScreen, BannerController> {
  const BannerView(BannerController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    final statusMedia = controller.ref.watch(
      statusMediaProvider(widget.folderModel),
    );

    return Stack(
      children: [
        Positioned.fill(
          child: statusMedia.when(
            data: (data) => RefreshIndicator(
              onRefresh: () async => await controller.ref.refresh(
                statusMediaProvider(widget.folderModel).future,
              ),
              child: GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisSpacing: 5),
                itemBuilder: (context, index) => ImageLoader(
                  fileModel: data[index],
                  allFiles: data,
                ),
              ),
            ),
            loading: () => const SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => const Text('ERROR'),
          ),
        ),
        if (controller._banner != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: controller._banner!.size.height.toDouble(),
              width: controller._banner!.size.width.toDouble(),
              child: AdWidget(
                ad: controller._banner!,
              ),
            ),
          )
      ],
    );
  }
}
