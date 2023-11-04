import 'package:harold_to_do_app/utility/exports.dart';

class MainIconButtons extends StatelessWidget {
  final VoidCallback onpressed;
  final IconData icon;
  

  const MainIconButtons(
      {super.key, required this.onpressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: onpressed,
      icon: Icon(
        icon,
      ),
    );
  }
}
