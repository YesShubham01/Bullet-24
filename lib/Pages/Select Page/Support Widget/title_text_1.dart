import 'package:flutter/material.dart';

class TitleBlueTint extends StatelessWidget {
  final String text;
  const TitleBlueTint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF0A2E68),
        fontSize: 26,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        height: 0,
      ),
    );
  }
}
