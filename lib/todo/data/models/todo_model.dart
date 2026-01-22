
import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    required super.id,
    required super.title,
    super.isCompleted,
  });
}
