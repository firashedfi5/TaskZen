import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks/presentation/views/widgets/new_task_screen_body.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New task')),
      body: const NewTaskScreenBody(),
    );
  }
}
