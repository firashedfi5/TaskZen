part of 'update_task_cubit.dart';

@immutable
sealed class UpdateTaskState {}

final class UpdateTaskInitial extends UpdateTaskState {}

final class UpdateTaskLoading extends UpdateTaskState {}

final class UpdateTaskSuccess extends UpdateTaskState {
  final String successMessage;

  UpdateTaskSuccess(this.successMessage);
}

final class UpdateTaskFailure extends UpdateTaskState {
  final String errMessage;

  UpdateTaskFailure(this.errMessage);
}
