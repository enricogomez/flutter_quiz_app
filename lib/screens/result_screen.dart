import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.selectedAnswers,
    required this.onPressed,
    super.key,
  });

  final List selectedAnswers;
  final Function() onPressed;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_number': i + 1,
        'question_text': questions[i].text,
        'correct_answer': questions[i].choices[0],
        'user_answer': selectedAnswers[i],
        'is_correct': questions[i].choices[0] == selectedAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final correctAnswers =
        summaryData.where((data) => data['is_correct'] == true).length;
    final answerCount = summaryData.length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You scored $correctAnswers out of $answerCount questions',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300.0,
              child: SingleChildScrollView(
                child: Column(
                    children: summaryData
                        .map((data) => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: data['is_correct'] == true
                                        ? Colors.green
                                        : const Color.fromARGB(
                                            255, 235, 108, 108),
                                  ),
                                  child: Text(
                                    data['question_number'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['question_text'] as String,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        data['user_answer'] as String,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        data['correct_answer'] as String,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.lightGreenAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ))
                        .toList()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(
                Icons.repeat,
                color: Colors.white,
              ),
              label: const Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
