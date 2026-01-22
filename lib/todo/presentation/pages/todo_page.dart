import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/core/enums/todo_filter.dart';
import 'package:flutter_technical_assesment_repalogic/core/widgets/to_do_card.dart';
import 'package:flutter_technical_assesment_repalogic/todo/domain/entities/todo.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_event.dart';
import 'package:flutter_technical_assesment_repalogic/todo/presentation/bloc/todo_state.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My To-Do List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<TodoFilter>(
            icon: const Icon(Icons.filter_list),
            onSelected: (filter) =>
                context.read<TodoBloc>().add(ChangeFilter(filter)),
            itemBuilder: (_) => const [
              PopupMenuItem(value: TodoFilter.all, child: Text('All')),
              PopupMenuItem(value: TodoFilter.completed, child: Text('Completed')),
              PopupMenuItem(value: TodoFilter.pending, child: Text('Pending')),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          _buildAddTodo(context),
          Expanded(child: _buildTodoList()),
        ],
      ),
    );
  }

  // Add Todo Section
  Widget _buildAddTodo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'What do you need to do?',
            contentPadding: const EdgeInsets.all(16),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.deepPurple),
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  context.read<TodoBloc>().add(AddTodo(controller.text.trim()));
                  controller.clear();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // Todo List
  Widget _buildTodoList() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (_, state) {
        if (state.filteredTodos.isEmpty) {
          return const Center(
            child: Text(
              'No tasks yet ✨',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: state.filteredTodos.length,
          itemBuilder: (_, i) {
            final todo = state.filteredTodos[i];
            return TodoCard(todo: todo);
          },
        );
      },
    );
  }
}

