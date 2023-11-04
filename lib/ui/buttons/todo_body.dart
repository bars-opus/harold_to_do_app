// import 'package:harold_to_do_app/utility/exports.dart';

// class TodoBody extends StatefulWidget {
//   const TodoBody({super.key});

//   @override
//   State<TodoBody> createState() => _TodoBodyState();
// }

// class _TodoBodyState extends State<TodoBody> {
//   late TodoManager _todoManager;
//   final TodoBloc todoBloc = TodoBloc();

//   @override
//   void initState() {
//     super.initState();
//     _todoManager = TodoManager(todoBloc);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final canvasColor = AppTheme.lightTheme.canvasColor;
//     final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
//     final backgroundColor = Theme.of(context).primaryColorLight;
//     return BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
//       if (state.status == Status.done) {
//         if (state.todos.isEmpty) {
//           return Center(
//             child: Text(
//               'Create your first to do tasks.',
//               style: bodyTextStyleMeduim,
//             ),
//           );
//         }
//         return ListView.builder(
//           itemCount: state.todos.length,
//           itemBuilder: (context, int i) {
//             return Card(
//               color: canvasColor.withOpacity(.4),
//               elevation: 1,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: ListTile(
//                   leading: Icon(Icons.work_outline, color: backgroundColor),
//                   title: Text(
//                     state.todos[i].taskTitle,
//                     style: bodyTextStyleMeduim,
//                   ),
//                   subtitle: Text(
//                     state.todos[i].subTitle,
//                     style: bodyTextStyleMeduim,
//                   ),
//                   trailing: MainIconButtons(
//                     icon: Icons.remove,
//                     onpressed: () {
//                       _todoManager.removeTodo(state.todos[i]);
//                     },
//                   )),
//             );
//           },
//         );
//       } else if (state.status == Status.initial) {
//         return Center(
//           child: CircularProgressIndicator(
//             color: AppTheme.lightTheme.secondaryHeaderColor,
//           ),
//         );
//       } else {
//         return Container();
//       }
//     });
    
//   }
// }
