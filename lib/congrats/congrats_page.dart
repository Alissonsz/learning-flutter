import 'package:flutter/material.dart';
import 'package:flutter_application_1/challenge/widgets/button_widget.dart';
import 'package:flutter_application_1/core/app_images.dart';
import 'package:flutter_application_1/core/app_text_styles.dart';
import 'package:flutter_application_1/home/home_page.dart';
import 'package:flutter_application_1/home/widgets/level_button_widget.dart';
import 'package:share_plus/share_plus.dart';

class CongratsPage extends StatelessWidget {
  final String quizTitle;
  final int totalQuestions;
  final int totalRightAnswers;

  CongratsPage(
      {required this.quizTitle,
      required this.totalQuestions,
      required this.totalRightAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                Text(
                  "Você concluiu",
                  style: AppTextStyles.body,
                ),
                Text(
                  quizTitle,
                  style: AppTextStyles.heading15,
                ),
                Text(
                  "Com $totalRightAnswers de $totalQuestions acertos.",
                  style: AppTextStyles.body,
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  width: double.maxFinite,
                  child: ButtonWidget.purple(
                      label: "Compartilhar",
                      onTap: () {
                        Share.share(
                            "Olha só que bacana, acertei $totalRightAnswers de $totalQuestions no quiz $quizTitle!");
                      }),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 65),
                  width: double.maxFinite,
                  child: ButtonWidget.white(
                      label: "Voltar ao início",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
