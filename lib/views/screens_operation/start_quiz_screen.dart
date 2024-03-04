import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';

import 'package:quiz_app/widgets/custom_loading.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late bool _isLoading;
  late String _cardTitle;

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

  @override
  Widget build(BuildContext context) {
    _cardTitle = GoRouterState.of(context).extra! as String;

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
                    QuizDataList().getFlashcard(_cardTitle)[0].question,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child:
                    Text(QuizDataList().getFlashcard(_cardTitle)[0].answers[1]),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => {
                  print(QuizDataList().getFlashcard(_cardTitle)),
                  print(QuizDataList().getFlashcard(_cardTitle)[0].question),
                  print(QuizDataList().getFlashcard(_cardTitle)[0].answers),
                },
                child: const Text('Return'),
              ),
            ],
          );
  }
}


// context.go('${MyRoutes.accessFlashCard}/${MyRoutes.scoreScreen}')
