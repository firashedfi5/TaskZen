import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';

Widget buildTaskDots(int taskCount) {
  if (taskCount == 0) return const SizedBox.shrink();

  // final dotsToShow = taskCount > 4 ? 4 : taskCount;
  // if (taskCount > 4) {
  //   return Align(
  //     alignment: Alignment.bottomRight,
  //     child: Container(
  //       height: 15,
  //       width: 15,
  //       decoration: BoxDecoration(
  //         color: selectedDate == true ? Colors.deepOrangeAccent : kPrimaryColor,
  //         borderRadius: BorderRadius.circular(6),
  //       ),
  //       child: Center(
  //         child: Text(
  //           taskCount.toString(),
  //           style: const TextStyle(
  //             fontSize: 12,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  return Align(
    alignment: Alignment.bottomRight,
    child: Container(
      height: 17,
      width: 17,
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          taskCount.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );

  // return Row(
  //   mainAxisSize: MainAxisSize.min,
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: List.generate(dotsToShow, (index) {
  //     return Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 1),
  //       width: 5,
  //       height: 5,
  //       decoration: BoxDecoration(
  //         color: selectedDate == true ? Colors.white : kPrimaryColor,
  //         shape: BoxShape.circle,
  //       ),
  //     );
  //   }),
  // );
}

//* Default day builder (for days with no tasks)
Widget buildDefaultDay(
  BuildContext context,
  DateTime day,
  DateTime focusedDay,
  Map<DateTime, int> taskCountByDate,
) {
  final taskCount =
      taskCountByDate[DateTime(day.year, day.month, day.day)] ?? 0;

  return SizedBox(
    width: 40,
    height: 40,
    // padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${day.day}', style: const TextStyle(fontSize: 16)),
        // const SizedBox(height: 2),
        buildTaskDots(taskCount),
      ],
    ),
  );
}

//* Selected day builder (for the currently selected day)
Widget buildSelectedDay(
  BuildContext context,
  DateTime day,
  DateTime focusedDay,
  Map<DateTime, int> taskCountByDate,
) {
  final taskCount =
      taskCountByDate[DateTime(day.year, day.month, day.day)] ?? 0;

  return Container(
    height: 40,
    width: 40,
    // padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: kPrimaryColor,
      shape: BoxShape.circle,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${day.day}',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        buildTaskDots(taskCount),
      ],
    ),
  );
}

//* Today builder (for today's date)
Widget buildTodayDay(
  BuildContext context,
  DateTime day,
  DateTime focusedDay,
  Map<DateTime, int> taskCountByDate,
) {
  final taskCount =
      taskCountByDate[DateTime(day.year, day.month, day.day)] ?? 0;

  return Container(
    width: 40,
    height: 40,
    // padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: kPrimaryColor.withValues(alpha: 0.25),
      shape: BoxShape.circle,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${day.day}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        // const SizedBox(height: 2),
        buildTaskDots(taskCount),
      ],
    ),
  );
}
