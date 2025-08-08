import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/features/calendar/presentation/manager/calendar_cubit/calendar_cubit.dart';
import 'package:task_management_app/features/calendar/presentation/views/widgets/calendar_tasks_loading.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view_item.dart';

class CalendarTasks extends StatelessWidget {
  const CalendarTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarCubit, CalendarState>(
      listener: (context, state) {
        if (state is CalendarFailure) {
          customSnackBar(
            context: context,
            errMessage: state.errMessage,
            success: false,
          );
        }
      },
      builder: (context, state) {
        if (state is CalendarSuccess) {
          if (state.tasks.isEmpty) {
            return const SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Text(
                    'No Task Added Yet',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: state.tasks.length,
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TasksListViewItem(
                    taskModel: state.tasks[index],
                    aspectRatio: 3 / 1.15,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          );
        } else if (state is CalendarFailure) {
          return const Text('data');
        } else {
          return const CalendarTasksLoading();
        }
      },
    );
  }
}
