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
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final canvasColor = AppTheme.lightTheme.canvasColor;

    return Card(
      color: canvasColor.withOpacity(.5),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          onTap: onPressed,
          title: Text(
            buttonText,
            style: bodyTextStyleMeduim,
          ),
          trailing: const Icon(
            Icons.navigate_next_rounded,
            color: Colors.grey,
          )),
    );
  }
}
