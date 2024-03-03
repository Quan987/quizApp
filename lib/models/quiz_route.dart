import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/views/screens_manager/access_flashcard_screen.dart';
import 'package:quiz_app/views/screens_manager/create_flashcard_screen.dart';
import 'package:quiz_app/views/screens_manager/main_screen.dart';
import 'package:quiz_app/views/screens_manager/welcome_screen.dart';
import 'package:quiz_app/views/screens_operation/add_question_screen.dart';
import 'package:quiz_app/views/screens_operation/start_quiz.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class RouterModel {
  RouterModel();

  static final GoRouter quizRoute = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: MyRoutes.welcomeScreen,
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Quiz App',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.blue,
            ),
            body: child,
          );
        },
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
          GoRoute(
            name: 'Create Flash Card',
            path: MyRoutes.createFlashCard,
            builder: (context, state) => const CreateFlashCard(),
            routes: [
              GoRoute(
                name: 'Add Question',
                path: MyRoutes.addQuizQuestion,
                builder: (context, state) => const AddQuizQuestion(),
              ),
            ],
          ),
          GoRoute(
            name: 'Access Flash Card',
            path: MyRoutes.accessFlashCard,
            builder: (context, state) => const AccessFlashCard(),
            routes: [
              GoRoute(
                name: 'Quiz Screen',
                path: MyRoutes.startQuiz,
                builder: (context, state) => const QuizScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
