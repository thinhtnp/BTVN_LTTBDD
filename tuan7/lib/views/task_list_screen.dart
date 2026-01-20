import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/task_list_controller.dart';
import '../models/task_model.dart';
import 'task_detail_screen.dart';
import 'empty_view.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final c = TaskListController();
        c.loadTasks();
        return c;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('SmartTasks')),
        body: Consumer<TaskListController>(
          builder: (_, controller, __) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.isEmpty) {
              return const EmptyView();
            }

            return ListView.builder(
              itemCount: controller.tasks.length,
              itemBuilder: (_, index) {
                final task = controller.tasks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            TaskDetailScreen(taskId: task.id),
                      ),
                    );
                  },
                  child: taskCard(task),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget taskCard(Task task) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _statusColor(task.status),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Consumer<TaskListController>(
            builder: (_, controller, __) => Checkbox(
              value: task.isDone,
              onChanged: (_) {
                controller.toggleTask(task);
              },
            ),
          ),

          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(task.description,
                    style: const TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _chip(Icons.schedule, '14:00'),
                    const SizedBox(width: 8),
                    _chip(Icons.flag, task.status),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'In Progress':
        return const Color(0xFFFFCDD2);
      case 'Pending':
        return const Color(0xFFFFF9C4);
      default:
        return const Color(0xFFE3F2FD);
    }
  }
}
