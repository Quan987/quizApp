import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/widgets/custom_loading.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Score'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: Text('Access Another Quiz'),
                  ),
                ],
              ),
            ],
          );
  }
}
