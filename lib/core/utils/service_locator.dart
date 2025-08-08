import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task_management_app/core/utils/api_service.dart';
import 'package:task_management_app/features/calendar/data/repos/calendar_repo_impl.dart';
import 'package:task_management_app/features/home/data/repos/home_repo_impl.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo_impl.dart';
import 'package:uuid/uuid.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<TaskRepoImpl>(TaskRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CalendarRepoImpl>(
    CalendarRepoImpl(getIt.get<ApiService>()),
  );
  getIt.registerSingleton<Uuid>(const Uuid());
}
