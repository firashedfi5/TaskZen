import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view.dart';

class TasksOverviewSection extends StatelessWidget {
  const TasksOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Tasks',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: TaskListView(date: getIt.get<DateTime>()),
            ),
            Text(
              'Tomorrow\'s Tasks',
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: TaskListView(
                date: getIt.get<DateTime>().add(const Duration(days: 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
