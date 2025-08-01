import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';

class TasksListViewItem extends StatelessWidget {
  const TasksListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withAlpha(65),
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withAlpha(150),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  child: Text('HIGH', style: Styles.textStyle11),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Team Meating',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              const Text(
                'Group discussion for the new product.',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Styles.textStyle16,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [Icon(Icons.watch_later_outlined), Text('10:00 AM')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
