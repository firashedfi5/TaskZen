import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/presentation/manager/new_task_cubit/new_task_cubit.dart';

class Priority extends StatefulWidget {
  const Priority({super.key, this.updating = false});

  final bool updating;

  @override
  State<Priority> createState() => _PriorityState();
}

class _PriorityState extends State<Priority> {
  String? selectedPriority;

  final List<Map<String, dynamic>> priorities = [
    {'name': 'High', 'color': kHighPriorityColor},
    {'name': 'Medium', 'color': kMediumPriorityColor},
    {'name': 'Low', 'color': kLowPriorityColor},
  ];

  @override
  void initState() {
    super.initState();
    if (widget.updating == true) {
      selectedPriority = BlocProvider.of<NewTaskCubit>(context).priority;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      BlocProvider.of<NewTaskCubit>(context).priority =
                          selectedPriority ?? '';
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
