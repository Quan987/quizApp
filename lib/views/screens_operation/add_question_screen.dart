import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/models/card_question.dart';
import 'package:quiz_app/widgets/custom_loading.dart';

class AddQuizQuestion extends StatefulWidget {
  const AddQuizQuestion({super.key});

  @override
  State<AddQuizQuestion> createState() => _AddQuizQuestionState();
}

class _AddQuizQuestionState extends State<AddQuizQuestion> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final List<CardQuestion> _cardQuestions = [];
  late bool _isLoading;
  final List<String> _questionAnswer = [];
  final SizedBox spacingBox = const SizedBox(height: 30);

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _cardQuestions.add(
        CardQuestion(
          _questionAnswer[0],
          List.of(_questionAnswer.getRange(1, _questionAnswer.length - 1)),
        ),
      );
      // print(cardQuestions[0].question);
      // print(cardQuestions[0].answers);
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Question created successfully!',
            textAlign: TextAlign.center,
          ),
          duration: Duration(seconds: 1),
        ),
      );
      _questionAnswer.clear();
      _formKey.currentState!.reset();
    }
  }

  void _addFinish() {
    if (_cardQuestions.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Card Empty'),
          content: const Text(
            'Please at least one set of question and answers.',
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
      context.pop(_cardQuestions);
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
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                    child: const Text(
                      'Add Question Screen',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter question'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a question';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _questionAnswer.add(value!);
                            },
                          ),
                          spacingBox,
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'Enter first answer (Correct Answer)'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an answer';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _questionAnswer.add(value!);
                            },
                          ),
                          spacingBox,
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter second answer'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an answer';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _questionAnswer.add(value!);
                            },
                          ),
                          spacingBox,
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter third answer'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an answer';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _questionAnswer.add(value!);
                            },
                          ),
                          spacingBox,
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter fourth answer'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an answer';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _questionAnswer.add(value!);
                            },
                          ),
                          spacingBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: _submitForm,
                                child: const Text('Add New Question'),
                              ),
                              ElevatedButton(
                                onPressed: _addFinish,
                                child: const Text('Finish'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
