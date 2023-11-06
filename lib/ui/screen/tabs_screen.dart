import 'package:harold_to_do_app/ui/screen/favorite_task.dart';
import 'package:harold_to_do_app/ui/screen/task_completed_screen.dart';
import 'package:harold_to_do_app/utility/exports.dart';

class TabsScreen extends StatefulWidget {
  static const id = 'tab_screen';

  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'PageName': const TaskScreen(), 'title': '  Tasks'},
    {'PageName': const TaskCompletedScreen(), 'title': 'Completed Tasks'},
    {'PageName': const FavoriteTaskScreen(), 'title': 'Favorite Tasks'}
  ];

  var _selectedPageIndex = 0;

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

  _alertDialog(
    BuildContext context,
    bool addTask,
  ) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController taskTitleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final backgroundColor = AppTheme.lightTheme.primaryColorLight;

    return AlertDialog(
      title: Text(
        'Add task',
        style: TextStyle(color: backgroundColor),
      ),
      content: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: _addTaskColumn(taskTitleController, descriptionController)),
      actions: [
        addTask
            ? FilledButton(
                onPressed: () {
                  var task = Task(
                      id: const Uuid().v4(),
                      title: taskTitleController.text.trim(),
                      subTitle: descriptionController.text.trim(),
                      date: DateTime.now().toString());

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
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;

    final canvasColor = AppTheme.lightTheme.canvasColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: canvasColor,
        title: Text(
          _pageDetails[_selectedPageIndex]['title'],
          style: TextStyle(color: backgroundColor),
        ),
        actions: [
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                  activeColor: backgroundColor,
                  value: state.switchValue,
                  onChanged: (value) {
                    value
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
            },
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['PageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _alertDialog(
                        context,
                        true,
                      );
                    });
              },
              backgroundColor: canvasColor,
              child: Icon(
                Icons.add,
                color: backgroundColor,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: secondaryHeaderColor,
          unselectedItemColor: backgroundColor,
          currentIndex: _selectedPageIndex,
          onTap: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.incomplete_circle_sharp,
                ),
                label: "Pending task"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.done,
              ),
              label: "Complete task",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "Favorite task")
          ]),
    );
  }
}
