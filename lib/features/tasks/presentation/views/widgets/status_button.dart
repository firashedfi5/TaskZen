import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/functions/build_status_menu_item.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        String currentStatus = task.status!;
        if (state is TaskStatusUpdated && state.task.id == task.id) {
          currentStatus = state.task.status ?? currentStatus;
        }
        return Container(
          margin: const EdgeInsets.only(right: 0),
          child: PopupMenuButton<String>(
            onSelected: (String newStatus) {
              BlocProvider.of<TaskCubit>(
                context,
              ).updateTaskStatus(task, newStatus);
              // context.read<TaskCubit>().updateTaskStatus(task, newStatus);
            },
            itemBuilder: (BuildContext context) => [
              buildStatusMenuItem(
                'To Do',
                'To Do',
                Icons.radio_button_unchecked,
                Colors.grey.shade600,
                currentStatus,
              ),
              buildStatusMenuItem(
                'Progress',
                'Progress',
                Icons.play_circle_outline,
                Colors.orange.shade600,
                currentStatus,
              ),
              buildStatusMenuItem(
                'Done',
                'Done',
                Icons.check_circle,
                Colors.green.shade600,
                currentStatus,
              ),
              buildStatusMenuItem(
                'Cancelled',
                'Cancelled',
                Icons.cancel,
                Colors.red.shade600,
                currentStatus,
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: currentStatus == 'To Do'
                    ? Colors.blue.withValues(alpha: 0.2)
                    : currentStatus == 'Progress'
                    ? Colors.orange.withValues(alpha: 0.2)
                    : currentStatus == 'Done'
                    ? Colors.green.withValues(alpha: 0.2)
                    : Colors.red.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: currentStatus == 'To Do'
                      ? Colors.blue.withValues(alpha: 0.5)
                      : currentStatus == 'Progress'
                      ? Colors.orange.withValues(alpha: 0.5)
                      : currentStatus == 'Done'
                      ? Colors.green.withValues(alpha: 0.5)
                      : Colors.red.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      currentStatus == 'To Do'
                          ? Icons.radio_button_unchecked
                          : currentStatus == 'Progress'
                          ? Icons.play_circle_outline
                          : currentStatus == 'Done'
                          ? Icons.check_circle_outline
                          : Icons.cancel,
                      key: ValueKey(task.status),
                      size: 18,
                      color: currentStatus == 'To Do'
                          ? Colors.blue
                          : currentStatus == 'Progress'
                          ? Colors.orange
                          : currentStatus == 'Done'
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      currentStatus == 'To Do'
                          ? 'To Do'
                          : currentStatus == 'Progress'
                          ? 'Progress'
                          : currentStatus == 'Done'
                          ? 'Done'
                          : 'Cancelled',
                      key: ValueKey('${task.status}_text'),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: currentStatus == 'To Do'
                            ? Colors.blue
                            : currentStatus == 'Progress'
                            ? Colors.orange
                            : currentStatus == 'Done'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: currentStatus == 'To Do'
                        ? Colors.blue
                        : currentStatus == 'Progress'
                        ? Colors.orange
                        : currentStatus == 'Done'
                        ? Colors.green
                        : Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
