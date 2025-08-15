import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/time_section_end_time.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/time_section_start_time.dart';

class TaskDetailsTimeSection extends StatelessWidget {
  const TaskDetailsTimeSection({
    super.key,
    required this.startTime,
    required this.endTime,
  });

  final TimeOfDay startTime;
  final TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.access_time, size: 18, color: Colors.grey.shade600),
            const SizedBox(width: 8),
            Text(
              'Time Duration',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            // Start Time
            TimeSectionStartTime(startTime: startTime),

            // Arrow or connector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.grey.shade500,
                size: 20,
              ),
            ),

            // End Time
            TimeSectionEndTime(endTime: endTime),
          ],
        ),
      ],
    );
  }
}
