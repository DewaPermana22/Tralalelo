import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String category;
  final String time;
  final String date;
  final bool isDone;
  final String priority;

  const TaskCard({
    super.key,
    required this.title,
    required this.category,
    required this.time,
    required this.date,
    required this.isDone,
    required this.priority,
  });

  Color getPriorityColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    switch (priority.toLowerCase()) {
      case 'high':
      case 'tinggi':
        return isDark ? const Color(0xFFF87171) : const Color(0xFFEF4444);
      case 'medium':
      case 'sedang':
        return isDark ? const Color(0xFFFBBF24) : const Color(0xFFF59E0B);
      case 'low':
      case 'rendah':
        return isDark ? const Color(0xFF34D399) : const Color(0xFF10B981);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final priorityColor = getPriorityColor(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.white.withOpacity(0.1) : Colors.transparent,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.3)
                : Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isDone
                  ? (isDark ? const Color(0xFF34D399) : Colors.green)
                        .withOpacity(0.1)
                  : (isDark ? const Color(0xFFFBBF24) : Colors.orange)
                        .withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isDone ? FontAwesomeIcons.circleCheck : FontAwesomeIcons.clock,
              color: isDone
                  ? (isDark ? const Color(0xFF34D399) : Colors.green)
                  : (isDark ? const Color(0xFFFBBF24) : Colors.orange),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Category
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: (isDark ? const Color(0xFF60A5FA) : Colors.blue)
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: isDark ? const Color(0xFF60A5FA) : Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: priorityColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        priority,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: priorityColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      FontAwesomeIcons.clock,
                      size: 10,
                      color: colorScheme.onSurface.withOpacity(0.4),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            size: 16,
            color: colorScheme.onSurface.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
