import 'package:flutter/material.dart';
import 'package:flutter_application_1/challenge/widgets/button_widget.dart';
import 'package:flutter_application_1/challenge/widgets/question_option_widget.dart';
import 'package:flutter_application_1/congrats/congrats_page.dart';
import 'package:flutter_application_1/controllers/challenge_controller.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/core/app_text_styles.dart';
import 'package:flutter_application_1/models/question.model.dart';

class ChallengePage extends StatefulWidget {
  final String quizTitle;
  final List<Question> questions;

  ChallengePage({required this.questions, required this.quizTitle});

  final challengeController = ChallengeController();

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    widget.challengeController.questionNumberNotifier.addListener(() {
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
      widget.challengeController.selectedAnser = -1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                children: [
                  ValueListenableBuilder(
                    valueListenable:
                        widget.challengeController.questionNumberNotifier,
                    builder: (context, int value, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Questão ${value + 1}",
                            style: AppTextStyles.body,
                          ),
                          Text(
                            "de ${widget.questions.length}",
                            style: AppTextStyles.body,
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ValueListenableBuilder(
                    valueListenable:
                        widget.challengeController.questionNumberNotifier,
                    builder: (context, int value, _) {
                      return LinearProgressIndicator(
                        value: widget.challengeController.questionIndex +
                            1 / widget.questions.length,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.chartPrimary,
                        ),
                        backgroundColor: AppColors.chartSecondary,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        allowImplicitScrolling: false,
        children: widget.questions
            .map(
              (e) => Container(
                padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                child: Column(
                  children: [
                    Text(
                      e.title,
                      style: AppTextStyles.body20,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ValueListenableBuilder(
                      valueListenable:
                          widget.challengeController.selectedAnserNotifier,
                      builder: (context, int value, _) {
                        return Wrap(
                          runSpacing: 8,
                          children: e.answers
                              .asMap()
                              .map(
                                (i, element) => MapEntry(
                                  i,
                                  QuestionOptionWidget(
                                      title: e.answers[i].title,
                                      isRight: e.answers[i].isRight,
                                      isSelected: (value == i) ||
                                          (e.answers[i].isRight && value >= 0),
                                      onTap: () {
                                        widget.challengeController
                                            .selectedAnser = i;
                                        if (e.answers[i].isRight) {
                                          widget
                                              .challengeController.totalRight++;
                                        }
                                      }),
                                ),
                              )
                              .values
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ValueListenableBuilder(
              valueListenable:
                  widget.challengeController.questionNumberNotifier,
              builder: (context, int value, _) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: (value + 1 < widget.questions.length)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: ButtonWidget.white(
                                    label: "Pular", onTap: () {}),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                child: ButtonWidget.green(
                                  label: "Próximo",
                                  onTap: () => widget
                                          .challengeController.questionIndex =
                                      widget.challengeController.questionIndex +
                                          1,
                                ),
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ButtonWidget.green(
                                  label: "Finalizar quiz",
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CongratsPage(
                                          quizTitle: widget.quizTitle,
                                          totalQuestions:
                                              widget.questions.length,
                                          totalRightAnswers: widget
                                              .challengeController.totalRight),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ));
              }),
        ),
      ),
    );
  }
}
