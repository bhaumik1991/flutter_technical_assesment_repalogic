import 'package:flutter_technical_assesment_repalogic/core/enums/todo_filter.dart';
import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';

class TodoState {
  final List<Todo> todos;
  final TodoFilter filter;

  TodoState({required this.todos, this.filter = TodoFilter.all});

  List<Todo> get filteredTodos {
    switch (filter) {
      case TodoFilter.completed:
        return todos.where((e) => e.isCompleted).toList();
      case TodoFilter.pending:
        return todos.where((e) => !e.isCompleted).toList();
      default:
        return todos;
    }
  }
}
