import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/manager/task_cubit/task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/add_task_button.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/choose_date.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/custom_text_form_field.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/priority.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/time.dart';

class NewTaskScreenBody extends StatefulWidget {
  const NewTaskScreenBody({super.key});

  @override
  State<NewTaskScreenBody> createState() => _NewTaskScreenBodyState();
}

class _NewTaskScreenBodyState extends State<NewTaskScreenBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is TaskLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        } else if (state is TaskSuccess) {
          Navigator.of(context).pop();
          GoRouter.of(context).pop();

          // ScaffoldMessenger.of(
          //   context,
          // ).showSnackBar(SnackBar(content: Text('Task created successfully!')));
        } else if (state is TaskFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error: ${state.errMessage}')));
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose Day', style: Styles.textStyle18),
                const ChooseDate(),
                const SizedBox(height: 20),
                CustomTextFormField(
                  name: 'Title',
                  titleController: titleController,
                  maxLines: 1,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  name: 'Description',
                  titleController: descriptionController,
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                const Time(),
                const SizedBox(height: 20),
                const Priority(),
                const SizedBox(height: 20),
                AddTaskButton(
                  createTask: () {
                    BlocProvider.of<TaskCubit>(context).createTask(
                      task: TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                      ),
                      userId: '22435898',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// BlocProvider.of<TaskCubit>(context).createTask(
//                       task: TaskModel(
//                         title: titleController.text,
//                         description: descriptionController.text,
//                       ),
//                       userId: '22435898',
//                     )