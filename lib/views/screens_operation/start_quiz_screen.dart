import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/widgets/custom_loading.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late bool _isLoading;

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
    return _isLoading
        ? const LoadingScreen()
        : Column(
            children: [
              Text('Quiz Screen'),
              ElevatedButton(
                onPressed: () => context
                    .go('${MyRoutes.accessFlashCard}/${MyRoutes.scoreScreen}'),
                child: const Text('Go to Score Screen'),
              ),
            ],
          );
  }
}