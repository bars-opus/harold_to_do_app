import 'package:harold_to_do_app/utility/exports.dart';

class TaskCompletedScreen extends StatefulWidget {
  static const id = 'task_completed_screen';

  const TaskCompletedScreen({
    super.key,
  });

  @override
  State<TaskCompletedScreen> createState() => _TaskCompletedScreenState();
}

var uuid = const Uuid();

class _TaskCompletedScreenState extends State<TaskCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final bodyTextStyleLarge = AppTheme.lightTheme.textTheme.bodyLarge;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> completeList = state.completedTasks;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${completeList.length.toString()} Completed tasks",
                  style: TextStyle(color: secondaryHeaderColor),
                ),
              ),
              TasksList(
                taskList: completeList,
                canvasColor: canvasColor,
                bodyTextStyleMeduim: bodyTextStyleMeduim,
                bodyTextStyleLarge: bodyTextStyleLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}



