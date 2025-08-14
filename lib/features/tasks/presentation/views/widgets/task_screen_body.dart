import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/core/utils/functions/time_formating.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';

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
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(task.id!.toString()),
            Text(task.title!),
            Text(task.description!),
            Text(task.priority!),
            Text(task.date!.toIso8601String().split('T').first),
            Text(formatTimeOfDay(task.startTime!)),
            Text(formatTimeOfDay(task.endTime!)),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TaskCubit>(context).deleteTask(id: task.id!);
              },
              style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
              child: const Text(
                'Delete Task',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
