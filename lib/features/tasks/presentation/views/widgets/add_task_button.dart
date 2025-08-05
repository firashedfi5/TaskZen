import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.createTask});

  final void Function() createTask;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 45),
        backgroundColor: kSecondaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: Styles.textStyle16,
      ),
      onPressed: () {},
      child: const Text('Add Task'),
    );
  }
}
