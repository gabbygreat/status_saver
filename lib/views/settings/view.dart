part of 'controller.dart';

class SettingsView extends StatelessView<SettingsScreen, SettingsController> {
  const SettingsView(SettingsController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Settings',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(
            'Settings',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          CheckboxListTile(
            value: true,
            contentPadding: const EdgeInsets.only(top: 10),
            onChanged: (bool? val) {},
            title: const Text(
              'Enable delete option',
            ),
            subtitle: const Text(
              'If enabled, a delete button will show up in viewer screen',
            ),
          ),
          const Divider(),
          CheckboxListTile(
            value: true,
            contentPadding: const EdgeInsets.only(top: 10),
            onChanged: (bool? val) {},
            title: const Text(
              'Notification',
            ),
            subtitle: const Text(
              'If enabled, you will be notified whenever new status(es) is/are available for downloading',
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Misc',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          const ListTile(
            contentPadding: EdgeInsets.only(top: 10),
            title: Text(
              'F.A.Q',
            ),
            subtitle: Text(
              'Some common FAQs',
            ),
          ),
          const Divider(),
          const ListTile(
            contentPadding: EdgeInsets.only(top: 10),
            title: Text(
              'Feedback',
            ),
            subtitle: Text(
              'Let us know if you have any suggestions or found bugs',
            ),
          ),
          const Divider(),
          const ListTile(
            contentPadding: EdgeInsets.only(top: 10),
            title: Text(
              'About the app',
            ),
            subtitle: Text(
              'Get to know about the app',
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
