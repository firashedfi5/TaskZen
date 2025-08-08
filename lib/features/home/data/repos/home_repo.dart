import 'package:dartz/dartz.dart';
import 'package:task_management_app/core/errors/failure.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<TaskModel>>> fetchTasks(
    //String userId,
    DateTime date,
  ); //* GET /tasks
}
