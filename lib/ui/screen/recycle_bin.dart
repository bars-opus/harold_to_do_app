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
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;

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
            title: const Text(
              'Recycled tasks',
             
            ),
            actions: [
              PopupMenuButton(
                  itemBuilder: ((context) => [
                        PopupMenuItem(
                            child: TextButton.icon(
                                onPressed: () {
                                  context
                                      .read<TasksBloc>()
                                      .add(DeleteAllTasks());
                                },
                                icon: const Icon(Icons.delete_forever),
                                label: const Text('Delet all'))),
                      ]))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${recycledTask.length.toString()} Recycled tasks",
                  style: TextStyle(color: secondaryHeaderColor),
                ),
              ),
              TasksList(
                taskList: recycledTask,
                canvasColor: canvasColor,
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
