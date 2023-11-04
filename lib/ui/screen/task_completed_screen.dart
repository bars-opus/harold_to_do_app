import 'package:harold_to_do_app/utility/exports.dart';

class TaskCompletedScreen extends StatefulWidget {
  static const id = 'complete_screen';

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
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final bodyTextStyleLarge = AppTheme.lightTheme.textTheme.bodyLarge;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> completedTaskList =
            state.allTasks.where((task) => task.isDone).toList();

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: canvasColor,
            title: Text(
              'Completed tasks',
              style: bodyTextStyleMeduim,
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  completedTaskList.length.toString(),
                  style: bodyTextStyleMeduim,
                ),
              ),
              TasksList(
                taskList: completedTaskList,
                canvasColor: canvasColor,
                backgroundColor: backgroundColor,
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
