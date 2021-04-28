import 'package:flutter/foundation.dart';

class ChallengeController {
  final questionNumberNotifier = ValueNotifier<int>(0);
  final selectedAnserNotifier = ValueNotifier<int>(-1);

  int totalRight = 0;

  int get questionIndex => questionNumberNotifier.value;
  set questionIndex(index) => questionNumberNotifier.value = index;

  int get selectedAnser => selectedAnserNotifier.value;
  set selectedAnser(index) => selectedAnserNotifier.value = index;

  set rightAnswered(value) => totalRight = value;
}
