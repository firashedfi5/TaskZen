import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/functions/date_formating.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: kPrimaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: kPrimaryColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.calendar_today_rounded,
            size: 14,
            color: kPrimaryColor.shade800,
          ),
          const SizedBox(width: 4),
          Text(
            formatDate(taskModel.date!),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: kPrimaryColor.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
