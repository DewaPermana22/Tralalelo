import 'package:flutter/material.dart';
import 'package:tralalelo_pra_ukk/beranda/widgets/welcome_card.dart';
import 'package:tralalelo_pra_ukk/home/home_page.dart';
import 'package:tralalelo_pra_ukk/task/widgets/task_card.dart';
import 'package:tralalelo_pra_ukk/theme/colors.dart';

class BerandaBody extends StatelessWidget {
  const BerandaBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeCardWidget(),
          const SizedBox(height: 30),

          Text(
            'Today\'s Statistics',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context: context,
                  icon: Icons.list_alt,
                  title: 'Total Tasks',
                  value: '12',
                  color: isDark
                      ? AppColors.darkAccentBlue
                      : AppColors.lightAccentBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context: context,
                  icon: Icons.check_circle,
                  title: 'Completed',
                  value: '8',
                  color: isDark
                      ? AppColors.darkAccentGreen
                      : AppColors.lightAccentGreen,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  context: context,
                  icon: Icons.pending_actions,
                  title: 'Pending',
                  value: '4',
                  color: isDark
                      ? AppColors.darkAccentOrange
                      : AppColors.lightAccentOrange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  context: context,
                  icon: Icons.local_fire_department,
                  title: 'Streak',
                  value: '7',
                  color: isDark
                      ? AppColors.darkAccentRed
                      : AppColors.lightAccentRed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Recent Tasks
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Tasks',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to Task Page (index 1)
                  if (HomePage.of(context) != null) {
                    HomePage.of(context)!.changePage(1);
                  }
                },
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          const TaskCard(
            title: 'Learn Flutter State Management',
            category: 'Programming',
            time: '10:00 AM',
            date: 'Today',
            isDone: false,
            priority: 'High',
          ),
          const SizedBox(height: 12),
          const TaskCard(
            title: 'Team Development Meeting',
            category: 'Work',
            time: '02:00 PM',
            date: 'Today',
            isDone: true,
            priority: 'Medium',
          ),
          const SizedBox(height: 12),
          const TaskCard(
            title: 'Evening Exercise',
            category: 'Health',
            time: '05:00 PM',
            date: 'Today',
            isDone: false,
            priority: 'Low',
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.05),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
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
