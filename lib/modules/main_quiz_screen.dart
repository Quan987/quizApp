import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/models/quiz_data.dart';

class MainQuizScreen extends StatelessWidget {
  const MainQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Main Screen'),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Access Flashcard',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Access Flashcard',
            ),
          ),
        ],
      ),
    );
  }
}
