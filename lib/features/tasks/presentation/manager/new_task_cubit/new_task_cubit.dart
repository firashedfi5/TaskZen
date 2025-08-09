import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit(this.taskRepo) : super(TaskInitial());

  final TaskRepo taskRepo;
  String priority = 'Low';
  DateTime date = getIt.get<DateTime>();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  Future<void> createTask({required TaskModel task}) async {
    emit(TaskLoading());
    var result = await taskRepo.createTask(task);
    result.fold((failure) => emit(TaskFailure(failure.message)), (success) {
      emit(TaskSuccess('Task created successfully'));
      log('Task created successfully ✓');
    });
  }
}
