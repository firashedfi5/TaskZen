import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String errMessage,
  required bool success,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errMessage),
      behavior: SnackBarBehavior.floating,
      backgroundColor: success == true ? Colors.green : Colors.red,
    ),
  );
}
