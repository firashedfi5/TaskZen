import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_bottom_section.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/task_details_upper_section.dart';

class TaskScreenBody extends StatelessWidget {
  const TaskScreenBody({super.key, required this.task});

  final TaskModel task;

  get kSecondaryColor => null;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is DeleteTaskLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is DeleteTaskSuccess) {
          Navigator.of(context).pop();
          GoRouter.of(context).pop();
          customSnackBar(
            context: context,
            errMessage: state.successMessage,
            success: true,
          );
        } else if (state is DeleteTaskFailure) {
          Navigator.of(context).pop();
          customSnackBar(
            context: context,
            errMessage: state.errMessage,
            success: false,
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TaskDetailsUpperSection(
                title: task.title!,
                description: task.description!,
                priority: task.priority!,
              ),
              const SizedBox(height: 8),
              TaskDetailsBottomSection(
                date: task.date!,
                startTime: task.startTime!,
                endTime: task.endTime!,
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  BlocProvider.of<TaskCubit>(context).deleteTask(id: task.id!);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  fixedSize: Size(MediaQuery.of(context).size.width, 45),
                ),
                label: const Text(
                  'Delete Task',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(Icons.delete, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
