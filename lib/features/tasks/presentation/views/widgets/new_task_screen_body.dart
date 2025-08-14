import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/core/utils/functions/custom_snack_bar.dart';
import 'package:task_management_app/core/utils/functions/task.dart';
import 'package:task_management_app/core/utils/styles.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/manager/new_task_cubit/new_task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/add_task_button.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/choose_date.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/custom_text_form_field.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/priority.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/time.dart';

class NewTaskScreenBody extends StatefulWidget {
  const NewTaskScreenBody({super.key, this.task});

  final TaskModel? task;

  @override
  State<NewTaskScreenBody> createState() => _NewTaskScreenBodyState();
}

class _NewTaskScreenBodyState extends State<NewTaskScreenBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      titleController.text = widget.task!.title!;
      descriptionController.text = widget.task!.description!;

      //! Initialize cubit with task data after first frame to ensure safe context access.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final cubit = BlocProvider.of<NewTaskCubit>(context);
        cubit.initializeWithTask(widget.task!);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewTaskCubit, NewTaskState>(
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
          customSnackBar(
            context: context,
            errMessage: state.successMessage,
            success: true,
          );
        } else if (state is TaskFailure) {
          Navigator.of(context).pop();
          customSnackBar(
            context: context,
            errMessage: state.errMessage,
            success: false,
          );
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Select Date', style: Styles.textStyle18),
                const ChooseDate(),
                const SizedBox(height: 20),
                CustomTextFormField(
                  name: 'Title',
                  titleController: titleController,
                  maxLines: 1,
                  validationText: 'Please enter a title',
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  name: 'Description',
                  titleController: descriptionController,
                  maxLines: 3,
                  validationText: 'Please enter a description',
                ),
                const SizedBox(height: 20),
                const Time(),
                const SizedBox(height: 20),
                const Priority(),
                const SizedBox(height: 20),
                AddTaskButton(
                  submit: () {
                    if (widget.task == null) {
                      createTask(
                        context,
                        _formKey,
                        titleController,
                        descriptionController,
                      );
                    } else {
                      updateTask(
                        context,
                        titleController,
                        descriptionController,
                      );
                    }
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
