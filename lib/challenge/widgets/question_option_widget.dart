import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/app_images.dart';
import 'package:flutter_application_1/core/app_text_styles.dart';

class QuestionOptionWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;
  final VoidCallback onTap;

  QuestionOptionWidget(
      {required this.title,
      this.isRight = false,
      this.isSelected = false,
      required this.onTap});

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 72,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
                color: isSelected ? _selectedBorderRight : AppColors.border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style:
                    isSelected ? _selectedTextStyleRight : AppTextStyles.body,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? _selectedColorRight : AppColors.white,
                border: Border.fromBorderSide(
                  BorderSide(
                      color:
                          isSelected ? _selectedBorderRight : AppColors.border),
                ),
              ),
              child: isSelected
                  ? Icon(
                      _selectedIconRight,
                      color: AppColors.white,
                      size: 16,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
