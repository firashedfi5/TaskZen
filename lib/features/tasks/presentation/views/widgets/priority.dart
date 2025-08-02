import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';

class Priority extends StatelessWidget {
  const Priority({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Priority', style: Styles.textStyle18),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FilterChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: const BorderSide(color: kHighPriorityColor),
              label: const Text('High'),
              onSelected: (value) {},
            ),
            const SizedBox(width: 10),
            FilterChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: const BorderSide(color: kMediumPriorityColor),
              label: const Text('Medium'),
              onSelected: (value) {},
            ),
            const SizedBox(width: 10),
            FilterChip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: const BorderSide(color: kLowPriorityColor),
              label: const Text('Low'),
              onSelected: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
