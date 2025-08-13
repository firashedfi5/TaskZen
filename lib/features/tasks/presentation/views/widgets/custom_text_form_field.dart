import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.titleController,
    required this.maxLines,
    required this.name,
    required this.validationText,
  });

  final TextEditingController titleController;
  final int maxLines;
  final String name;
  final String validationText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationText;
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: name,
        floatingLabelStyle: Styles.textStyle20.copyWith(
          fontWeight: FontWeight.w500,
          // color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 1, color: Colors.black),
        ),
      ),
      maxLines: maxLines,
      maxLength: name == 'Description' ? 100 : 35,
    );
  }
}
