import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view_item_loading.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class CalendarTasksListViewLoading extends StatelessWidget {
  const CalendarTasksListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Skeletonizer(
          enabled: true,
          enableSwitchAnimation: true,
          effect: ShimmerEffect(
            duration: const Duration(milliseconds: 1000),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[100]!,
          ),
          child: Column(
            children: List.generate(
              2,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TasksListViewItemLoading(
                  taskModel: TaskModel(
                    id: 0,
                    userId: 'skeleton',
                    title: 'Task title...',
                    description: 'Description that shows skeleton effect...',
                    priority: 'Medium',
                    startTime: const TimeOfDay(hour: 9, minute: 0),
                  ),
                  aspectRatio: 3 / 1.15,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
