import 'package:flutter/material.dart';
import 'package:task_management_app/features/calendar/presentation/views/widgets/calendar.dart';
import 'package:task_management_app/features/calendar/presentation/views/widgets/calendar_tasks.dart';

class CalendarScreenBody extends StatelessWidget {
  const CalendarScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(title: Text('Calendar')),
        Calendar(),
        CalendarTasks(),
      ],
    );
  }
}
