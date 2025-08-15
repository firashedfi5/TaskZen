import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/functions/date_formating.dart';

class TaskDetailsDurationSummary extends StatelessWidget {
  const TaskDetailsDurationSummary({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  final TimeOfDay startTime;
  final TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kPrimaryColor.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kPrimaryColor.shade200, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: kPrimaryColor.shade700),
          const SizedBox(width: 6),
          Text(
            'Duration: ${calculateDuration(startTime, endTime)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kPrimaryColor.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
