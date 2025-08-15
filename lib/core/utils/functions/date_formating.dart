import 'package:flutter/material.dart';

String formatDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(const Duration(days: 1));
  final yesterday = today.subtract(const Duration(days: 1));
  final taskDate = DateTime(date.year, date.month, date.day);

  if (taskDate == today) {
    return 'Today';
  } else if (taskDate == tomorrow) {
    return 'Tomorrow';
  } else if (taskDate == yesterday) {
    return 'Yesterday';
  } else {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}';
  }
}

String dateFormat(DateTime date) {
  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  return '${weekdays[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}, ${date.year}';
}

String calculateDuration(TimeOfDay start, TimeOfDay end) {
  final startMinutes = start.hour * 60 + start.minute;
  final endMinutes = end.hour * 60 + end.minute;
  final durationMinutes = endMinutes - startMinutes;

  if (durationMinutes < 0) {
    // Handle next day scenario
    final actualDuration = (24 * 60) + durationMinutes;
    final hours = actualDuration ~/ 60;
    final minutes = actualDuration % 60;
    return '${hours}h ${minutes}m';
  }

  final hours = durationMinutes ~/ 60;
  final minutes = durationMinutes % 60;

  if (hours == 0) {
    return '${minutes}m';
  } else if (minutes == 0) {
    return '${hours}h';
  } else {
    return '${hours}h ${minutes}m';
  }
}
