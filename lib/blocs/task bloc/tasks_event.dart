part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTasks extends TasksEvent {
  final Task task;

  const AddTasks({required this.task});
  @override
  List<Object> get props => [task];
}

class UpdateTasks extends TasksEvent {
  final Task task;

  const UpdateTasks({required this.task});
  @override
  List<Object> get props => [task];
}

class RemoveTasks extends TasksEvent {
  final Task task;

  const RemoveTasks({required this.task});
  @override
  List<Object> get props => [task];
}

class DeleteTasks extends TasksEvent {
  final Task task;

  const DeleteTasks({required this.task});
  @override
  List<Object> get props => [task];
}

class MarkFavoriteOrUnFavoriteTasks extends TasksEvent {
  final Task task;

  const MarkFavoriteOrUnFavoriteTasks({required this.task});
  @override
  List<Object> get props => [task];
}

class EditTasks extends TasksEvent {
  final Task oldTask;
  final Task newTask;

  const EditTasks({
    required this.oldTask,
    required this.newTask,
  });
  @override
  List<Object> get props => [oldTask, newTask];
}

class RestoreTasks extends TasksEvent {
  final Task task;

  const RestoreTasks({
    required this.task,
  });
  @override
  List<Object> get props => [
        task,
      ];
}

class DeleteAllTasks extends TasksEvent {}
