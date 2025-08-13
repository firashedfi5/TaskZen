part of 'calendar_tasks_cubit.dart';

@immutable
sealed class CalendarTasksState {}

final class CalendarTasksInitial extends CalendarTasksState {}

final class CalendarTasksLoading extends CalendarTasksState {}

final class CalendarTasksSuccess extends CalendarTasksState {
  final List<TaskModel> tasks;

  CalendarTasksSuccess(this.tasks);
}

final class CalendarTasksFailure extends CalendarTasksState {
  final String errMessage;

  CalendarTasksFailure(this.errMessage);
}
