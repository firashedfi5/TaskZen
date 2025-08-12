import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/app_router.dart';
import 'package:task_management_app/features/home/presentation/views/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreenBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GoRouter.of(context).push(AppRouter.kNewTaskScreen),
        backgroundColor: kSecondaryColor,
        child: const Icon(Icons.add, size: 34, color: Colors.white),
      ),
    );
  }
}
