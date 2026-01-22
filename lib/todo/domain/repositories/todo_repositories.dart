
import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  List<Todo> getTodos();
  void addTodo(Todo todo);
  void updateTodo(Todo todo);
  void deleteTodo(String id);
}
