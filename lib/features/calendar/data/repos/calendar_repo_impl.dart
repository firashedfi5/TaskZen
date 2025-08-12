import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_management_app/core/errors/failure.dart';
import 'package:task_management_app/core/utils/api_service.dart';
import 'package:task_management_app/features/calendar/data/repos/calendar_repo.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class CalendarRepoImpl implements CalendarRepo {
  CalendarRepoImpl(this.apiService);

  final ApiService apiService;

  @override
  Future<Either<Failure, List<TaskModel>>> fetchAllTasks() async {
    try {
      var data = await apiService.get(endPoint: '/tasks');
      List<TaskModel> tasks = [];
      for (var item in data['data']) {
        tasks.add(TaskModel.fromJson(item));
      }
      log('Fetched ${tasks.length} in total');
      return right(tasks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
