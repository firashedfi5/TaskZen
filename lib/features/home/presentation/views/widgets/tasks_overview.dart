import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/home/data/repos/home_repo_impl.dart';
import 'package:task_management_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_list_view.dart';

class TasksOverview extends StatelessWidget {
  const TasksOverview({super.key, required this.title, required this.date});
  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(getIt.get<HomeRepoImpl>())..fetchTasksByDate(date),
      child: SliverPadding(
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
                child: const TaskListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
