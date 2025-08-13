import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/calendar/data/repos/calendar_repo_impl.dart';
import 'package:task_management_app/features/calendar/presentation/manager/calendar_cubit/calendar_cubit.dart';
import 'package:task_management_app/features/calendar/presentation/manager/calendar_tasks_cubit/calendar_tasks_cubit.dart';
import 'package:task_management_app/features/calendar/presentation/views/widgets/calendar.dart';
import 'package:task_management_app/features/calendar/presentation/views/widgets/calendar_tasks.dart';
import 'package:task_management_app/features/home/data/repos/home_repo_impl.dart';

class CalendarScreenBody extends StatelessWidget {
  const CalendarScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CalendarTasksCubit(getIt.get<HomeRepoImpl>())
                ..fetchTasksByDate(getIt.get<DateTime>()),
        ),
        BlocProvider(
          create: (context) =>
              CalendarCubit(getIt.get<CalendarRepoImpl>())..fetchAllTasks(),
        ),
      ],
      child: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(title: Text('Calendar')),
          Calendar(),
          CalendarTasks(),
        ],
      ),
    );
  }
}
