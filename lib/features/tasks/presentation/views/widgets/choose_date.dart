import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/tasks/presentation/manager/new_task_cubit/new_task_cubit.dart';

class ChooseDate extends StatefulWidget {
  const ChooseDate({super.key, this.updating = false});

  final bool updating;

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  DateTime today = getIt.get<DateTime>();
  DateTime focusedDay = getIt.get<DateTime>();

  @override
  void initState() {
    super.initState();
    if (widget.updating == true) {
      focusedDay = BlocProvider.of<NewTaskCubit>(context).date;
      today = BlocProvider.of<NewTaskCubit>(context).date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {CalendarFormat.week: 'Week'},

      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
          color: kPrimaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: kPrimaryColor.withValues(alpha: 0.25),
          shape: BoxShape.circle,
        ),
        todayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),

      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, today),
      onDaySelected: (selectedDay, newFocusedDay) {
        setState(() {
          today = selectedDay;
          focusedDay = newFocusedDay;
        });
        BlocProvider.of<NewTaskCubit>(context).date = selectedDay;
      },
    );
  }
}
