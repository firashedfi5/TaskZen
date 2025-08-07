import 'dart:developer';

import 'package:flutter/material.dart';

TimeOfDay? parseTimeString(String timeString) {
  if (timeString.isEmpty) return null;

  try {
    final parts = timeString.split(':');
    if (parts.length >= 2) {
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      return TimeOfDay(hour: hour, minute: minute);
    }
  } catch (e) {
    log('Error parsing time string: $timeString, Error: ${e.toString()}');
  }
  return null;
}
