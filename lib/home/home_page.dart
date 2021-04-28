import 'package:flutter/material.dart';
import 'package:flutter_application_1/challenge/challenge_page.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/core/app_colors.dart';
import 'package:flutter_application_1/home/widgets/app_bar_widget.dart';
import 'package:flutter_application_1/home/widgets/level_button_widget.dart';
import 'package:flutter_application_1/home/widgets/quiz_card_widget.dart';

const quizes = {
  "gamer": {"name": "Gamerzao"}
};

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.getUser();
    _homeController.getQuizes();

    _homeController.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _homeController.stateNotifier.value == HomeState.success
          ? Scaffold(
              appBar: AppBarWidget(
                user: _homeController.user!,
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LevelButtonWidget(
                            label: "Fácil",
                          ),
                          LevelButtonWidget(
                            label: "Médio",
                          ),
                          LevelButtonWidget(
                            label: "Difícil",
                          ),
                          LevelButtonWidget(
                            label: "Perito",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: _homeController.quizes!
                              .map(
                                (e) => QuizCardWidget(
                                  title: e.title,
                                  image: e.image,
                                  percent:
                                      e.questionsAnswered / e.questions.length,
                                  completed:
                                      '${e.questionsAnswered} de ${e.questions.length}',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChallengePage(
                                          questions: e.questions,
                                          quizTitle: e.title,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Container(
              color: AppColors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
