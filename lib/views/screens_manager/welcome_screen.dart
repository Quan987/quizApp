import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Welcome Screen',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          const Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: () => context.go(MyRoutes.mainQuizScreen),
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            child: const Text(
              'Start App',
            ),
          ),
        ],
      ),
    );
  }
}
