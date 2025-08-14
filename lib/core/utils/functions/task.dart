import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/utils/service_locator.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/manager/new_task_cubit/new_task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/manager/update_cubit/update_task_cubit.dart';
import 'package:uuid/uuid.dart';

void createTask(
  BuildContext context,
  GlobalKey<FormState> formKey,
  TextEditingController titleController,
  TextEditingController descriptionController,
) {
  final isValid = formKey.currentState!.validate();
  if (!isValid) return;

  final cubit = BlocProvider.of<NewTaskCubit>(context);

  cubit.createTask(
    task: TaskModel(
      userId: getIt.get<Uuid>().v4(),
      title: titleController.text,
      description: descriptionController.text,
      priority: cubit.priority,
      date: cubit.date,
      startTime: cubit.startTime,
      endTime: cubit.endTime,
      status: cubit.status,
    ),
  );
}

void updateTask(
  BuildContext context,
  TextEditingController titleController,
  TextEditingController descriptionController,
) {
  final cubit = BlocProvider.of<NewTaskCubit>(context);

  BlocProvider.of<UpdateTaskCubit>(context).updateTask(
    task: TaskModel(
      id: cubit.id,
      userId: cubit.userId,
      title: titleController.text,
      description: descriptionController.text,
      priority: cubit.priority,
      date: cubit.date,
      startTime: cubit.startTime,
      endTime: cubit.endTime,
      status: cubit.status,
    ),
  );
}
