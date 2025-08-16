import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failure.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

abstract class TaskRepo {
  // Future<Either<Failure, TaskModel>> getTaskById(
  //   int id,
  //   String userId,
  // ); //* / GET /tasks/:id

  Future<Either<Failure, Unit>> createTask(TaskModel task); //* POST /tasks

  //* PUT /tasks/:id
  Future<Either<Failure, Unit>> updateTask(
    TaskModel task,
    // String userId,
  );
  
  //* PUT /tasks/:id
  Future<Either<Failure, Unit>> updateTaskStatus(
    TaskModel task,
    // String userId,
  );

  //* DELETE /tasks/:id
  Future<Either<Failure, Unit>> deleteTask(
    int id,
    // String userId
  );
}
