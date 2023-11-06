import 'package:harold_to_do_app/utility/exports.dart';

class EditTaskScreen extends StatelessWidget {
  static const id = 'edit_screen';
  final Task oldTask;

  const EditTaskScreen({
    super.key,
    required this.oldTask,
  });

  _addTaskColumn(TextEditingController taskTitleController,
      TextEditingController descriptionController) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddTodoTextField(
          hint: 'title',
          controller: taskTitleController,
          autofocus: true,
        ),
        AddTodoTextField(
            controller: descriptionController,
            hint: ' description',
            autofocus: false),
      ],
    );
  }

  _alertDialog(
    BuildContext context,
  ) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController taskTitleController =
        TextEditingController(text: oldTask.title);
    TextEditingController descriptionController =
        TextEditingController(text: oldTask.subTitle);
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final backgroundColor = AppTheme.lightTheme.primaryColorLight;

    return AlertDialog(
      title: Text(
        'Edit task',
        style: TextStyle(color: backgroundColor),
      ),
      content: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: _addTaskColumn(taskTitleController, descriptionController)),
      actions: [
        FilledButton(
          onPressed: () {
            var editTask = Task(
                id: oldTask.id,
                title: taskTitleController.text.trim(),
                subTitle: descriptionController.text.trim(),
                isDone: false,
                isFavorite: oldTask.isFavorite,
                date: DateTime.now().toString());

            context.read<TasksBloc>().add(EditTasks(
                  oldTask: oldTask,
                  newTask: editTask,
                ));

            Navigator.pop(context);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(canvasColor),
          ),
          child: SizedBox(
              width: width,
              child: Column(
                children: [
                  Text(
                    'save',
                    style: bodyTextStyleMeduim,
                  ),
                ],
              )),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return _alertDialog(
          context,
        );
      },
    );
  }
}
