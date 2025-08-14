import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';

class TimePickerButton extends StatefulWidget {
  const TimePickerButton({super.key, required this.startTime});

  final bool startTime;

  @override
  State<TimePickerButton> createState() => _TimePickerButtonState();
}

class _TimePickerButtonState extends State<TimePickerButton> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  bool _initialized = false;

  Future<void> _showTimePicker() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (!mounted || selectedTime == null) return;

    setState(() => _timeOfDay = selectedTime);

    final cubit = BlocProvider.of<TaskCubit>(context);
    if (widget.startTime == true) {
      cubit.startTime = selectedTime;
    } else {
      cubit.endTime = selectedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (!_initialized && state is UpdateTaskInitial) {
          if (widget.startTime) {
            _timeOfDay = state.task.startTime ?? TimeOfDay.now();
          } else {
            _timeOfDay = state.task.endTime ?? TimeOfDay.now();
          }
          _initialized = true;
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: Styles.textStyle16,
            fixedSize: Size(MediaQuery.of(context).size.width * .43, 45),
            side: const BorderSide(color: Colors.grey, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onPressed: _showTimePicker,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.watch_later_outlined),
              const SizedBox(width: 5),
              Text(_timeOfDay.format(context).toString()),
            ],
          ),
        );
      },
    );
  }
}
