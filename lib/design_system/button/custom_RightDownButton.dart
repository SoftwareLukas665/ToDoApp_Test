import 'package:flutter/material.dart';
import 'package:test_windows_projekt/design_system/variables/app_colors.dart';

class Button extends StatelessWidget {
  final String? text;
  final Icon? icon;
  //final bool isOnRightSide;
  final VoidCallback? onPressed; // Kann null sein, wenn Button deaktiviert ist

  const Button({
    super.key,
    this.text,
    this.icon,
    //this.isOnRightSide = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.elementBackgroundDark,
        borderRadius: BorderRadius.circular(20),
        elevation: 10.0,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(20),
          splashColor: AppColors.elementBackgroundDark,
          child: SizedBox(
            width: 80,
            height: 80,
            child: icon,
          ),
        ),
    );
  }
}
