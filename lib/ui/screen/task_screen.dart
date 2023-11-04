import 'package:harold_to_do_app/ui/screen/recycle_bin.dart';
import 'package:harold_to_do_app/ui/screen/task_completed_screen.dart';
import 'package:harold_to_do_app/utility/exports.dart';

class TaskScreen extends StatefulWidget {
  static const id = 'task_screen';

  const TaskScreen({
    super.key,
  });

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

var uuid = const Uuid();

class _TaskScreenState extends State<TaskScreen> {
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

  _naviagteColumm(
      BuildContext context, int removeTaskListCount, int completedList) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NavigateButton(
          onPressed: () {
            Navigator.of(context).pushNamed(TaskCompletedScreen.id);
          },
          buttonText: 'Completed  $completedList',
        ),
        NavigateButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RecycleBin.id);
          },
          buttonText: 'Deleted  $removeTaskListCount',
        ),
      ],
    );
  }

  _alertDialog(BuildContext context, bool addTask, int removeTaskListCount,
      int completedList) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController taskTitleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final canvasColor = AppTheme.lightTheme.canvasColor;

    return AlertDialog(
      title: Text(
        addTask ? 'Add task' : '',
        style: bodyTextStyleMeduim,
      ),
      content: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: addTask
              ? _addTaskColumn(taskTitleController, descriptionController)
              : _naviagteColumm(context, removeTaskListCount, completedList)),
      actions: [
        addTask
            ? FilledButton(
                onPressed: () {
                  var task = Task(
                      id: uuid.v4(),
                      title: taskTitleController.text.trim(),
                      subTitle: descriptionController.text.trim());

                  context.read<TasksBloc>().add(AddTasks(task: task));
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(canvasColor),
                ),
                child: SizedBox(
                    width: width,
                    child: Column(
                      children: [
                        Text(
                          'Add',
                          style: bodyTextStyleMeduim,
                        ),
                      ],
                    )),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final bodyTextStyleLarge = AppTheme.lightTheme.textTheme.bodyLarge;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        int removeTaskListCount = state.removeTasks.length;

        int completedTasksCount = taskList.where((task) => task.isDone).length;

        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: canvasColor,
            title: Text(
              'Harold\'s To do app ',
              style: bodyTextStyleMeduim,
            ),
            actions: [
              MainIconButtons(
                icon: Icons.check,
                onpressed: () {},
              ),
              MainIconButtons(
                icon: Icons.more_vert_sharp,
                onpressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _alertDialog(context, false, removeTaskListCount,
                            completedTasksCount);
                      });
                },
              )
            ],
          ),
          body: Column(
            children: [
              Center(
                child: Text(
                  taskList.length.toString(),
                  style: bodyTextStyleMeduim,
                ),
              ),
              TasksList(
                taskList: taskList,
                canvasColor: canvasColor,
                backgroundColor: backgroundColor,
                bodyTextStyleMeduim: bodyTextStyleMeduim,
                bodyTextStyleLarge: bodyTextStyleLarge,
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _alertDialog(context, true, removeTaskListCount,
                        completedTasksCount);
                  });
            },
            backgroundColor: canvasColor,
            child: Icon(
              Icons.add,
              color: backgroundColor,
            ),
          ),
        );
      },
    );
  }
}
