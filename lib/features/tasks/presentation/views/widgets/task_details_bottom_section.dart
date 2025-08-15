import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_date_section.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_duration_summary.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_time_section.dart';

class TaskDetailsBottomSection extends StatelessWidget {
  const TaskDetailsBottomSection({
    super.key,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.38,
      child: Card(
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                kPrimaryColor.shade100.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date Section
                TaskDetailsDateSection(date: date),

                const SizedBox(height: 16),

                // Time Section
                TaskDetailsTimeSection(startTime: startTime, endTime: endTime),

                const Spacer(),

                // Duration summary at bottom
                TaskDetailsDurationSummary(
                  startTime: startTime,
                  endTime: endTime,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
