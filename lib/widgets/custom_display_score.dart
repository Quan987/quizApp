import 'package:flutter/material.dart';
import 'package:quiz_app/models/card_question.dart';
import 'package:quiz_app/widgets/custom_display_text.dart';

class DisplayScore extends StatelessWidget {
  const DisplayScore({
    super.key,
    required this.quizTitle,
    required this.userAnswers,
    required this.quizData,
  });

  final String quizTitle;
  final List<String> userAnswers;
  final List<CardQuestion> quizData;

  List<Map<String, Object>> get quizSummary {
    final List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < userAnswers.length; i++) {
      summaryData.add(
        {
          'index': i,
          'question': quizData[i].question,
          'correct_answer': quizData[i].answers[0],
          'user_answer': userAnswers[i],
        },
      );
    }
    return summaryData;
  }

  String get userScore {
    int score = 0;
    for (int i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i] == quizData[i].answers[0]) {
        score++;
      }
    }
    return score.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          child: Text(
            'User score is: $userScore/${userAnswers.length}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
        ...quizSummary.map(
          (item) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 0),
                    child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        ((item['index'] as int) + 1).toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DisplayText('${item['question']}'),
                        DisplayText(
                            'Correct Answer: ${item['correct_answer']}'),
                        DisplayText('User Answer: ${item['user_answer']}'),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
