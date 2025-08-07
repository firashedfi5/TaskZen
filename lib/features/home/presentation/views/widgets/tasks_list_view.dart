import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/task_list_view_loading.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view_item.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeFailure) {
          customSnackBar(
            context: context,
            errMessage: state.errMessage,
            success: false,
          );
        }
      },
      builder: (context, state) {
        if (state is HomeSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: state.tasks.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return TasksListViewItem(
                taskModel: state.tasks[index],
                aspectRatio: 3 / 3,
                maxLines: 2,
              );
            },
          );
        } else if (state is HomeSuccess) {
          return const Text('data');
        } else {
          return const TaskListViewLoading();
        }
      },
    );
  }
}
