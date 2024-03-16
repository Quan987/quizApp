import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:quiz_app/models/flashcard.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';
import 'package:quiz_app/widgets/custom_display_score.dart';
import 'package:quiz_app/widgets/custom_loading.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  late bool _isLoading;
  late String _quizTitle;
  late List<String> _userAnswers;
  FlashCard? _quizData;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeState = GoRouterState.of(context).extra! as List<Object>;
    _quizTitle = routeState[0] as String;
    _userAnswers = routeState[1] as List<String>;
    _quizData = context.watch<QuizDataList>().quizList[_quizTitle];

    return _isLoading
        ? const LoadingScreen()
        : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$_quizTitle\'s Quiz Score',
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),

// Displaying Answer Widget
                DisplayScore(
                  quizTitle: _quizTitle,
                  userAnswers: _userAnswers,
                  quizData: _quizData!,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 3),
                        onPressed: () => context.pop(),
                        child: const Text('Access Another Quiz'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
