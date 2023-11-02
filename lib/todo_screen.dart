import 'utility/exports.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  Color buttonColor = Colors.green;

  _addTodo(Todo todo) {
    context.read<TodoBloc>().add(AddTodo(todo));
  }

  _removeTodo(Todo todo) {
    context.read<TodoBloc>().add(RemoveTodo(todo));
  }

  // Widget for the title
  Widget _title() {
    return Text('Harold\'s To do app ',
        style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: 20,
            fontWeight: FontWeight.bold));
  }

  // Method to build the body of the screen
  _body() {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
      Color primaryColor = Theme.of(context).primaryColorLight;

      if (state.status == Status.done) {
        if (state.todos.isEmpty) {
          // Display a message when the todo list is empty
          return Center(
            child: Text(
              'Create your first to do tasks.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }
        return ListView.builder(
          itemCount: state.todos.length,
          itemBuilder: (context, int i) {
            return Card(
              color: buttonColor.withOpacity(.5),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.work_outline,
                  color: primaryColor,
                ),
                title: Text(
                  state.todos[i].taskTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                subtitle: Text(
                  state.todos[i].subTitle,
                  style: TextStyle(
                    fontSize: screenWidth < 400 ? 14 : 18,
                    color: primaryColor,
                  ),
                ),
                trailing: IconButton(
                    color: primaryColor,
                    onPressed: () {
                      _removeTodo(state.todos[i]);
                    },
                    icon: const Icon(
                      Icons.remove,
                    )),
              ),
            );
          },
        );
      } else if (state.status == Status.initial) {
        return Center(
          child: CircularProgressIndicator(
            color: buttonColor,
          ),
        );
      } else {
        return Container();
      }
    });
  }

  // Method to build the text field widget
  _textFied(TextEditingController controller, String hint, bool autofocus) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        autofocus: autofocus,
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: buttonColor,
        title: _title(),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          double width = MediaQuery.of(context).size.width;
          TextEditingController taskTitleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Add task',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  content: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _textFied(taskTitleController, 'title', true),
                        _textFied(descriptionController, 'description', false),
                      ],
                    ),
                  ),
                  actions: [
                    FilledButton(
                      onPressed: () {
                        _addTodo(Todo(
                          taskTitle: taskTitleController.text.trim(),
                          subTitle: descriptionController.text.trim(),
                        ));

                        taskTitleController.clear();
                        descriptionController.clear();
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: SizedBox(
                          width: width,
                          child: Column(
                            children: [
                              Text('Add',
                                  style: TextStyle(
                                    fontSize: screenWidth < 400 ? 14 : 18,
                                    color: Theme.of(context).primaryColorLight,
                                  )),
                            ],
                          )),
                    )
                  ],
                );
              });
        },
        backgroundColor: buttonColor,
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}
