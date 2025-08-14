import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home/data/repos/home_repo.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit(this.homeRepo) : super(GetTasksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTasksByDate(DateTime date) async {
    emit(GetTasksLoading());
    // await Future.delayed(const Duration(seconds: 5));
    var result = await homeRepo.fetchTasksByDate(date);
    result.fold(
      (failure) {
        emit(GetTasksFailure(failure.message));
      },
      (tasks) {
        emit(GetTasksSuccess(tasks));
      },
    );
  }
}
