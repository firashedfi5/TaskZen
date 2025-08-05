class TaskModel {
  final int? id;
  final String? userId;
  final String? title;
  final String? description;
  final String? priority;
  final DateTime? date;
  final DateTime? startTime;
  final DateTime? endTime;

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
    startTime: json['startTime'] as DateTime?,
    endTime: json['endTime'] as DateTime?,
  );
}
