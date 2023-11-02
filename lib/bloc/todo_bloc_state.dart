 import 'package:harold_to_do_app/utility/exports.dart';

// possible status values
enum Status { initial, loading, done, error }

class TodoState extends Equatable {
  final List<Todo> todos;
  final Status status;

  const TodoState({
    this.todos = const <Todo>[],
    this.status = Status.initial,
  });

  TodoState copyWith({
    List<Todo>? todos,
    Status? status,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }


// Extract the list of todos from the JSON and map each JSON object to a Todo object
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var todoList = (json['todos'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();

      return TodoState(
        todos: todoList,
        status: Status.values.firstWhere(
          (element) => element.toString() == 'Status.${json['status']}',
          orElse: () => Status.initial,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }


// Convert each Todo object in the todos list to its JSON representation
  Map<String, dynamic> toJson() {
    return {
      'todos': todos.map((todo) => todo.toJson()).toList(),
      'status': status.toString().split('.').last,
    };
  }

  @override
  List<Object?> get props => [todos, status];
}
