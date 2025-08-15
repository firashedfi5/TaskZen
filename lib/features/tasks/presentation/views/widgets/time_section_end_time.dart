import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/functions/time_formating.dart';

class TimeSectionEndTime extends StatelessWidget {
  const TimeSectionEndTime({super.key, required this.endTime});

  final TimeOfDay endTime;

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
              Icons.stop_circle_outlined,
              color: Colors.red.shade600,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              'End Time',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              formatTimeOfDay(endTime),
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
