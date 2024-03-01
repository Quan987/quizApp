import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/quiz_data.dart';
import 'package:quiz_app/modules/main_route.dart';

void main() {
  runApp(
    ChangeNotifierProvider<QuizData>(
      create: (_) => QuizData(),
      child: const MainRoute(),
    ),
  );
}
