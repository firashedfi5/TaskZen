import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';

class TaskDetailsDescriptionSection extends StatelessWidget {
  const TaskDetailsDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.description_outlined, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Text(
          'Description',
          style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
