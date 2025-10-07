import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tralalelo_pra_ukk/theme/colors.dart';

class TaskStatsSection extends StatelessWidget {
  const TaskStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: _buildTaskStat(
            context: context,
            count: '12',
            label: 'Total',
            color: isDark
                ? AppColors.darkAccentBlue
                : AppColors.lightAccentBlue,
            icon: FontAwesomeIcons.listCheck,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildTaskStat(
            context: context,
            count: '8',
            label: 'Selesai',
            color: isDark
                ? AppColors.darkAccentGreen
                : AppColors.lightAccentGreen,
            icon: FontAwesomeIcons.circleCheck,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildTaskStat(
            context: context,
            count: '4',
            label: 'Pending',
            color: isDark
                ? AppColors.darkAccentOrange
                : AppColors.lightAccentOrange,
            icon: FontAwesomeIcons.clock,
          ),
        ),
      ],
    );
  }

  Widget _buildTaskStat({
    required BuildContext context,
    required String count,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
