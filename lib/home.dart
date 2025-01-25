import 'package:flutter/material.dart';
import 'package:quizzing/data/questions.dart';
import 'package:quizzing/screens/home_screen.dart';
import 'package:quizzing/screens/quiz_screen.dart';
import 'package:quizzing/screens/results_screen.dart';
import 'package:quizzing/screens/timeOut_screen.dart';

class Home extends StatefulWidget {
  Home({super.key, activeScreen});

  @override
  State<Home> createState() => _QuizState();
}

var activeScreen = "home";
var userName = "No Name";

class _QuizState extends State<Home> {
  List<String> answers = [];
  void getUserName(String name) {
    userName = name;
  }

  void saveAnswers(String answer) {
    answers.add(answer);
    if (answers.length == questions.length) {
      setState(
        () {
          activeScreen = "result";
        },
      );
    }
  }

  // void initState() {
  //   super.initState();
  //   activeScreen = HomeScreen(changeScreen);
  // }

  void changeScreen() {
    setState(() {
      activeScreen = "quiz";
    });
  }

  void onLeaderboard() {
    setState(() {
      activeScreen = "leaderboard";
    });
  }

  void onTimeOut() {
    setState(() {
      print(userName);
      activeScreen = "timeOut";
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "home";
      answers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget Screenwidget = HomeScreen(changeScreen, getUserName);
    if (activeScreen == "quiz") {
      Screenwidget = QuizScreen(
        getAnswers: saveAnswers,
        onTimeOut: onTimeOut,
      );
    } else if (activeScreen == "result") {
      Screenwidget = ResultsScreen(
        onRestart: restartQuiz,
        final_answers: answers,
        onLeaderboard: onLeaderboard,
      );
    } else if (activeScreen == "timeOut") {
      Screenwidget = TimeoutScreen(
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Screenwidget,
        ),
      ),
    );
  }
}
