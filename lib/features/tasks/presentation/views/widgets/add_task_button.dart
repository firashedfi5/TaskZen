import 'package:flutter/material.dart';
import 'package:task_management_app/core/constants.dart';
import 'package:task_management_app/core/utils/styles.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.submit, this.updating = false});

  final VoidCallback submit;
  final bool updating;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 45),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: Styles.textStyle16,
      ),
      onPressed: submit,
      child: Text(updating == true ? 'Update Task' : 'Add Task'),
    );
  }
}
