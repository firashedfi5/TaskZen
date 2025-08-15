import 'package:flutter/material.dart';

PopupMenuItem<String> buildStatusMenuItem(
  String value,
  String label,
  IconData icon,
  Color color,
  String status,
) {
  return PopupMenuItem<String>(
    value: value,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          if (status == value) Icon(Icons.check, size: 18, color: color),
        ],
      ),
    ),
  );
}
