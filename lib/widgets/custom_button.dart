import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? borderRadius;
  final double? elevation;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isLoading;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.height = 50,
    this.borderRadius = 8,
    this.elevation = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBgColor =
        backgroundColor ?? Theme.of(context).colorScheme.primary;
    final Color effectiveFgColor =
        foregroundColor ?? Theme.of(context).colorScheme.onPrimary;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        elevation: elevation,
        shadowColor: Colors.transparent,
        backgroundColor: effectiveBgColor,
        foregroundColor: effectiveFgColor,
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(effectiveFgColor),
              ),
            )
          : icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: fontSize! + 4, color: effectiveFgColor),
                    const SizedBox(width: 8),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: effectiveFgColor,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: effectiveFgColor,
                    fontFamily: 'Poppins',
                  ),
                ),
    );
  }
}
