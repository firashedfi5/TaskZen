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
    // log('Task data: ${task.toJson()}');
    try {
      await apiService.post(endPoint: '/tasks', data: task.toJson());
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(int id) async {
    try {
      await apiService.delete(endPoint: '/tasks/$id');
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTask(
    TaskModel task,
    // String userId,
  ) async {
    try {
      // log('Updated task data: ${task.toJson()}');
      await apiService.put(endPoint: '/tasks/${task.id}', data: task.toJson());
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
