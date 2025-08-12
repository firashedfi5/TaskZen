import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/home/presentation/manager/filtering_cubit/filtering_cubit.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view_item.dart';
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
          } else if (state is FilteringLoading) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          } else if (state is FilteringFailure) {
            return const SliverToBoxAdapter(
              child: Center(child: Text('Something went wrong')),
            );
          }
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today\'s Tasks',
                  style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: TaskListView(date: getIt.get<DateTime>()),
                ),
                Text(
                  'Tomorrow\'s Tasks',
                  style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
          );
        },
      ),
    );
  }
}
