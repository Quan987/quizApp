import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answer,
    required this.onClick,
    required this.space,
  });

  final String answer;
  final void Function() onClick;
  final SizedBox space;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            elevation: 3,
            minimumSize: const Size(200, 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(
            answer,
            textAlign: TextAlign.center,
          ),
        ),
        space,
      ],
    );
  }
}
