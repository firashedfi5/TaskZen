part of 'filtering_cubit.dart';

@immutable
sealed class FilteringState {}

final class FilteringInitial extends FilteringState {}

final class FilteringLoading extends FilteringState {}

final class FilteringSuccess extends FilteringState {
  final List<TaskModel> tasks;

  FilteringSuccess(this.tasks);
}

final class FilteringFailure extends FilteringState {
  final String errMessage;

  FilteringFailure(this.errMessage);
}
