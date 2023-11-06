import 'package:harold_to_do_app/utility/exports.dart';

class TaskScreen extends StatelessWidget {
  static const id = 'task_screen';

  const TaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final bodyTextStyleLarge = AppTheme.lightTheme.textTheme.bodyLarge;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${taskList.length.toString()} Pending tasks",
                  style: TextStyle(color: secondaryHeaderColor),
                ),
              ),
              TasksList(
                taskList: taskList,
                canvasColor: canvasColor,
                bodyTextStyleMeduim: bodyTextStyleMeduim,
                bodyTextStyleLarge: bodyTextStyleLarge,
              )
            ],
          ),
        );
      },
    );
  }
}
