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
            data: (data) {
              data.sort((b, a) => a.fileDate.compareTo(b.fileDate));
              return RefreshIndicator(
                onRefresh: () async => await controller.ref.refresh(
                  statusMediaProvider(widget.folderModel).future,
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) => ImageLoader(
                    fileModel: data[index],
                    allFiles: data,
                  ),
                ),
              );
            },
            loading: () => SizedBox(
              height: 40,
              width: 40,
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: List.generate(20, (index) => index++)
                    .map((e) => Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.grey.withOpacity(0.2),
                          child: Container(
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ))
                    .toList(),
              ),
            ),
            error: (error, stackTrace) {
              return const Scaffold(body: Center());
            },
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
