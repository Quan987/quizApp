import 'package:flutter/material.dart';
import 'package:quiz_app/models/card_question.dart';
import 'package:quiz_app/models/flashcard.dart';

class QuizDataList with ChangeNotifier {
  QuizDataList();

  late String cardName;
  late FlashCard flashCard;

  final Map<String, FlashCard> quizList = {
    // Flashcard 1
    'Fruit': const FlashCard(
      [
        CardQuestion(
          'Which fruit is known as the "king of fruits" and is famous for its strong odor?',
          [
            'Durian',
            'Mango',
            'Apple',
            'Banana',
          ],
        ),
        CardQuestion(
          'What color is the inside of a kiwifruit?',
          [
            'Red',
            'Yellow',
            'Green',
            'Orange',
          ],
        ),
        CardQuestion(
          'Which fruit is the primary source of Vitamin C?',
          [
            'Orange',
            'Banana',
            'Watermelon',
            'Grapes',
          ],
        ),
        CardQuestion(
          'What fruit is known for having its seeds on the outside?',
          [
            'Strawberry',
            'Peach',
            'Apple',
            'Pear',
          ],
        ),
        CardQuestion(
          'Which fruit is a hybrid of a pomelo and an orange?',
          [
            'Grapefruit',
            'Lemon',
            'Lime',
            'Tangerine',
          ],
        ),
      ],
    ),

    // Flashcard 2
    'Computer': const FlashCard(
      [
        CardQuestion(
          'What does CPU stand for in the context of computing?',
          [
            'Central Processing Unit',
            'Computer Personal Unit',
            'Central Performance Unit',
            'Control Processing Unit',
          ],
        ),
        CardQuestion(
          'Which of the following is a programming language designed for web development?',
          [
            'Python',
            'JavaScript',
            'C#',
            'Swift',
          ],
        ),
        CardQuestion(
          'What is the term for an error in a software program?',
          [
            'Bug',
            'Spider',
            'Virus',
            'Worm',
          ],
        ),
        CardQuestion(
          'Which data structure uses a FIFO (First In, First Out) method?',
          [
            'Stack',
            'Queue',
            'Array',
            'Linked List',
          ],
        ),
        CardQuestion(
          'What is the name of the process to convert source code into machine code?',
          [
            'Interpreting',
            'Compiling',
            'Executing',
            'Debugging',
          ],
        ),
      ],
    ),
  };

  List<String> get quizTitle => quizList.keys.toList();

  void addFlashCard(String cardName, FlashCard flashCard) {
    quizList[cardName] = flashCard;
    notifyListeners();
  }

  List<CardQuestion> getFlashcard(String title) {
    return quizList[title]!.oneFlashCard;
  }

  List<String> getAnswerShuffle(String title, int index) {
    final shuffleAnswer = List.of(quizList[title]!.oneFlashCard[index].answers);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}
