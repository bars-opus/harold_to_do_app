import 'package:harold_to_do_app/utility/exports.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTasks>(_onAddTaks);
    on<UpdateTasks>(_onUpdateTask);
    on<DeleteTasks>(_onDeleteTask);
    on<RemoveTasks>(_onRemoveTask);
  }

  void _onAddTaks(AddTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
        removeTasks: state.removeTasks));
  }

  void _onUpdateTask(UpdateTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    final int index = state.allTasks.indexOf(task);

    List<Task> allTasks = List.from(state.allTasks)..remove(task);
    task.isDone == false
        ? allTasks.insert(index, task.copyWith(isDone: true))
        : allTasks.insert(index, task.copyWith(isDone: false));
    emit(
      TasksState(allTasks: allTasks, removeTasks: state.removeTasks),
    );
  }

  void _onDeleteTask(DeleteTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        allTasks: state.allTasks,
        removeTasks: List.from(state.removeTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        allTasks: List.from(state.allTasks)..remove(event.task),
        removeTasks: List.from(state.removeTasks)
          ..add(event.task.copyWith(isDeleted: true)),
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
