import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/features/home/presentation/manager/filtering_cubit/filtering_cubit.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_grid_view_sliver.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_grid_view_sliver_loading.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/today_and_tomorrow_tasks.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class TasksOverviewSection extends StatelessWidget {
  const TasksOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: BlocConsumer<FilteringCubit, FilteringState>(
        listener: (context, state) {
          if (state is FilteringFailure) {
            customSnackBar(
              context: context,
              errMessage: state.errMessage,
              success: false,
            );
          }
        },
        builder: (context, state) {
          if (state is FilteringSuccess) {
            List<TaskModel> tasks = state.tasks;
            if (tasks.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'No Task Added Yet',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
            return TasksGridViewSliver(tasks: tasks);
          } else if (state is FilteringLoading) {
            return const TasksGridViewSliverLoading();
          } else if (state is FilteringFailure) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Icon(Icons.error, color: Colors.red, size: 30),
              ),
            );
          }
          return const SliverToBoxAdapter(child: TodayAndTomorrowTasks());
        },
      ),
    );
  }
}
