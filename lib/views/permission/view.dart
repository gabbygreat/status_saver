part of 'controller.dart';

class PermissionView
    extends StatelessView<PermissionScreen, PermissionController> {
  const PermissionView(PermissionController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
    );
  }
}
