import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/task_detail_controller.dart';

class TaskDetailScreen extends StatelessWidget {
  final int taskId;
  const TaskDetailScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskDetailController()..loadDetail(taskId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Detail'),
          actions: [
            Consumer<TaskDetailController>(
              builder: (_, controller, __) => IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await controller.deleteTask(taskId);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
        body: Consumer<TaskDetailController>(
          builder: (_, controller, __) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final task = controller.task!;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(task.description),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    children: [
                      _infoChip(Icons.category, 'Work'),
                      _infoChip(Icons.timelapse, task.status),
                      _infoChip(Icons.flag, 'High'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Chip(
      avatar: Icon(icon, size: 16),
      label: Text(text),
    );
  }
}
