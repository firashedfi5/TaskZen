import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class TasksListViewItem extends StatelessWidget {
  const TasksListViewItem({
    super.key,
    required this.aspectRatio,
    required this.maxLines,
    required this.taskModel,
  });

  final double aspectRatio;
  final int maxLines;
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor.withAlpha(65),
          // border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.title!,
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                taskModel.description!,
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
                style: Styles.textStyle16,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined),
                  const SizedBox(width: 5),
                  Text(taskModel.startTime!.format(context)),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: taskModel.priority == "High"
                        ? kHighPriorityColor
                        : taskModel.priority == "Medium"
                        ? kMediumPriorityColor
                        : kLowPriorityColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    child: Text(taskModel.priority!, style: Styles.textStyle12),
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
