import 'package:flutter/material.dart';
import 'package:task_management_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:task_management_app/features/home/presentation/view/widgets/custom_search_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [CustomAppBar(), CustomSearchBar()],
      ),
    );
  }
}
