import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_api_service.dart';

class TaskListController extends ChangeNotifier {
  List<Task> tasks = [];
  bool isLoading = false;

  Future<void> loadTasks() async {
    try {
      isLoading = true;
      notifyListeners();

      tasks = await TaskApiService.fetchTasks();
    } catch (e) {
      tasks = [];
      debugPrint('ERROR: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  void toggleTask(Task task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  bool get isEmpty => tasks.isEmpty;
}
