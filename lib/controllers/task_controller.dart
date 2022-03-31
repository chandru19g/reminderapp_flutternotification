import 'package:get/get.dart';
import 'package:reminderapp/db/db_helper.dart';
import 'package:reminderapp/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTasks();
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DbHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DbHelper.query();

    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }

  void deleteTasks(Task task) async {
    await DbHelper.delete(task);
    getTasks();
  }

  void updateTaskCompleted(int id) async {
    await DbHelper.update(id);
    getTasks();
  }
}
