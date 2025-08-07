import 'package:flutter/material.dart';

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
            child: Placeholder(),
            // TasksListViewItem(taskModel: ,aspectRatio: 3 / 1.15, maxLines: 1),
          ),
        ),
      ),
    );
  }
}
