import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failure.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  @override
  Future<Either<Failure, TaskModel>> createTask(TaskModel task, String userId) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id, String userId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskModel>> getTaskById(int id, String userId) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TaskModel>> updateTask(
    int id,
    TaskModel task,
    String userId,
  ) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
