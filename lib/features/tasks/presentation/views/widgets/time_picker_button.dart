import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/styles.dart';

class TimePickerButton extends StatelessWidget {
  const TimePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: Styles.textStyle16,
        fixedSize: Size(MediaQuery.of(context).size.width * .43, 45),
        side: const BorderSide(color: Colors.grey, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      onPressed: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.watch_later_outlined),
          SizedBox(width: 5),
          Text('06:00 AM'),
        ],
      ),
    );
  }
}
