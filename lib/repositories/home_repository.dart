import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/app_images.dart';
import 'package:flutter_application_1/models/answer.model.dart';
import 'package:flutter_application_1/models/question.model.dart';
import 'package:flutter_application_1/models/quiz.model.dart';
import 'package:flutter_application_1/models/user.model.dart';

class HomeRepository {
  User getUser() => User(
        name: "The pai",
        photoUrl:
            "https://pbs.twimg.com/profile_images/1294257751678386176/IanNdoNa_400x400.jpg",
        score: 0,
      );

  List<Quiz> getQuizes() => [
        Quiz(
          image: Image.asset(AppImages.laptop),
          level: Level.facil,
          title: "Quiz gamer",
          questionsAnswered: 0,
          questions: [
            Question(
              title: "Como ser gamer?",
              answers: [
                Answer(title: "Sendo gamer ue"),
                Answer(title: "Sendo corno"),
                Answer(title: "As duas acima", isRight: true),
                Answer(title: "Nenhuma"),
              ],
            ),
            Question(
              title: "Como ser corno?",
              answers: [
                Answer(title: "Sendo gamer ue", isRight: true),
                Answer(title: "Sendo corno"),
                Answer(title: "As duas acima"),
                Answer(title: "Nenhuma"),
              ],
            )
          ],
        ),
        Quiz(
          image: Image.asset(AppImages.blocks),
          level: Level.medio,
          title: "Quiz iradissimp",
          questionsAnswered: 0,
          questions: [
            Question(
              title: "Como ser irado?",
              answers: [
                Answer(title: "Sendo gamer ue"),
                Answer(title: "Sendo corno"),
                Answer(title: "As duas acima", isRight: true),
                Answer(title: "Nenhuma"),
              ],
            ),
            Question(
              title: "Como ser incrivel?",
              answers: [
                Answer(title: "Sendo gamer ue", isRight: true),
                Answer(title: "Sendo corno"),
                Answer(title: "As duas acima"),
                Answer(title: "Nenhuma"),
              ],
            )
          ],
        )
      ];
}
