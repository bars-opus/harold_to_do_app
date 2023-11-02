// Define events
import 'package:harold_to_do_app/utility/exports.dart';

// Define a base TodoEvent class that extends Equatable
class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

// Define an AddTodo event that extends TodoEvent
class AddTodo extends TodoEvent {
  final Todo todo;

  const AddTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

// Define a RemoveTodo event that extends TodoEvent
class RemoveTodo extends TodoEvent {
  final Todo todo;

  const RemoveTodo(this.todo);

  @override
  List<Object?> get props => [todo];
}

// Define a ModifyTodo event that extends TodoEvent
class ModifyTodo extends TodoEvent {
  final int index;

  const ModifyTodo(this.index);

  @override
  List<Object?> get props => [index];
}
