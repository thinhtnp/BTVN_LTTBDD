import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/task_api_service.dart';

class TaskDetailController extends ChangeNotifier {
  Task? task;
  bool isLoading = true;

  Future<void> loadDetail(int id) async {
    try {
      isLoading = true;
      notifyListeners();

      task = await TaskApiService.fetchTaskDetail(id);
    } catch (e) {
      debugPrint('DETAIL ERROR: $e');
      task = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


  Future<void> deleteTask(int id) async {
    await TaskApiService.deleteTask(id);
  }
}
