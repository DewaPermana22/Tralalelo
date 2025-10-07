import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
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
          CircleAvatar(
            radius: 50,
            backgroundColor: colorScheme.primary.withOpacity(0.2),
            child: Icon(
              FontAwesomeIcons.user,
              size: 40,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'john.doe@example.com',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildProfileStat(context, '24', 'Tasks'),
              Container(
                width: 1,
                height: 40,
                color: colorScheme.onSurface.withOpacity(0.2),
              ),
              _buildProfileStat(context, '18', 'Completed'),
              Container(
                width: 1,
                height: 40,
                color: colorScheme.onSurface.withOpacity(0.2),
              ),
              _buildProfileStat(context, '6', 'Pending'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStat(BuildContext context, String value, String label) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          value,
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
    );
  }
}
