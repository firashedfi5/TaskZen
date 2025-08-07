import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home/data/repos/home_repo.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;

  Future<void> fetchTasks() async {
    emit(HomeLoading());
    var result = await homeRepo.fetchTasks();
    result.fold(
      (failure) {
        emit(HomeFailure(failure.message));
      },
      (tasks) {
        emit(HomeSucces(tasks));
      },
    );
  }
}
