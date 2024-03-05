import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/models/quiz_flashcard_list.dart';
import 'package:quiz_app/widgets/custom_loading.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class AccessFlashCard extends StatefulWidget {
  const AccessFlashCard({super.key});

  @override
  State<AccessFlashCard> createState() => _AccessFlashCardState();
}

class _AccessFlashCardState extends State<AccessFlashCard> {
  late bool _isLoading;
  String? _selectedValue;

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

  void _selectItem(String? value) {
    setState(() {
      _selectedValue = value!;
    });
  }

  void _beginQuiz() {
    if (_selectedValue == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Flashcard Unselected!',
          ),
          content: const Text(
            'Please select a flashcard before clicking \'Access Quiz\' button',
            style: TextStyle(color: Colors.red),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    } else {
      context.go(
        '${MyRoutes.accessFlashCard}/${MyRoutes.startQuiz}',
        extra: _selectedValue,
      );
      _selectedValue = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    QuizDataList quizData = context.watch<QuizDataList>();

    return _isLoading
        ? const LoadingScreen()
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Access Flashcard',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(40),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    buttonStyleData: ButtonStyleData(
                      elevation: 2,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white),
                    ),
                    isExpanded: true,
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: quizData.quizTitle
                        .map((String title) => DropdownMenuItem<String>(
                              value: title,
                              child: Text(title,
                                  style: const TextStyle(fontSize: 14)),
                            ))
                        .toList(),
                    value: _selectedValue,
                    onChanged: _selectItem,
                  ),
                ),
              ),
// Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 3),
                    onPressed: () => context.go(MyRoutes.mainQuizScreen),
                    child: const Text('Return to Main'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 3),
                    onPressed: () async {
                      _beginQuiz();
                    },
                    child: const Text('Access Quiz'),
                  ),
                ],
              ),
            ],
          );
  }
}
