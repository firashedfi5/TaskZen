import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/calendar/data/repos/calendar_repo.dart';
import 'package:task_management_app/features/home/data/repos/home_repo.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit(this.homeRepo, this.calendarRepo) : super(CalendarInitial());
  final HomeRepo homeRepo;
  final CalendarRepo calendarRepo;

  DateTime focusedDay = getIt.get<DateTime>();

  Future<void> fetchTasksByDate(DateTime date) async {
    emit(CalendarLoading());
    // await Future.delayed(const Duration(seconds: 5));
    var result = await homeRepo.fetchTasksByDate(date);
    result.fold(
      (failure) {
        emit(CalendarFailure(failure.message));
      },
      (tasks) {
        emit(CalendarSuccess(tasks));
      },
    );
  }

  Future<void> fetchAllTasks() async {
    emit(CalendarLoading());
    // await Future.delayed(const Duration(seconds: 5));
    var result = await calendarRepo.fetchAllTasks();
    result.fold(
      (failure) {
        emit(CalendarFailure(failure.message));
      },
      (tasks) {
        emit(CalendarSuccess(tasks));
      },
    );
  }
}
