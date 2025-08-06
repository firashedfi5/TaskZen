import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/functions/time_formating.dart';

class TaskModel {
  final int? id;
  final String? userId;
  final String? title;
  final String? description;
  final String? priority;
  final DateTime? date;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;

  TaskModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.priority,
    this.date,
    this.startTime,
    this.endTime,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'] as int?,
    userId: json['userId'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    priority: json['priority'] as String?,
    date: json['date'] as DateTime?,
    startTime: json['startTime'] as TimeOfDay?,
    endTime: json['endTime'] as TimeOfDay?,
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'priority': priority,
      'date': date?.toIso8601String().split('T').first,
      'startTime': formatTimeOfDay(startTime!),
      'endTime': formatTimeOfDay(endTime!),
    };
  }
}
