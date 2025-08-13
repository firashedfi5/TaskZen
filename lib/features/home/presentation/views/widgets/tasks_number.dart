import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/home/presentation/manager/get_tasks_count_cubit/get_tasks_count_cubit.dart';

class TasksNumber extends StatelessWidget {
  const TasksNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      sliver: SliverToBoxAdapter(
        child: BlocBuilder<GetTasksCountCubit, GetTasksCountState>(
          builder: (context, state) {
            if (state is GetTasksCountSuccess) {
              return Text.rich(
                TextSpan(
                  style: Styles.textStyle26.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    const TextSpan(text: 'You have '),
                    TextSpan(
                      text: '${state.tasksCount.toString()} tasks',
                      style: const TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const TextSpan(text: ' in\nthis month 🏆'),
                  ],
                ),
              );
            } else if (state is GetTasksCountFailure) {
              return const Center(
                child: Icon(Icons.error, color: Colors.red, size: 30),
              );
            } else if (state is GetTasksCountLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
