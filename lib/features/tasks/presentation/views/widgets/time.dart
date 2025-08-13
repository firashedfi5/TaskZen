import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/time_picker_button.dart';

class Time extends StatelessWidget {
  const Time({super.key, this.updating = false});

  final bool updating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Start Time', style: Styles.textStyle18),
            TimePickerButton(startTime: true, updating: updating),
          ],
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('End Time', style: Styles.textStyle18),
            TimePickerButton(startTime: false),
          ],
        ),
      ],
    );
  }
}
