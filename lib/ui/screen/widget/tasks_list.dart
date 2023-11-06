import 'package:harold_to_do_app/utility/exports.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.taskList,
    required this.canvasColor,
    required this.bodyTextStyleMeduim,
    required this.bodyTextStyleLarge,
  });

  final List<Task> taskList;
  final Color canvasColor;
  final TextStyle? bodyTextStyleMeduim;
  final TextStyle? bodyTextStyleLarge;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
          children: taskList
              .map((task) => ExpansionPanelRadio(
                  backgroundColor: canvasColor.withOpacity(.8),
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskListTile(
                        task: task,
                        canvasColor: canvasColor,
                      ),
                  body: ListTile(
                    title: SelectableText.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Desciption\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: backgroundColor)),
                      TextSpan(
                        text: task.subTitle,
                        style: TextStyle(color: backgroundColor),
                      ),
                    ])),
                  )))
              .toList()),
    );
  }
}
