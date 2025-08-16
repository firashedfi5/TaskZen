part of 'task_cubit.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}

final class NewTaskLoading extends TaskState {}

final class NewTaskSuccess extends TaskState {
  final String successMessage;

  NewTaskSuccess(this.successMessage);
}

final class NewTaskFailure extends TaskState {
  final String errMessage;

  NewTaskFailure(this.errMessage);
}

//* Update task states
class UpdateTaskInitial extends TaskState {
  final TaskModel task;
  UpdateTaskInitial(this.task);
}

final class UpdateTaskLoading extends TaskState {}

final class UpdateTaskSuccess extends TaskState {
  final String successMessage;

  UpdateTaskSuccess(this.successMessage);
}

final class UpdateTaskFailure extends TaskState {
  final String errMessage;

  UpdateTaskFailure(this.errMessage);
}

//* Delete task states
final class DeleteTaskLoading extends TaskState {}

final class DeleteTaskSuccess extends TaskState {
  final String successMessage;

  DeleteTaskSuccess(this.successMessage);
}

final class DeleteTaskFailure extends TaskState {
  final String errMessage;

  DeleteTaskFailure(this.errMessage);
}

//* Update status
class TaskStatusUpdated extends TaskState {
  final TaskModel task;

  TaskStatusUpdated(this.task);
}
