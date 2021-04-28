import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/app_text_styles.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final Image image;
  final VoidCallback onTap;

  QuizCardWidget({
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 180,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            image,
            SizedBox(
              height: 24,
            ),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      completed,
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: LinearProgressIndicator(
                        value: percent,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.chartPrimary,
                        ),
                        backgroundColor: AppColors.chartSecondary,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
