import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Hey there,', style: Styles.textStyle16),
          Text(
            'Keep it Going!',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
