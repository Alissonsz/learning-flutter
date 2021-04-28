import 'package:flutter/material.dart';
import 'question.model.dart';

enum Level { facil, medio, dificil, perito }

class Quiz {
  final String title;
  final List<Question> questions;
  final Image image;
  final Level level;
  final int questionsAnswered;

  Quiz({
    required this.title,
    required this.questions,
    required this.image,
    required this.level,
    this.questionsAnswered = 0,
  });
}
