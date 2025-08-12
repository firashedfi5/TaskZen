import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_management_app/core/errors/failure.dart';
import 'package:task_management_app/core/utils/api_service.dart';
import 'package:task_management_app/features/home/data/repos/home_repo.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<TaskModel>>> fetchTasksByDate(
    DateTime date,
  ) async {
    try {
      var data = await apiService.get(
        endPoint: '/tasks/date?date=${date.toIso8601String().split('T').first}',
      );
      List<TaskModel> tasks = [];
      for (var item in data['data']) {
        tasks.add(TaskModel.fromJson(item));
      }
      return right(tasks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> fetchTasksCountPerMonth(
    int month,
    int year,
  ) async {
    try {
      var data = await apiService.get(
        endPoint: '/tasks/stats/monthly?month=$month&year=$year',
      );
      return right(data['count']);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<TaskModel>>> fetchTasksByStatus(String status) async {
    try {
      var data = await apiService.get(
        endPoint: '/tasks/date?status=$status',
      );
      List<TaskModel> tasks = [];
      for (var item in data['data']) {
        tasks.add(TaskModel.fromJson(item));
      }
      return right(tasks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
