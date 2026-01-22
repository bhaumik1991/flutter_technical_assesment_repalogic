import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';
import 'package:flutter_technical_assesment_repalogic/todo/domain/repositories/todo_repositories.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_event.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;

  TodoBloc(this.repository) : super(TodoState(todos: [])) {
    on<AddTodo>((event, emit) {
      repository.addTodo(
        Todo(id: DateTime.now().toString(), title: event.title),
      );
      emit(TodoState(todos: repository.getTodos(), filter: state.filter));
    });

    on<UpdateTodo>((event, emit) {
      repository.updateTodo(event.todo);
      emit(TodoState(todos: repository.getTodos(), filter: state.filter));
    });

    on<DeleteTodo>((event, emit) {
      repository.deleteTodo(event.id);
      emit(TodoState(todos: repository.getTodos(), filter: state.filter));
    });

    on<ChangeFilter>((event, emit) {
      emit(TodoState(todos: state.todos, filter: event.filter));
    });
  }
}
