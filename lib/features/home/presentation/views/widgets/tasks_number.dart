import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';

class TasksNumber extends StatelessWidget {
  const TasksNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      sliver: SliverToBoxAdapter(
        child: Text.rich(
          TextSpan(
            style: Styles.textStyle26.copyWith(fontWeight: FontWeight.w600),
            children: const [
              TextSpan(text: 'You have '),
              TextSpan(
                text: '50 tasks',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              TextSpan(text: ' in\nthis month 🏆'),
            ],
          ),
        ),
      ),
    );
  }
}
