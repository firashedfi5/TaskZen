import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/functions/build_status_menu_item.dart';

class StatusButton extends StatelessWidget {
  const StatusButton({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 0),
      child: PopupMenuButton<String>(
        onSelected: (String newStatus) {
          // context.read<TaskCubit>().updateTaskStatus(task, newStatus);
        },
        itemBuilder: (BuildContext context) => [
          buildStatusMenuItem(
            'To Do',
            'To Do',
            Icons.radio_button_unchecked,
            Colors.grey.shade600,
            status,
          ),
          buildStatusMenuItem(
            'Progress',
            'Progress',
            Icons.play_circle_outline,
            Colors.orange.shade600,
            status,
          ),
          buildStatusMenuItem(
            'Done',
            'Done',
            Icons.check_circle,
            Colors.green.shade600,
            status,
          ),
          buildStatusMenuItem(
            'cancelled',
            'Cancelled',
            Icons.cancel,
            Colors.red.shade600,
            status,
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 8,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: status == 'To Do'
                ? Colors.blue.withValues(alpha: 0.2)
                : status == 'Progress'
                ? Colors.orange.withValues(alpha: 0.2)
                : status == 'Done'
                ? Colors.green.withValues(alpha: 0.2)
                : Colors.red.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: status == 'To Do'
                  ? Colors.blue.withValues(alpha: 0.5)
                  : status == 'Progress'
                  ? Colors.orange.withValues(alpha: 0.5)
                  : status == 'Done'
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
                  status == 'To Do'
                      ? Icons.radio_button_unchecked
                      : status == 'Progress'
                      ? Icons.play_circle_outline
                      : status == 'Done'
                      ? Icons.check_circle_outline
                      : Icons.cancel,
                  key: ValueKey(status),
                  size: 18,
                  color: status == 'To Do'
                      ? Colors.blue
                      : status == 'Progress'
                      ? Colors.orange
                      : status == 'Done'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
              const SizedBox(width: 6),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  status == 'To Do'
                      ? 'To Do'
                      : status == 'Progress'
                      ? 'Progress'
                      : status == 'Done'
                      ? 'Done'
                      : 'Cancelled',
                  key: ValueKey('${status}_text'),
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: status == 'To Do'
                        ? Colors.blue
                        : status == 'Progress'
                        ? Colors.orange
                        : status == 'Done'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_down,
                size: 16,
                color: status == 'To Do'
                    ? Colors.blue
                    : status == 'Progress'
                    ? Colors.orange
                    : status == 'Done'
                    ? Colors.green
                    : Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
