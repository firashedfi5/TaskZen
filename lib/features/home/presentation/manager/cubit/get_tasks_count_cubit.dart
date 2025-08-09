import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home/data/repos/home_repo.dart';

part 'get_tasks_count_state.dart';

class GetTasksCountCubit extends Cubit<GetTasksCountState> {
  GetTasksCountCubit(this.homeRepo) : super(GetTasksCountInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTasksCountPerMonth(int month, int year) async {
    emit(GetTasksCountLoading());
    var result = await homeRepo.fetchTasksCountPerMonth(month, year);
    result.fold(
      (failure) {
        emit(GetTasksCountFailure(failure.message));
      },
      (tasksCount) {
        emit(GetTasksCountSuccess(tasksCount));
      },
    );
  }
}
