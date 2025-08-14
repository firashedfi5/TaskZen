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
  int? id;
  String? userId;
  String priority = 'Low';
  DateTime date = getIt.get<DateTime>();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  String status = 'To Do';

  Future<void> createTask({required TaskModel task}) async {
    emit(TaskLoading());
    var result = await taskRepo.createTask(task);
    result.fold((failure) => emit(TaskFailure(failure.message)), (success) {
      emit(TaskSuccess('Task created successfully'));
      log('Task created successfully ✓');
    });
  }

  void initializeWithTask(TaskModel task) {
    id = task.id!;
    userId = task.userId!;
    date = task.date!;
    startTime = task.startTime!;
    endTime = task.endTime!;
    priority = task.priority!;

    emit(TaskInitializedForUpdating(task));
  }
}
