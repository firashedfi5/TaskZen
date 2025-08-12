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
