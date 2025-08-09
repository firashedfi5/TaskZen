part of 'get_tasks_count_cubit.dart';

@immutable
sealed class GetTasksCountState {}

final class GetTasksCountInitial extends GetTasksCountState {}

final class GetTasksCountLoading extends GetTasksCountState {}

final class GetTasksCountSuccess extends GetTasksCountState {
  final int tasksCount;

  GetTasksCountSuccess(this.tasksCount);
}

final class GetTasksCountFailure extends GetTasksCountState {
  final String errMessage;

  GetTasksCountFailure(this.errMessage);
}
