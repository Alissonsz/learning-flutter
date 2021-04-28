import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  LevelButtonWidget({required this.label})
      : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super();

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: color,
          border: Border.fromBorderSide(BorderSide(color: borderColor))),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.notoSans(
              color: AppColors.levelButtonTextFacil, fontSize: 13),
        ),
      ),
    );
  }
}
