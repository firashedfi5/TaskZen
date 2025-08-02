import 'package:flutter/material.dart';
import 'package:task_management_app/features/home/presentation/view/widgets/tasks_list_view_item.dart';

class CalendarTasks extends StatelessWidget {
  const CalendarTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 5,
          (context, index) => const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: TasksListViewItem(aspectRatio: 3 / 1.15, maxLines: 1),
          ),
        ),
      ),
    );
  }
}
