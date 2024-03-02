import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/views/widgets/custom_loading.dart';

class AccessFlashCard extends StatefulWidget {
  const AccessFlashCard({super.key});

  @override
  State<AccessFlashCard> createState() => _AccessFlashCardState();
}

class _AccessFlashCardState extends State<AccessFlashCard> {
  late bool _isLoading;

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
    return _isLoading
        ? const LoadingScreen()
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Access Flashcard',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              // Method of Chosing FlashCard
              const Text('Choose Flashcard'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => context.go(MyRoutes.mainQuizScreen),
                    child: const Text('Return to Main'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Access Quiz'),
                  ),
                ],
              ),
            ],
          );
  }
}
