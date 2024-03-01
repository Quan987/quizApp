import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/models/quiz_data.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
          children: [
            const Text('Welcome Screen'),
            const Image(
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
            ElevatedButton(
              onPressed: () => context.go(mainQuizScreen),
              style: ElevatedButton.styleFrom(
                elevation: 5,
              ),
              child: const Text(
                'Start App',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
