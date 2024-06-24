import 'dart:convert';
import 'dart:developer';
import '../../../product/constant/base_constants.dart';
import '../../../product/utils/service/http_service.dart';
import '../../../product/utils/service/shared_preferences_service.dart';
import '../model/task_model.dart';

class TaskService {
  final SharedPreferencesServiceManager _sharedPreferencesServiceManager =
      SharedPreferencesServiceManager();
  final HttpServiceManager _httpServiceManager = HttpServiceManager();

  Future<List<Task>> loadTasks() async {
    String? tasksString =
        await _sharedPreferencesServiceManager.getString(BaseConstant.tasksKey);
    if (tasksString != null) {
      List<Task> tasks = (jsonDecode(tasksString) as List)
          .map((taskJson) => Task.fromJson(taskJson))
          .toList();
      return tasks;
    }
    return [];
  }

  Future<void> addTask(Task task) async {
    final response = await _httpServiceManager.post(
      'https://jsonplaceholder.typicode.com/posts',
      {
        'title': task.title,
        'body': task.description,
        'userId': 1,
      },
    );
    if (response.statusCode == 201) {
      List<Task> tasks = await loadTasks();
      tasks.add(task);

      await _sharedPreferencesServiceManager.setString(
        BaseConstant.tasksKey,
        jsonEncode(tasks.map((task) => task.toJson()).toList()),
      );
    } else {
      log('Failed to create task: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  }

  Future<void> deleteTask(Task task) async {
    List<Task> tasks = await loadTasks();
    tasks.removeWhere(
        (t) => t.title == task.title && t.description == task.description);

    await _sharedPreferencesServiceManager.setString(
      BaseConstant.tasksKey,
      jsonEncode(tasks.map((task) => task.toJson()).toList()),
    );
  }
}
