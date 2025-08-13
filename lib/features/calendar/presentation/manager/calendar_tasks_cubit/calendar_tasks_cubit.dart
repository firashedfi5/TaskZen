import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/home/data/repos/home_repo.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'calendar_tasks_state.dart';

class CalendarTasksCubit extends Cubit<CalendarTasksState> {
  CalendarTasksCubit(this.homeRepo) : super(CalendarTasksInitial());
  final HomeRepo homeRepo;

  DateTime focusedDay = getIt.get<DateTime>();

  // TODO: Make a method in the backend to only fetch tasks for specific day
  Future<void> fetchTasksByDate(DateTime date) async {
    emit(CalendarTasksLoading());
    // await Future.delayed(const Duration(seconds: 5));
    var result = await homeRepo.fetchTasksByDate(date);
    result.fold(
      (failure) {
        emit(CalendarTasksFailure(failure.message));
      },
      (tasks) {
        emit(CalendarTasksSuccess(tasks));
      },
    );
  }
}
