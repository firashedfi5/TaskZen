part of 'get_tasks_cubit.dart';

@immutable
sealed class GetTasksState {}

final class GetTasksInitial extends GetTasksState {}

final class GetTasksLoading extends GetTasksState {}

final class GetTasksSuccess extends GetTasksState {
  final List<TaskModel> tasks;

  GetTasksSuccess(this.tasks);
}

final class GetTasksFailure extends GetTasksState {
  final String errMessage;

  GetTasksFailure(this.errMessage);
}

final class GetTasksCountLoading extends GetTasksState {}

final class GetTasksCountSuccess extends GetTasksState {
  final int tasksCount;

  GetTasksCountSuccess(this.tasksCount);
}

final class GetTasksCountFailure extends GetTasksState {
  final String errMessage;

  GetTasksCountFailure(this.errMessage);
}
