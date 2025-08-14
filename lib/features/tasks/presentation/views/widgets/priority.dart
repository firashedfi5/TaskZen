import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';

class Priority extends StatefulWidget {
  const Priority({super.key});

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  String? selectedPriority;
  bool _initialized = false;

  final List<Map<String, dynamic>> priorities = [
    {'name': 'High', 'color': kHighPriorityColor},
    {'name': 'Medium', 'color': kMediumPriorityColor},
    {'name': 'Low', 'color': kLowPriorityColor},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (!_initialized && state is UpdateTaskInitial) {
          selectedPriority = state.task.priority;
          _initialized = true;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Priority', style: Styles.textStyle18),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: priorities
                  .map(
                    (priority) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: FilterChip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        side: BorderSide(color: priority['color']),
                        label: Text(
                          priority['name'],
                          style: selectedPriority == priority['name']
                              ? const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )
                              : null,
                        ),
                        checkmarkColor: selectedPriority == priority['name']
                            ? Colors.white
                            : null,
                        selected: selectedPriority == priority['name'],
                        selectedColor: priority['color'],
                        onSelected: (value) {
                          setState(() {
                            selectedPriority = value ? priority['name'] : null;
                          });
                          BlocProvider.of<TaskCubit>(context).priority =
                              selectedPriority ?? '';
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
