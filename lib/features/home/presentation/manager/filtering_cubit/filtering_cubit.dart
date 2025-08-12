import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home/data/repos/home_repo.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'filtering_state.dart';

class FilteringCubit extends Cubit<FilteringState> {
  FilteringCubit(this.homeRepo) : super(FilteringInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTasksByStatus(String status) async {
    emit(FilteringLoading());
    // await Future.delayed(const Duration(seconds: 5));
    var result = await homeRepo.fetchTasksByStatus(status);
    result.fold(
      (failure) {
        emit(FilteringFailure(failure.message));
      },
      (tasks) {
        emit(FilteringSuccess(tasks));
      },
    );
  }

  void resetToInitial() {
    emit(FilteringInitial());
  }
}
