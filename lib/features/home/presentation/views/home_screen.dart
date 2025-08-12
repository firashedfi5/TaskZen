import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/app_router.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/home/data/repos/home_repo_impl.dart';
import 'package:task_management_app/features/home/presentation/manager/filtering_cubit/filtering_cubit.dart';
import 'package:task_management_app/features/home/presentation/manager/get_tasks_count_cubit/get_tasks_count_cubit.dart';
import 'package:task_management_app/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetTasksCountCubit(getIt.get<HomeRepoImpl>())
            ..fetchTasksCountPerMonth(
              getIt.get<DateTime>().month,
              getIt.get<DateTime>().year,
            ),
        ),
        BlocProvider(
          create: (context) =>
              GetTasksCubit(getIt.get<HomeRepoImpl>())
                ..fetchTasksByDate(getIt.get<DateTime>()),
        ),
        BlocProvider(
          create: (context) => FilteringCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: Scaffold(
        body: const HomeScreenBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => GoRouter.of(context).push(AppRouter.kNewTaskScreen),
          backgroundColor: kSecondaryColor,
          child: const Icon(Icons.add, size: 34, color: Colors.white),
        ),
      ),
    );
  }
}
