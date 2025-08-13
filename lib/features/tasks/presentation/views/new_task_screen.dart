import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo_impl.dart';
import 'package:task_management_app/features/tasks/presentation/manager/new_task_cubit/new_task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/new_task_screen_body.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTaskCubit(getIt.get<TaskRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('New Task')),
        body: const NewTaskScreenBody(),
      ),
    );
  }
}
