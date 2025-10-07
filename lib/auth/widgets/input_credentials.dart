import 'package:flutter/material.dart';

class InputCredentials extends StatelessWidget {
  final String labelText;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const InputCredentials({
    super.key,
    required this.labelText,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: theme.textTheme.bodyLarge?.color,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: icon != null
            ? Icon(icon, size: 18, color: colorScheme.primary)
            : null,
        floatingLabelStyle: TextStyle(
          color: colorScheme.primary,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      validator: validator,
    );
  }
}
