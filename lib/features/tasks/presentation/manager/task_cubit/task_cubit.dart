import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepo) : super(TaskInitial());

  final TaskRepo taskRepo;
  int? id;
  String? userId;
  String priority = 'Low';
  DateTime date = getIt.get<DateTime>();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  String status = 'To Do';

  Future<void> createTask({required TaskModel task}) async {
    emit(NewTaskLoading());
    var result = await taskRepo.createTask(task);
    result.fold((failure) => emit(NewTaskFailure(failure.message)), (success) {
      emit(NewTaskSuccess('Task created successfully'));
      log('Task created successfully ✓');
    });
  }

  //* Initilization methods
  void initializeWithTask(TaskModel task) {
    id = task.id!;
    userId = task.userId!;
    date = task.date!;
    startTime = task.startTime!;
    endTime = task.endTime!;
    priority = task.priority!;
    status = task.status!;

    emit(UpdateTaskInitial(task));
  }

  //* Update task method
  Future<void> updateTask({required TaskModel task}) async {
    emit(UpdateTaskLoading());
    var result = await taskRepo.updateTask(task);
    result.fold((failure) => emit(UpdateTaskFailure(failure.message)), (
      success,
    ) {
      emit(UpdateTaskSuccess('Task updated successfully'));
      log('Task updated successfully ✓');
    });
  }

  //* Delete task method
  Future<void> deleteTask({required int id}) async {
    emit(DeleteTaskLoading());
    var result = await taskRepo.deleteTask(id);
    result.fold((failure) => emit(DeleteTaskFailure(failure.message)), (
      success,
    ) {
      emit(DeleteTaskSuccess('Task deleted successfully'));
      log('Task deleted successfully ✓');
    });
  }

  //* Update status
  Future<void> updateTaskStatus(TaskModel task, String newStatus) async {
    emit(UpdateTaskLoading());
    final updatedTask = task.copyWith(status: newStatus);
    var result = await taskRepo.updateTaskStatus(updatedTask);
    result.fold((failure) => emit(UpdateTaskFailure(failure.message)), (r) {
      emit(TaskStatusUpdated(updatedTask));
      // log(updatedTask.toString());
    });
  }
}
