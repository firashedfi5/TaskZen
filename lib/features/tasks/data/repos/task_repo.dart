import 'package:task_management_app/features/tasks/data/models/task_model.dart';

abstract class TaskRepo {
  // Future<List<TaskModel>> fetchTasks(String userId); //* GET /tasks
  Future<TaskModel> getTaskById(int id, String userId); //* / GET /tasks/:id
  Future<TaskModel> createTask(TaskModel task, String userId); //* POST /tasks
  Future<TaskModel> updateTask(
    int id,
    TaskModel task,
    String userId,
  ); //* PATCH /tasks/:id
  Future<void> deleteTask(int id, String userId); //* DELETE /tasks/:id
}
