import 'package:flutter/material.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view_item.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class TasksGridViewSliver extends StatelessWidget {
  const TasksGridViewSliver({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => TasksListViewItem(
          taskModel: tasks[index],
          aspectRatio: 3 / 3,
          maxLines: 2,
        ),
        childCount: tasks.length,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
    );
  }
}
