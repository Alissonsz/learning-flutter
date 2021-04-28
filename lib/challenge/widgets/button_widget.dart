import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color color;
  final Color borderColor;
  final VoidCallback onTap;

  ButtonWidget.green({required this.label, required this.onTap})
      : color = AppColors.darkGreen,
        textColor = AppColors.white,
        borderColor = AppColors.darkGreen;

  ButtonWidget.white({required this.label, required this.onTap})
      : color = AppColors.white,
        textColor = AppColors.grey,
        borderColor = AppColors.border;

  ButtonWidget.purple({required this.label, required this.onTap})
      : color = AppColors.purple,
        textColor = AppColors.white,
        borderColor = AppColors.purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w600, fontSize: 15),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: borderColor,
            ),
          ),
        ),
      ),
    );
  }
}
