import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/screens/quiz_screen.dart';
import 'package:flutter_quiz_app/screens/result_screen.dart';
import 'package:flutter_quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String childScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      childScreen = 'quiz-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        childScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      childScreen = 'start-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlueAccent,
              Colors.blueAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: childScreen == 'quiz-screen'
            ? QuizScreen(
                onSelectAnswer: chooseAnswer,
              )
            : childScreen == 'result-screen'
                ? ResultScreen(
                    selectedAnswers: selectedAnswers,
                    onPressed: restartQuiz,
                  )
                : StartScreen(switchScreen),
      ),
    );
  }
}
