import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({super.key});

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.green, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              size: 16,
              color: Colors.grey[400],
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
          icon: FontAwesomeIcons.user,
          title: 'Edit Profile',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildMenuItem(
          icon: FontAwesomeIcons.lock,
          title: 'Change Password',
          onTap: () {},
        ),
        // const SizedBox(height: 12),
        // _buildMenuItem(
        //   icon: FontAwesomeIcons.bell,
        //   title: 'Notifications',
        //   onTap: () {},
        // ),
        const SizedBox(height: 12),
        _buildMenuItem(
          icon: FontAwesomeIcons.circleQuestion,
          title: 'Help & Support',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _buildMenuItem(
          icon: FontAwesomeIcons.circleInfo,
          title: 'About',
          onTap: () {},
        ),
      ],
    );
  }
}
