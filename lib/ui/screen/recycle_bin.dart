import 'package:harold_to_do_app/utility/exports.dart';

class RecycleBin extends StatefulWidget {
  static const id = 'recyclebin_screen';

  const RecycleBin({
    super.key,
  });

  @override
  State<RecycleBin> createState() => _RecycleBinState();
}

var uuid = const Uuid();

class _RecycleBinState extends State<RecycleBin> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final bodyTextStylebodyLarge = AppTheme.lightTheme.textTheme.bodyLarge;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> recycledTask = state.removeTasks;

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: canvasColor,
            title: Text(
              'Recycled tasks',
              style: bodyTextStyleMeduim,
            ),
          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  recycledTask.length.toString(),
                  style: bodyTextStyleMeduim,
                ),
              ),
              TasksList(
                taskList: recycledTask,
                canvasColor: canvasColor,
                backgroundColor: backgroundColor,
                bodyTextStyleMeduim: bodyTextStyleMeduim,
                bodyTextStyleLarge: bodyTextStylebodyLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
