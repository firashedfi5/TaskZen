import 'package:flutter/material.dart';
import 'package:task_management_app/features/calendar/presentation/views/widgets/calendar_screen_body.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CalendarScreenBody());
  }
}
