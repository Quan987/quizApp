import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/models/card_question.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';
import 'package:quiz_app/widgets/custom_answer_button.dart';

import 'package:quiz_app/widgets/custom_loading.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late bool _isLoading;
  late String _cardTitle;
  final SizedBox _spacingBox = const SizedBox(height: 30);
  int _currentIndex = 0;
  List<String> userAnswer = [];

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  void _onSelect(String answer) {
    userAnswer.add(answer);
    if (userAnswer.length == QuizDataList().getFlashcard(_cardTitle).length) {
      context.go('${MyRoutes.accessFlashCard}/${MyRoutes.scoreScreen}',
          extra: [_cardTitle, userAnswer]);
      userAnswer = [];
      _currentIndex = 0;
      _cardTitle = '';
    } else {
      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _cardTitle = GoRouterState.of(context).extra! as String;
    List<CardQuestion> quizData = QuizDataList().getFlashcard(_cardTitle);

    return _isLoading
        ? const LoadingScreen()
        : Column(
            children: [
              Text(
                '$_cardTitle Quiz',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              _spacingBox,
              Container(
                constraints: const BoxConstraints(
                  minHeight: 120,
                  maxHeight: 160,
                  minWidth: 320,
                  maxWidth: 360,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.elliptical(10, 10),
                  ),
                  border:
                      Border.all(color: const Color.fromARGB(255, 93, 91, 91)),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    quizData[_currentIndex].question,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              _spacingBox,
// Answer button
              ...QuizDataList()
                  .getAnswerShuffle(_cardTitle, _currentIndex)
                  .map((item) {
                return AnswerButton(
                  onClick: () => _onSelect(item),
                  answer: item,
                  space: _spacingBox,
                );
              }),
            ],
          );
  }
}
