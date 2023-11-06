import 'package:harold_to_do_app/utility/exports.dart';

class AddTodoTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool autofocus;

  const AddTodoTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.autofocus});

  @override
  Widget build(BuildContext context) {
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final backgroundColor = AppTheme.lightTheme.primaryColorLight;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        autofocus: autofocus,
        maxLines: null,
        controller: controller,
        style: TextStyle(color: backgroundColor),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: canvasColor),
          ),
        ),
      ),
    );
  }
}
