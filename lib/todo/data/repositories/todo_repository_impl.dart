

import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';
import 'package:flutter_technical_assesment_repalogic/todo/domain/repositories/todo_repositories.dart';

class TodoRepositoryImpl implements TodoRepository {
  final List<Todo> _todos = [];

  @override
  List<Todo> getTodos() => List.unmodifiable(_todos);

  @override
  void addTodo(Todo todo) => _todos.add(todo);

  @override
  void updateTodo(Todo todo) {
    final index = _todos.indexWhere((e) => e.id == todo.id);
    _todos[index] = todo;
  }

  @override
  void deleteTodo(String id) {
    _todos.removeWhere((e) => e.id == id);
  }
}
