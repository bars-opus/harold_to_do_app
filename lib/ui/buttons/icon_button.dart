import 'package:harold_to_do_app/utility/exports.dart';

class MainIconButtons extends StatelessWidget {
  final VoidCallback onpressed;
  final IconData icon;

  const MainIconButtons(
      {super.key, required this.onpressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    return IconButton(
      color: backgroundColor,
      onPressed: onpressed,
      icon: Icon(
        icon,
      ),
    );
  }
}
