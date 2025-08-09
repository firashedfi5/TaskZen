import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view.dart';

class TasksOverview extends StatelessWidget {
  const TasksOverview({super.key, required this.title, required this.date});
  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: TaskListView(date: date),
            ),
          ],
        ),
      ),
    );
  }
}
