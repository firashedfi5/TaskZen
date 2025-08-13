import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/app_router.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_screen_body.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Screen'),
        actions: [
          IconButton(
            onPressed: () =>
                GoRouter.of(context).push(AppRouter.kNewTaskScreen),
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: TaskScreenBody(task: task),
    );
  }
}
