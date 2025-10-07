import 'package:flutter/material.dart';

class WelcomeCardWidget extends StatelessWidget {
  const WelcomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primary, colorScheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome! 👋',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Manage your tasks efficiently today',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: colorScheme.onPrimary.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}