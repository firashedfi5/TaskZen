part of 'calendar_cubit.dart';

@immutable
sealed class CalendarState {}

final class CalendarInitial extends CalendarState {}

final class CalendarLoading extends CalendarState {}

final class CalendarSuccess extends CalendarState {
  final List<TaskModel> tasks;

  CalendarSuccess(this.tasks);
}

final class CalendarFailure extends CalendarState {
  final String errMessage;

  CalendarFailure(this.errMessage);
}
