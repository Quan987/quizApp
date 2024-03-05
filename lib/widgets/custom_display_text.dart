import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  const DisplayText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}
