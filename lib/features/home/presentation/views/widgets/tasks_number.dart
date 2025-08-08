import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/home/data/repos/home_repo_impl.dart';
import 'package:task_management_app/features/home/presentation/manager/home_cubit/home_cubit.dart';

class TasksNumber extends StatelessWidget {
  const TasksNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        getIt.get<HomeRepoImpl>(),
      )..fetchTasksCountPerMonth(DateTime.now().month + 1, DateTime.now().year),
      child: const SliverPadding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        sliver: SliverToBoxAdapter(child: TasksCount()),
      ),
    );
  }
}

class TasksCount extends StatelessWidget {
  const TasksCount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeTasksCountLoaded) {
          return Text.rich(
            TextSpan(
              style: Styles.textStyle26.copyWith(fontWeight: FontWeight.w600),
              children: [
                const TextSpan(text: 'You have '),
                TextSpan(
                  text: '${state.tasksCount.toString()} tasks',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const TextSpan(text: ' in\nthis month 🏆'),
              ],
            ),
          );
        } else if (state is HomeFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
