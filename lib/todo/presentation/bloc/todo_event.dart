import 'package:flutter_technical_assesment_repalogic/core/enums/todo_filter.dart';
import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';

abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;
  AddTodo(this.title);
}

class UpdateTodo extends TodoEvent {
  final Todo todo;
  UpdateTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}

class ChangeFilter extends TodoEvent {
  final TodoFilter filter;
  ChangeFilter(this.filter);
}
