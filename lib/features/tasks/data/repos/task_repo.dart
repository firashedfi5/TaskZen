import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failure.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

abstract class TaskRepo {
  // Future<Either<Failure, List<TaskModel>>> fetchTasks(String userId); //* GET /tasks
  Future<Either<Failure, TaskModel>> getTaskById(
    int id,
    String userId,
  ); //* / GET /tasks/:id
  Future<Either<Failure, TaskModel>> createTask(
    TaskModel task,
    String userId,
  ); //* POST /tasks
  Future<Either<Failure, TaskModel>> updateTask(
    int id,
    TaskModel task,
    String userId,
  ); //* PATCH /tasks/:id
  Future<Either<Failure, void>> deleteTask(
    int id,
    String userId,
  ); //* DELETE /tasks/:id
}
