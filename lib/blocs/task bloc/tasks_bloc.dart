import 'package:harold_to_do_app/utility/exports.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTasks>(_onAddTaks);
    on<UpdateTasks>(_onUpdateTask);
    on<DeleteTasks>(_onDeleteTask);
    on<RemoveTasks>(_onRemoveTask);
    on<MarkFavoriteOrUnFavoriteTasks>(_onMarkFavoriteOrUnFavoriteTasks);
    on<EditTasks>(_onEditTasks);
    on<RestoreTasks>(_onRestoreTasks);
    on<DeleteAllTasks>(_onDeleteAllTasks);
  }  

  void _onAddTaks(AddTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
      removeTasks: state.removeTasks,
    ));
  }

  void _onUpdateTask(UpdateTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTasks = state.allTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;

    if (task.isDone == false) {
      if (task.isFavorite == false) {
        allTasks = List.from(allTasks)..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        allTasks = List.from(allTasks)..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
        favoriteTasks = List.from(favoriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: true));
      }
    } else {
      if (task.isFavorite == false) {
        completedTasks = List.from(completedTasks)..remove(task);
        allTasks = List.from(allTasks)..insert(0, task.copyWith(isDone: false));
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        completedTasks = List.from(completedTasks)..remove(task);
        allTasks = List.from(allTasks)..insert(0, task.copyWith(isDone: false));
        favoriteTasks = List.from(favoriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: false));
      }
    }

    emit(
      TasksState(
          allTasks: allTasks,
          completedTasks: completedTasks,
          favoriteTasks: state.favoriteTasks,
          removeTasks: state.removeTasks),
    );
  }

  void _onDeleteTask(DeleteTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        allTasks: state.allTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removeTasks: List.from(state.removeTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removeTasks: List.from(state.removeTasks)
          ..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  void _onMarkFavoriteOrUnFavoriteTasks(
      MarkFavoriteOrUnFavoriteTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> allTasks = state.allTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;

    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = allTasks.indexOf(event.task);
        allTasks = List.from(allTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = allTasks.indexOf(event.task);
        allTasks = List.from(allTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = allTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = allTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    }
    emit(
      TasksState(
        allTasks: allTasks,
        completedTasks: completedTasks,
        favoriteTasks: favoriteTasks,
        removeTasks: state.removeTasks,
      ),
    );
  }

  void _onEditTasks(EditTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> favoriteTasks = state.favoriteTasks;
    if (event.oldTask.isFavorite == true) {
      favoriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        completedTasks: state.completedTasks..remove(event.oldTask),
        favoriteTasks: favoriteTasks,
        removeTasks: state.removeTasks,
      ),
    );
  }

  void _onRestoreTasks(RestoreTasks event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(
      TasksState(
        removeTasks: List.from(state.removeTasks)..remove(event.task),
        allTasks: List.from(state.allTasks)
          ..insert(
              0,
              event.task.copyWith(
                isDeleted: false,
                isDone: false,
                isFavorite: false,
              )),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }

  void _onDeleteAllTasks(DeleteAllTasks event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(
      TasksState(
        removeTasks: List.from(state.removeTasks)..clear(),
        allTasks: state.allTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
