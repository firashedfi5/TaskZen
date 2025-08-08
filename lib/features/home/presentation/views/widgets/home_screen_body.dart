import 'package:flutter/material.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/status_bar.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_number.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/tasks_overview.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          const TasksNumber(),
          const CustomSearchBar(),
          const StatusBar(),
          TasksOverview(title: 'Today\'s Tasks', date: DateTime.now()),
          TasksOverview(
            title: 'Tomorrow\'s Tasks',
            date: DateTime.now().add(const Duration(days: 1)),
          ),
        ],
      ),
    );
  }
}
