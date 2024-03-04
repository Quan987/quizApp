import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';
import 'package:quiz_app/views/main_route.dart';

void main() {
  runApp(
    ChangeNotifierProvider<QuizDataList>(
      create: (context) => QuizDataList(),
      child: const MainRoute(),
    ),
  );
}
