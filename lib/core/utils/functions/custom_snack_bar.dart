import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String errMessage,
  required bool success,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errMessage,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: success == true ? Colors.green : Colors.red,
    ),
  );
}
