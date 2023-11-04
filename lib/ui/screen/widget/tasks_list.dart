import 'package:harold_to_do_app/utility/exports.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
    required this.canvasColor,
    required this.backgroundColor,
    required this.bodyTextStyleMeduim,
    required this.bodyTextStyleLarge,
  });

  final List<Task> taskList;
  final Color canvasColor;
  final Color backgroundColor;
  final TextStyle? bodyTextStyleMeduim;
  final TextStyle? bodyTextStyleLarge;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            var task = taskList[index];
            return TaskListTile(
              task: task,
              canvasColor: canvasColor,
              bodyTextStyleMeduim: bodyTextStyleMeduim,
              bodyTextStyleLarge: bodyTextStyleLarge,
            );
          }),
    );
  }
}
