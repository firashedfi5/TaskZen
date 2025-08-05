import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_management_app/core/errors/failure.dart';
import 'package:task_management_app/core/utils/api_service.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  final ApiService apiService;

  TaskRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Unit>> createTask(TaskModel task) async {
    log('Task data: ${task.toJson()}');
    try {
      await apiService.post(endPoint: '/create-task', data: task.toJson());
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
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
