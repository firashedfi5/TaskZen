import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.priority});

  final String title;
  final String priority;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
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
            color: priority == 'High'
                ? kHighPriorityColor
                : priority == 'Medium'
                ? kMediumPriorityColor
                : kLowPriorityColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color:
                    (priority == 'High'
                            ? kHighPriorityColor
                            : priority == 'Medium'
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
                priority == 'High'
                    ? Icons.priority_high
                    : priority == 'Medium'
                    ? Icons.remove
                    : Icons.low_priority,
                size: 14,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                priority,
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
