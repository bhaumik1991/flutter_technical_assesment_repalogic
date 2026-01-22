import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_event.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({required this.todo});

  void _showEditDialog(BuildContext parentContext, Todo todo) {
    final editController = TextEditingController(text: todo.title);

    showDialog(
      context: parentContext,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Todo'),
        content: TextField(
          controller: editController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Update todo',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(), // ✅
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final updatedText = editController.text.trim();

              if (updatedText.isNotEmpty) {
                parentContext.read<TodoBloc>().add( // ✅
                  UpdateTodo(
                    todo.copyWith(title: updatedText),
                  ),
                );
              }

              Navigator.of(dialogContext).pop(); // ✅
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Checkbox(
              value: todo.isCompleted,
              activeColor: Colors.green,
              onChanged: (val) {
                context.read<TodoBloc>().add(
                  UpdateTodo(todo.copyWith(isCompleted: val)),
                );
              },
            ),
            Expanded(
              child: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: todo.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                  color:
                  todo.isCompleted ? Colors.grey : Colors.black87,
                ),
              ),
            ),
            IconButton(
              tooltip: 'Edit',
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () => _showEditDialog(context, todo),
            ),
            IconButton(
              tooltip: 'Delete',
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () =>
                  context.read<TodoBloc>().add(DeleteTodo(todo.id)),
            ),
          ],
        ),
      ),
    );
  }
}
