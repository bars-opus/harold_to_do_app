part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;

  final List<Task> removeTasks;

  const TasksState({
    this.allTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removeTasks = const <Task>[],
  });

  @override
  List<Object> get props =>
      [allTasks, removeTasks, favoriteTasks, completedTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((task) => task.toJson()).toList(),
      'favoriteTasks': favoriteTasks.map((task) => task.toJson()).toList(),
      'completedTasks': completedTasks.map((task) => task.toJson()).toList(),
      'removeTasks': removeTasks.map((task) => task.toJson()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: (map['allTasks'] as List<dynamic>)
          .map((taskMap) => Task.fromJson(taskMap))
          .toList(),
      favoriteTasks: (map['favoriteTasks'] as List<dynamic>)
          .map((taskMap) => Task.fromJson(taskMap))
          .toList(),
      completedTasks: (map['completedTasks'] as List<dynamic>)
          .map((taskMap) => Task.fromJson(taskMap))
          .toList(),
      removeTasks: (map['removeTasks'] as List<dynamic>)
          .map((taskMap) => Task.fromJson(taskMap))
          .toList(),
    );
  }
}


