import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.titleController,
    required this.maxLines,
    required this.name,
  });

  final TextEditingController titleController;
  final int maxLines;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: name,
        floatingLabelStyle: Styles.textStyle20.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1, color: Colors.black),
        ),
      ),
      maxLines: maxLines,
    );
  }
}
