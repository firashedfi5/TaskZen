import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo_impl.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/new_task_screen_body.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key, this.task});

  final TaskModel? task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(getIt.get<TaskRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(task == null ? 'New Task' : 'Updating Task'),
        ),
        body: NewTaskScreenBody(task: task),
      ),
    );
  }
}
