part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSucces extends HomeState {
  final List<TaskModel> tasks;

  HomeSucces(this.tasks);
}

final class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure(this.errMessage);
}
