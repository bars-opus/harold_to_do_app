import 'package:harold_to_do_app/utility/exports.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<TodoEvent>(_todEvent); // Handle TodoEvent
    on<RemoveTodo>(_removeTodo); // Handle RemoveTodo
    on<ModifyTodo>(_modifyTodo); // Handle ModifyTodo
    on<AddTodo>(_addTodo); // Handle AddTodo
  }


// Add the new Todo item to the list
  void _addTodo(AddTodo todo, Emitter<TodoState> emit) {
    emit(
      state.copyWith(status: Status.loading),
    );
    try {
      List<Todo> temp = [];
      temp.addAll(state.todos);
      temp.add(todo.todo); // Add the new Todo item

      emit(state.copyWith(todos: temp, status: Status.done));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }


 // Remove the specified Todo item from the list
  void _removeTodo(RemoveTodo todo, Emitter<TodoState> emit) {
    emit(
      state.copyWith(status: Status.loading),
    );
    try {
      List<Todo> temp = List.from(state.todos);
      temp.remove(todo.todo);

      emit(state.copyWith(todos: temp, status: Status.done));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }


// Toggle the completion status of the specified Todo item in the  list
  void _modifyTodo(ModifyTodo todo, Emitter<TodoState> emit) {
    emit(
      state.copyWith(status: Status.loading),
    );
    try {
      List<Todo> temp = List.from(state.todos);
      temp[todo.index].isCompleted = !temp[todo.index].isCompleted;

      emit(state.copyWith(todos: temp, status: Status.done));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

// Update the state with the same todos list and set the status to done
  void _todEvent(TodoEvent todo, Emitter<TodoState> emit) {
    if (state.status == Status.done) return;
    emit(state.copyWith(todos: state.todos, status: Status.done));
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toJson();
  }
}
