import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/service_locator.dart';

String formatTimeOfDay(TimeOfDay time) {
  final now = getIt.get<DateTime>();
  final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
}
