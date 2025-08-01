import 'package:flutter/material.dart';
import 'package:task_management_app/features/home/presentation/view/widgets/tasks_list_view_item.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const TasksListViewItem();
      },
    );
  }
}
