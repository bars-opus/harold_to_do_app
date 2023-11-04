import 'package:harold_to_do_app/utility/exports.dart';

class TaskListTile extends StatelessWidget {
  final Task task;
  final Color canvasColor;
  final TextStyle? bodyTextStyleMeduim;
  final TextStyle? bodyTextStyleLarge;

  const TaskListTile({
    super.key,
    required this.task,
    required this.canvasColor,
    required this.bodyTextStyleLarge,
    required this.bodyTextStyleMeduim,
  });

  void _removeOrDelete(BuildContext context, Task task) {
    task.isDeleted
        ? context.read<TasksBloc>().add(DeleteTasks(task: task))
        : context.read<TasksBloc>().add(RemoveTasks(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: task.isDone
          ? canvasColor.withOpacity(.2)
          : canvasColor.withOpacity(.5),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          onLongPress: () {
            _removeOrDelete(context, task);
          },
          leading: MainIconButtons(
            icon: task.isDone
                ? Icons.check
                : Icons.check_box_outline_blank_outlined,
            onpressed: () {
              context.read<TasksBloc>().add(UpdateTasks(task: task));
            },
          ),
          title: Text(
            task.title,
            style: bodyTextStyleLarge,
          ),
          subtitle: Text(
            task.subTitle,
            style: bodyTextStyleMeduim,
          ),
          trailing: MainIconButtons(
            icon: Icons.remove,
            onpressed: () {
              task.isDeleted == false
                  ? context.read<TasksBloc>().add(
                        RemoveTasks(task: task),
                      )
                  : null;
            },
          )),
    );
  }
}
