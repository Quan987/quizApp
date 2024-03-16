import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/models/card_question.dart';
import 'package:quiz_app/models/flashcard.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';
import 'package:quiz_app/widgets/custom_loading.dart';

class CreateFlashCard extends StatefulWidget {
  const CreateFlashCard({Key? key}) : super(key: key);

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
      if (!mounted) {
        return;
      } else {
        Provider.of<QuizDataList>(context, listen: false)
            .addFlashCard(_textController.text, FlashCard(questionList!));
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
            child: Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  children: [
                    // Background Image
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/quizbackground.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        spacingBox,
                        const Text(
                          'Create Flashcard',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        spacingBox,
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextFormField(
                            controller: _textController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Flashcard Name',
                              fillColor: Colors.grey[200],
                              filled: true,
                            ),
                            keyboardType: TextInputType.name,
                            maxLength: 10,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        spacingBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () => {
                                FocusScope.of(context).unfocus(),
                                context.go(MyRoutes.mainQuizScreen),
                              },
                              child: const Text(
                                'Return to Main',
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      Colors.black, // Set text color to black
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                backgroundColor: Colors.green,
                              ),
                              onPressed: _createFlashCard,
                              child: const Text(
                                'Create New',
                                style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      Colors.black, // Set text color to black
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
