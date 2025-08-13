import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_management_app/core/utils/functions/task_count.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/calendar/presentation/manager/calendar_cubit/calendar_cubit.dart';
import 'package:task_management_app/features/calendar/presentation/manager/calendar_tasks_cubit/calendar_tasks_cubit.dart';
import 'package:task_management_app/features/calendar/presentation/views/widgets/calendar_builder_methods.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = getIt.get<DateTime>();
  DateTime focusedDay = getIt.get<DateTime>();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          if (state is CalendarSuccess) {
            Map<DateTime, int> taskCountByDate = calendarTaskCount(state);

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TableCalendar(
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: focusedDay,
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: (selectedDay, newFocusedDay) {
                  setState(() {
                    today = selectedDay;
                    focusedDay = newFocusedDay;
                  });
                  BlocProvider.of<CalendarTasksCubit>(context).focusedDay =
                      focusedDay;

                  BlocProvider.of<CalendarTasksCubit>(
                    context,
                  ).fetchTasksByDate(focusedDay);

                  //* Testing
                  // log(taskCountByDate[DateTime(2025, 8, 13)].toString());
                },

                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) => buildDefaultDay(
                    context,
                    day,
                    focusedDay,
                    taskCountByDate,
                  ),

                  selectedBuilder: (context, day, focusedDay) =>
                      buildSelectedDay(
                        context,
                        day,
                        focusedDay,
                        taskCountByDate,
                      ),

                  todayBuilder: (context, day, focusedDay) =>
                      buildTodayDay(context, day, focusedDay, taskCountByDate),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
