import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/date_container.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/priority_container.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/time_container.dart';
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
          color: kPrimaryColor.withAlpha(65),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskModel.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
              ),

              // const SizedBox(height: 8),
              Text(
                taskModel.description!,
                overflow: TextOverflow.ellipsis,
                maxLines: maxLines,
                style: Styles.textStyle16,
              ),

              TimeContainer(taskModel: taskModel),

              // const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateContainer(taskModel: taskModel),
                  PriorityContainer(taskModel: taskModel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
