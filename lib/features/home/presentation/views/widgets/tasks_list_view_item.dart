import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';

class TasksListViewItem extends StatelessWidget {
  const TasksListViewItem({
    super.key,
    required this.aspectRatio,
    required this.maxLines,
  });

  final double aspectRatio;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor.withAlpha(65),
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Team Meating',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Group discussion for the new product.Group discussion for the new product.Group discussion for the new product.Group discussion for the new product.',
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
                style: Styles.textStyle16,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [Icon(Icons.watch_later_outlined), Text('10:00 AM')],
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: kHighPriorityColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    child: Text('High Priority', style: Styles.textStyle11),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
