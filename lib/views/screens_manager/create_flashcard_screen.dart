import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/models/card_question.dart';
import 'package:quiz_app/models/flashcard.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';
import 'package:quiz_app/widgets/custom_loading.dart';

class CreateFlashCard extends StatefulWidget {
  const CreateFlashCard({super.key});

  @override
  State<CreateFlashCard> createState() => _CreateFlashCardState();
}

class _CreateFlashCardState extends State<CreateFlashCard> {
  late bool _isLoading;
  final _textController = TextEditingController();
  final SizedBox spacingBox = const SizedBox(height: 80);

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _createFlashCard() async {
    if (_textController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please Enter Flashcard Name!',
            style: TextStyle(color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    } else {
      FocusScope.of(context).unfocus();

      final List<CardQuestion>? questionList =
          await context.push<List<CardQuestion>>(
        '${MyRoutes.createFlashCard}/${MyRoutes.addQuizQuestion}',
      );

      print(_textController.text);
      print(questionList![0].question);
      print(questionList[0].answers);
      print(questionList);
      if (!mounted) {
        return;
      } else {
        Provider.of<QuizDataList>(context, listen: false)
            .addFlashCard(_textController.text, FlashCard(questionList));
        final someRan = Provider.of<QuizDataList>(context, listen: false)
            .quizList[_textController.text]
            ?.oneFlashCard[0]
            .question;
        final someRan2 = Provider.of<QuizDataList>(context, listen: false)
            .quizList[_textController.text]
            ?.oneFlashCard[0]
            .answers;
        print(someRan);
        print(someRan2);
        _textController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingScreen()
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  spacingBox,
                  const Text(
                    'Create Flashcard',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  spacingBox,
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Flashcard Name',
                      ),
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                    ),
                  ),
                  spacingBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go(MyRoutes.mainQuizScreen),
                        child: const Text('Return to Main'),
                      ),
                      ElevatedButton(
                        //
                        onPressed: _createFlashCard,
                        child: const Text('Create New'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
