import 'package:flutter/material.dart';
import 'package:test_windows_projekt/design_system/variables/app_colors.dart';
import 'package:test_windows_projekt/design_system/variables/app_text_styles.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final Icon? icon;
  //final bool isOnRightSide;
  final VoidCallback? onPressed; // Kann null sein, wenn Button deaktiviert ist

  const MainButton({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text ?? '', style: AppTextStyles.normalText),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.elementBackgroundMiddle,
        foregroundColor: AppColors.textPrimary,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        ),
        elevation: 0,
      ),
    );
  }
}