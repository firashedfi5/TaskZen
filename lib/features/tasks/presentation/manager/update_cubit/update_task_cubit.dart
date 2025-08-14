import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.taskRepo) : super(UpdateTaskInitial());

  final TaskRepo taskRepo;

  Future<void> updateTask({required TaskModel task}) async {
    emit(UpdateTaskLoading());
    var result = await taskRepo.updateTask(task);
    result.fold((failure) => emit(UpdateTaskFailure(failure.message)), (
      success,
    ) {
      emit(UpdateTaskSuccess('Task created successfully'));
      log('Task updated successfully ✓');
    });
  }
}
