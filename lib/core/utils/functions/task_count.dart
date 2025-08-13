import 'package:task_management_app/features/calendar/presentation/manager/calendar_cubit/calendar_cubit.dart';

Map<DateTime, int> calendarTaskCount(CalendarSuccess state) {
  final Map<DateTime, int> taskCountByDate = {};

  for (var task in state.tasks) {
    if (task.date != null) {
      final dateOnly = DateTime(
        task.date!.year,
        task.date!.month,
        task.date!.day,
      );

      //* It works but i didn't understand it
      taskCountByDate[dateOnly] = (taskCountByDate[dateOnly] ?? 0) + 1;
    }
  }
  return taskCountByDate;
}
