import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class TaskScreenBody extends StatelessWidget {
  const TaskScreenBody({super.key, required this.task});

  final TaskModel task;

  get kSecondaryColor => null;

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(children: []),
    );
  }
}
