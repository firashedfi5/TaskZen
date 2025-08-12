import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class PriorityContainer extends StatelessWidget {
  const PriorityContainer({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: taskModel.priority == "High"
            ? kHighPriorityColor
            : taskModel.priority == "Medium"
            ? kMediumPriorityColor
            : kLowPriorityColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        child: Text(taskModel.priority!, style: Styles.textStyle12),
      ),
    );
  }
}
