import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainQuizScreen extends StatelessWidget {
  const MainQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
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
                'Create Flashcard',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
