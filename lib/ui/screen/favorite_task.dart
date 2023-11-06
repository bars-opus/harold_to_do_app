import 'package:harold_to_do_app/utility/exports.dart';

class FavoriteTaskScreen extends StatefulWidget {
  static const id = 'favorite_screen';

  const FavoriteTaskScreen({
    super.key,
  });

  @override
  State<FavoriteTaskScreen> createState() => _FavoriteTaskScreenState();
}

var uuid = const Uuid();

class _FavoriteTaskScreenState extends State<FavoriteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).primaryColorLight;
    final canvasColor = AppTheme.lightTheme.canvasColor;
    final secondaryHeaderColor = Theme.of(context).secondaryHeaderColor;
    final bodyTextStyleMeduim = AppTheme.lightTheme.textTheme.bodyMedium;
    final bodyTextStyleLarge = AppTheme.lightTheme.textTheme.bodyLarge;

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> favoriteTaskList = state.favoriteTasks;

        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${favoriteTaskList.length.toString()} Favorite tasks",
                  style: TextStyle(color: secondaryHeaderColor),
                ),
              ),
              TasksList(
                taskList: favoriteTaskList,
                canvasColor: canvasColor,
                bodyTextStyleMeduim: bodyTextStyleMeduim,
                bodyTextStyleLarge: bodyTextStyleLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
