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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        autofocus: autofocus,
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
