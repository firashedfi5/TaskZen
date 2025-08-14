import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class TaskDetailsDescriptionText extends StatelessWidget {
  const TaskDetailsDescriptionText({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: SingleChildScrollView(
          child: Text(
            task.description!,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
