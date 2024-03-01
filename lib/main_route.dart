import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/pages/main_quiz_screen.dart';
import 'package:quiz_app/pages/welcome_screen.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      name: 'Welcome Screen',
      path: MyRoutes.welcomeScreen,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      name: 'Main Screen',
      path: MyRoutes.mainQuizScreen,
      builder: (context, state) => const MainQuizScreen(),
    ),
  ],
);

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}