import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/home/data/repos/home_repo_impl.dart';
import 'package:task_management_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/status_bar.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_number.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_overview.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>()),
      child: const SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            CustomAppBar(),
            TasksNumber(),
            CustomSearchBar(),
            StatusBar(),
            TasksOverview(title: 'Today\'s Tasks'),
            TasksOverview(title: 'Tomorrow\'s Tasks'),
          ],
        ),
      ),
    );
  }
}
