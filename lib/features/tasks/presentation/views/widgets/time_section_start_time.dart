import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/functions/time_formating.dart';

class TimeSectionStartTime extends StatelessWidget {
  const TimeSectionStartTime({super.key, required this.startTime});

  final TimeOfDay startTime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade200.withValues(alpha: 0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              Icons.play_circle_outline,
              color: Colors.green.shade600,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              'Start Time',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              formatTimeOfDay(startTime),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
