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



