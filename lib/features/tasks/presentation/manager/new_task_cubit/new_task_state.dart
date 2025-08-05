part of 'new_task_cubit.dart';

@immutable
sealed class NewTaskState {}

final class TaskInitial extends NewTaskState {}

final class TaskLoading extends NewTaskState {}

final class TaskSuccess extends NewTaskState {}

final class TaskFailure extends NewTaskState {
  final String errMessage;

  TaskFailure(this.errMessage);
}
