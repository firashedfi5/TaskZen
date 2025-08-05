import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepo) : super(TaskInitial());

  final TaskRepo taskRepo;

  Future<void> createTask(TaskModel task, String userId) async {
    emit(TaskLoading());
    var result = await taskRepo.createTask(task, userId);
    result.fold(
      (failure) => emit(TaskFailure(failure.message)),
      (success) => emit(TaskSuccess()),
    );
  }
}
