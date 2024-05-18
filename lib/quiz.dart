import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // @override
  // void initState() {
  //  activeScreen= StartScreen(switchScreen);
  //   super.initState();
  // }

  List<String> selectedAnswers = [];

  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // final screenWidget= activeScreen == 'start-screen'
    //      ? StartScreen(switchScreen)
    //      : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(chooseAnswer: chooseAnswer);
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(choosenAnswers:selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 100, 37, 210),
              Color.fromARGB(255, 102, 78, 143),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
