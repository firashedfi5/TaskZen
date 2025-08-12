import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/core/utils/functions/date_comparaison.dart';
import 'package:task_management_app/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/task_list_view_loading.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view_item.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTasksCubit, GetTasksState>(
      listener: (context, state) {
        if (state is GetTasksFailure) {
          customSnackBar(
            context: context,
            errMessage: state.errMessage,
            success: false,
          );
        }
      },
      builder: (context, state) {
        if (state is GetTasksSuccess) {
          final tasksForDate = state.tasks.where((task) {
            return isSameDay(task.date!, date);
          }).toList();

          if (tasksForDate.isEmpty) {
            return const Center(
              child: Text(
                'No Task Added Yet',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: tasksForDate.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TasksListViewItem(
                taskModel: tasksForDate[index],
                aspectRatio: 3 / 3,
                maxLines: 2,
              );
            },
          );
        } else if (state is GetTasksFailure) {
          return const Center(
            child: Icon(Icons.error, color: Colors.red, size: 30),
          );
        } else if (state is GetTasksLoading) {
          return const TaskListViewLoading();
        }
        return const SizedBox();
      },
    );
  }
}
