import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/data/routes_data.dart';
import 'package:quiz_app/views/widgets/custom_loading.dart';

class CreateFlashCard extends StatefulWidget {
  const CreateFlashCard({super.key});

  @override
  State<CreateFlashCard> createState() => _CreateFlashCardState();
}

class _CreateFlashCardState extends State<CreateFlashCard> {
  late bool _isLoading;

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
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingScreen()
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Create Flashcard',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Flashcard Name',
                  ),
                  keyboardType: TextInputType.name,
                  maxLength: 50,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => context.go(MyRoutes.mainQuizScreen),
                    child: const Text('Return to Main'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create New'),
                  ),
                ],
              ),
            ],
          );
  }
}
