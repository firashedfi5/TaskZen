import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_description_section.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_description_text.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_header.dart';

class TaskDetailsUpperSection extends StatelessWidget {
  const TaskDetailsUpperSection({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Card(
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: .15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                kPrimaryColor.shade100.withValues(alpha: 0.3),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(task: task),

                const SizedBox(height: 16),

                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.grey.shade300,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const TaskDetailsDescriptionSection(),

                const SizedBox(height: 8),

                // Description text in scrollable container
                TaskDetailsDescriptionText(description: task.description!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
