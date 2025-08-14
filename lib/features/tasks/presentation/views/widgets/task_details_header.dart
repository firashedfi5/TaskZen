import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            task.title!,
            style: Styles.textStyle24.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 12),
        // Enhanced priority badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: task.priority! == 'High'
                ? kHighPriorityColor
                : task.priority! == 'Medium'
                ? kMediumPriorityColor
                : kLowPriorityColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color:
                    (task.priority! == 'High'
                            ? kHighPriorityColor
                            : task.priority! == 'Medium'
                            ? kMediumPriorityColor
                            : kLowPriorityColor)
                        .withValues(alpha: .3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                task.priority! == 'High'
                    ? Icons.priority_high
                    : task.priority! == 'Medium'
                    ? Icons.remove
                    : Icons.low_priority,
                size: 14,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                task.priority!,
                style: Styles.textStyle12.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
