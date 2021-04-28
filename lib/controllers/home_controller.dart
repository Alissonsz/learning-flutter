import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/quiz.model.dart';
import 'package:flutter_application_1/models/user.model.dart';
import 'package:flutter_application_1/repositories/home_repository.dart';

enum HomeState { loading, error, success, empty }

class HomeController {
  User? user;
  List<Quiz>? quizes;
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  final repository = HomeRepository();

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  void getUser() async {
    this.state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    user = repository.getUser();
    this.state = HomeState.success;
  }

  void getQuizes() async {
    this.state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    quizes = repository.getQuizes();

    this.state = HomeState.success;
  }
}
