
import 'package:harold_to_do_app/utility/exports.dart';
import 'package:intl/intl.dart';

class TaskListTile extends StatelessWidget {
  final Task task;
  final Color canvasColor;

  const TaskListTile({
    super.key,
    required this.task,
    required this.canvasColor,
  });

  void _removeOrDelete(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTasks(task: task))
        : context.read<TasksBloc>().add(RemoveTasks(task: task));
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                task.isFavorite == false
                    ? Icon(Icons.star_outline, color: backgroundColor)
                    : Icon(Icons.star, color: backgroundColor),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: backgroundColor),
                      ),
                      Text(
                        DateFormat().add_yMMM().add_Hms().format(
                              DateTime.parse(task.date),
                            ),
                        style: TextStyle(color: backgroundColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              MainIconButtons(
                icon: task.isDone!
                    ? Icons.check
                    : Icons.check_box_outline_blank_outlined,
                onpressed: () {
                  context.read<TasksBloc>().add(UpdateTasks(task: task));
                },
              ),
            ],
          ),
          PopUpbutton(
            likeOrDislike: () {
              Navigator.pop(context);
              context
                  .read<TasksBloc>()
                  .add(MarkFavoriteOrUnFavoriteTasks(task: task));
            },
            cancelDeletCallback: () {
              Navigator.pop(context);
              _removeOrDelete(context, task);
            },
            task: task,
            editTextCallback: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return EditTaskScreen(
                      oldTask: task,
                    );
                  });
            },
            restoreTextCallback: () {
              Navigator.pop(context);
              context.read<TasksBloc>().add(RestoreTasks(task: task));
            },
          )
        ],
      ),
    );
  }
}
