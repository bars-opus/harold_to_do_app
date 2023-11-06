import 'package:harold_to_do_app/utility/exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Task Drawer',
            style: TextStyle(color: backgroundColor),
          ),
          const SizedBox(
            height: 30,
          ),
          NavigateButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RecycleBin.id);
            },
            buttonText: 'Recycled  ',
          ),
        ],
      )),
    );
  }
}
