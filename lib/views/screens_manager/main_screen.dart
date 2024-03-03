import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';

class MainQuizScreen extends StatelessWidget {
  const MainQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Main Screen',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              onPressed: () => context.go(MyRoutes.accessFlashCard),
              child: const Text(
                'Access Flashcard',
              ),
            ),
            ElevatedButton(
              onPressed: () => context.go(MyRoutes.createFlashCard),
              child: const Text(
                'Create Flashcard',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
