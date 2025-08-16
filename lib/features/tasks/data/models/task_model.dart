import 'package:flutter/material.dart';
import 'package:task_management_app/core/utils/functions/time_formating.dart';
import 'package:task_management_app/core/utils/functions/time_parsing.dart';

class TaskModel {
  final int? id;
  final String? userId;
  final String? title;
  final String? description;
  final String? priority;
  final DateTime? date;
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final String? status;

  TaskModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.priority,
    this.date,
    this.startTime,
    this.endTime,
    this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'] as int?,
    userId: json['userId'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    priority: json['priority'] as String?,
    date: json['date'] != null ? DateTime.parse(json['date']) : null,
    startTime: json['startTime'] != null
        ? parseTimeString(json['startTime'])
        : null,
    endTime: json['endTime'] != null ? parseTimeString(json['endTime']) : null,
    status: json['status'] as String?,
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
      'status': status,
    };
  }

  TaskModel copyWith({
    int? id,
    String? userId,
    String? title,
    String? description,
    String? priority,
    String? status,
    DateTime? date,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    return TaskModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, \nuserId: $userId, \ntitle: $title, \ndescription: $description, \npriority: $priority, \nstatus: $status, \ndate: $date, \nstartTime: $startTime, \nendTime: $endTime)';
  }
}
