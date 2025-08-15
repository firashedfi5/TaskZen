import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/app_router.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/task_repo_impl.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_priority_container.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_screen_body.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(getIt.get<TaskRepoImpl>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task Details'),
          actions: [
            TaskDetailsPriorityContainer(priority: task.priority!),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () => GoRouter.of(
                context,
              ).push(AppRouter.kNewTaskScreen, extra: task),
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: TaskDetailsScreenBody(task: task),
      ),
    );
  }
}
