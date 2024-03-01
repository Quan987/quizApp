import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';
import 'package:quiz_app/main_route.dart';

void main() {
  runApp(
    ChangeNotifierProvider<QuizDataList>(
      create: (_) => QuizDataList(),
      child: const MainRoute(),
    ),
  );
}
