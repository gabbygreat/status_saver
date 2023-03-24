part of 'controller.dart';

class GrantFolderView
    extends StatelessView<GrantFolderScreen, GrantFolderController> {
  const GrantFolderView(GrantFolderController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Permission'),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Icon(
                Icons.folder_outlined,
                size: 80,
                color: Colors.white,
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Starting Android 11 (Android R), Status Saver can no longer access Statuses easily due to Android Storage limitations.\n\n',
                  ),
                  TextSpan(
                    text:
                        'To access Statuses again, certain addittional steps are required to be followed from your end. These are only to be performed once.\n\n',
                  ),
                  TextSpan(text: 'Follow below steps:\n\n'),
                  TextSpan(
                    text:
                        '1: Enable \'Show Internal Storage\' if you cannot see your Primary Storage.\n\n',
                  ),
                  TextSpan(
                    text:
                        '2: Select your Phone\'s Primary Storage from the left drawer.\n\n',
                  ),
                  TextSpan(
                    text: '3: Go to \'Android/media\' folder.\n\n',
                  ),
                  TextSpan(
                    text: '4: Select the directory & it\'s done.\n\n\n',
                  ),
                  TextSpan(
                    text:
                        'Note: if the folder is already opened on the next screen, just allow the access.',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                requestFolderAccess().whenComplete(() => debugPrint('object'));
              },
              child: const Text(
                'Grant Folder Permission',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
