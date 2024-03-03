import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/widgets/custom_loading.dart';

class AddQuizQuestion extends StatefulWidget {
  const AddQuizQuestion({super.key});

  @override
  State<AddQuizQuestion> createState() => _AddQuizQuestionState();
}

class _AddQuizQuestionState extends State<AddQuizQuestion> {
  late bool _isLoading;

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

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const LoadingScreen()
        : Column(
            children: [
              const Text('Add Question Screen'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Add Question'),
              ),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Finish'),
              ),
            ],
          );
  }
}
