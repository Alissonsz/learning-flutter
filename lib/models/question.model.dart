import 'answer.model.dart';

class Question {
  final String title;
  final List<Answer> answers;

  Question({required this.title, required this.answers})
      : assert(answers.length == 4);
}
