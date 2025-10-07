import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({super.key});

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: colorScheme.primary, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              size: 16,
              color: colorScheme.onSurface.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          context: context,
          icon: FontAwesomeIcons.user,
          title: 'Edit Profile',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildMenuItem(
          context: context,
          icon: FontAwesomeIcons.lock,
          title: 'Change Password',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildMenuItem(
          context: context,
          icon: FontAwesomeIcons.circleQuestion,
          title: 'Help & Support',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildMenuItem(
          context: context,
          icon: FontAwesomeIcons.circleInfo,
          title: 'About',
          onTap: () {},
        ),
      ],
    );
  }
}
