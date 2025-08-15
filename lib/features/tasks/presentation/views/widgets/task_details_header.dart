import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/status_button.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.status,
  });

  final String title;
  final String status;

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
        StatusButton(status: status),
      ],
    );
  }
}
