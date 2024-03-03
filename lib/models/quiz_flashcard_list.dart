import 'package:flutter/material.dart';
import 'package:quiz_app/models/card_question.dart';
import 'package:quiz_app/models/flashcard.dart';

class QuizDataList with ChangeNotifier {
  QuizDataList();

  late String cardName;
  late FlashCard flashCard;

  final Map<String, FlashCard> quizList = {
    // Flashcard 1
    'Flutter': const FlashCard(
      [
        CardQuestion(
          'What are the main building blocks of Flutter UIs?',
          [
            'Widgets',
            'Components',
            'Blocks',
            'Functions',
          ],
        ),
        CardQuestion(
          'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
          [
            'StatelessWidget',
            'StatefulWidget',
            'Both are equally good',
            'None of the above',
          ],
        ),
      ],
    ),

    // Flashcard 2
    'Fruits': const FlashCard(
      [
        CardQuestion(
          'What is the color of banana?',
          [
            'Yellow',
            'Red',
            'Blue',
            'Black',
          ],
        ),
        CardQuestion(
          'What is the color of apple?',
          [
            'Red',
            'Green',
            'Yellow',
            'White',
          ],
        ),
      ],
    ),
  };

  void addFlashCard(String cardName, FlashCard flashCard) {
    quizList[cardName] = flashCard;
    notifyListeners();
  }
}
