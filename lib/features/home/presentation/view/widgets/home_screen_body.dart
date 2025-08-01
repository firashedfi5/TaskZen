import 'package:flutter/material.dart';
import 'package:task_management_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/home/presentation/view/widgets/custom_search_bar.dart';
import 'package:task_management_app/features/home/presentation/view/widgets/tasks_overview.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const CustomAppBar(),
          const CustomSearchBar(),
          SliverToBoxAdapter(
            child: Container(
              width: 50,
              height: 100,
              decoration: const BoxDecoration(color: Colors.red),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            sliver: TasksOverview(title: 'Today\'s Tasks'),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            sliver: TasksOverview(title: 'Tomorrow\'s Tasks'),
          ),
        ],
      ),
    );
  }
}
