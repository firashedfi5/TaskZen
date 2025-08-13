import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/functions/time_formating.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class TaskScreenBody extends StatelessWidget {
  const TaskScreenBody({super.key, required this.task});

  final TaskModel task;

  get kSecondaryColor => null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(task.id!.toString()),
          Text(task.title!),
          Text(task.description!),
          Text(task.priority!),
          Text(task.date!.toIso8601String().split('T').first),
          Text(formatTimeOfDay(task.startTime!)),
          Text(formatTimeOfDay(task.endTime!)),
        ],
      ),
    );
  }
}
