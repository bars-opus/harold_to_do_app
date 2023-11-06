import 'package:harold_to_do_app/utility/exports.dart';

class NavigateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const NavigateButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;

    return Card(
      color: backgroundColor,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          onTap: onPressed,
          title: Text(
            buttonText,
            style: TextStyle(color: secondaryHeaderColor),
          ),
          trailing: Icon(
            Icons.navigate_next_rounded,
            color: secondaryHeaderColor,
          )),
    );
  }
}
